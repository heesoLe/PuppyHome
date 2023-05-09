package shop.puppyhome.controller_member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MemberDAOImpl;
import shop.puppyhome.vo.MemberVO;

public class MemberJoinOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
	
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_name = request.getParameter("user_name");
		String user_birth = request.getParameter("user_birth");
		String postCode = request.getParameter("postCode");
		String roadAddr = request.getParameter("roadAddr");
		String detailAddr = request.getParameter("detailAddr");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");
		
		
		MemberVO m=new MemberVO();
		
		
		
	   			
	     m.setUser_id(user_id); m.setUser_pwd(user_pwd); m.setUser_name(user_name); m.setUser_birth(user_birth);
	     m.setPostCode(postCode); m.setRoadAddr(roadAddr); m.setDetailAddr(detailAddr);
	     m.setUser_email(user_email); m.setUser_phone(user_phone);
	     
	     MemberDAOImpl mdao=new MemberDAOImpl();
	     
	     
	     int re=mdao.insertMember(m);//회원 저장
	     
	     if(re==1) {
	    	 ActionForward forward=new ActionForward();
	    	 forward.setRedirect(true);//새로운 매핑주소로 이동
	    	 out.println("<script>");
	            out.println("alert('회원가입 완료 되었습니다.');");
	            out.println("location.href='member_login.shop'");
	            out.println("</script>");
	    	 
	     }
		return null;
	}
}







