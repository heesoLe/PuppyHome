package shop.puppyhome.controller_mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MyPageDAOImpl;
import shop.puppyhome.vo.MemberVO;

public class UserWithdrawalOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('다시 로그인하세요')");
			out.println("location='member_login.shop';");
			out.println("</script>");
		} else {
			request.setCharacterEncoding("UTF-8");

			
			String user_pwd = request.getParameter("user_pwd");
			//String new_pwd_check = request.getParameter("new_pwd_check");

			MyPageDAOImpl mdao = new MyPageDAOImpl();
			MemberVO m = new MemberVO();
			m.setUser_id(id); m.setUser_pwd(user_pwd);
			int result = mdao.pwdCheck(id, user_pwd);
			
		if(result==1) {
				mdao.delMember(m);
				out.println("<script>");
				out.println("alert('회원탈퇴 완료')");
				session.invalidate();
				out.println("location='main_product.shop';");	
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('비밀번호를 다시 확인하세요');");
				out.println("history.back();");				
				out.println("</script>");	
			} //inner if else

		}//outer if else
		return null;
	}

}
