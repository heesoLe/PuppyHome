package shop.puppyhome.controller_admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.AdminDAOImpl;
import shop.puppyhome.vo.MemberVO;

public class MListContOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text.html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		
		int page = 1; 
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
				
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_birth = request.getParameter("user_birth");
		String postCode = request.getParameter("postCode");
		String roadAddr = request.getParameter("roadAddr");
		String detailAddr = request.getParameter("detailAddr");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");
		
		MemberVO mv = new MemberVO();
		
		// Controller 에서 모델 DAO로 여러개의 값을 하나의 객체로 만들어서 효율적으로 한꺼번에 전달함. 
		mv.setUser_id(user_id);
		mv.setUser_name(user_name);
		mv.setUser_birth(user_birth);
		mv.setPostCode(postCode);
		mv.setRoadAddr(roadAddr);
		mv.setDetailAddr(detailAddr);
		mv.setUser_email(user_email);
		mv.setUser_phone(user_phone);
		
		AdminDAOImpl adao = new AdminDAOImpl();
		int re = adao.contOKMem(mv); // 1-3. 회원 수정 저장
		
		if(re == 1) {
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mlist.shop");
			return forward;
		}
		return null;
	}

}
