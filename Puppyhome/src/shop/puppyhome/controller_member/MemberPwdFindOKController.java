package shop.puppyhome.controller_member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MemberDAOImpl;
import shop.puppyhome.vo.MemberVO;

public class MemberPwdFindOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		//브라우저에 출력되는 문자/태그 언어코딩 타입을 설정
		PrintWriter out=response.getWriter();//출력 스트림 생성
		MemberDAOImpl mdao=new MemberDAOImpl();
		MemberVO m=new MemberVO();
		
		
		request.setCharacterEncoding("UTF-8");//post방식으로 전달된 한글을 안깨지게 한다.
		
		String pwd_id = request.getParameter("pwd_id");
		String pwd_name = request.getParameter("pwd_name");
		String pwd_email = request.getParameter("pwd_email");
		m.setUser_id(pwd_id); m.setUser_name(pwd_name); m.setUser_email(pwd_email);
		
		MemberVO pm=mdao.pwdMember(m);//아이디와 회원이름을 기준으로 오라클로 부터 회원정보를 검색
		
		if(pm == null) {
			out.println("<script>");
			out.println("alert('회원정보를 찾을 수 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			
			out.println("<script>");
			out.println("alert('비밀번호 : "+pm.getUser_pwd()+"');");
			out.println("history.back();");
			out.println("</script>");
			
		}
		return null;
	}
}






