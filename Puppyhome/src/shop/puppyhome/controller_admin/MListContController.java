package shop.puppyhome.controller_admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.AdminDAOImpl;
import shop.puppyhome.vo.MemberVO;

public class MListContController implements Action {

	// 회원 게시판 -> 회원 수정폼 이동
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//회원 게시판
		String user_id = request.getParameter("user_id"); 
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String state = request.getParameter("state"); // state 가 cont 이면 내용보기, reply 답변글폼, edit 수정폼
		
		AdminDAOImpl adao = new AdminDAOImpl();		
		MemberVO mv = adao.getMemCont(user_id); // 1-2. 회원게시판 : 아이디에 해당하는 회원 정보 가져오기
		
		request.setAttribute("mv", mv);
		request.setAttribute("page", page);
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/admin/aMlist_cont.jsp"); // 회원 수정 폼 페이지 경로 설정.
		
		return forward;
	}

}
