package shop.puppyhome.controller_member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MemberDAOImpl;
import shop.puppyhome.vo.MemberVO;

public class MemberLoginOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String login_id = request.getParameter("login_id");
		String login_pwd = request.getParameter("login_pwd");
		String check = request.getParameter("checkId");

		MemberDAOImpl mdao = new MemberDAOImpl();
		MemberVO dm = mdao.loginCheck(login_id); //로그인 인증

		if(dm == null) {
			out.println("<script>");
			out.println("alert('가입되지 않은 회원입니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!dm.getUser_pwd().equals(login_pwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.')");
				out.println("history.go(-1);");
				out.println("</script>");

			}else {
				HttpSession session = request.getSession(); //세션 객체 생성
				session.setAttribute("id", login_id);//세션 id 속성키 이름에 아이디를 저장

				if(check != null) {

					Cookie idMemory = new Cookie("remember_id",login_id);
					idMemory.setMaxAge(300);
					response.addCookie(idMemory);
				} 

				if(check == null) {
					Cookie idMemory = new Cookie("remember_id",login_id);
					idMemory.setMaxAge(0);
					response.addCookie(idMemory);
				}

				/* 세션의 특징)
				 *  1. 세션값은 서버쪽에 저장되고 보안이 좋다.
				 *  2. 클라이언트 쪽인 브라우저 저장소에 저장되는 것이 아니다. 브라우저 쪽에 저장되는 것은 쿠키
				 *  3. 쿠키보다는 속도가 느리지만 보안성은 더 우수하다.
				 */
				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("main_product.shop"); //메인화면으로 이동
				return forward;

			}
		}

		return null;
	}
}