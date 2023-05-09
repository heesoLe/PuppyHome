package shop.puppyhome.controller_admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.AdminDAOImpl;
import shop.puppyhome.vo.CSVO;

public class CSBoardContController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int client_no = Integer.parseInt(request.getParameter("client_no")); 
		int page =1;
		
		String state = request.getParameter("state"); //내용보기
		
		AdminDAOImpl adao = new AdminDAOImpl();
		/*if(state.equals("cont")){ //내용보기 일때만 조회 수 증가
			adao.updateHit("client_no");
		}*/
		
		CSVO vo = adao.getClientCont(client_no); // 2-2. 문의 게시판 : 내용보기 
		String client_cont = vo.getClient_cont().replace("\n", "<p>"); 
		// textarea에서 글내용 입력할때 엔터키를 친 부분은 다음 줄로 줄 바꿈해서 보여준다.
		
		request.setAttribute("vo", vo);
		request.setAttribute("client_cont", client_cont);
		request.setAttribute("page", page);
		request.setAttribute("client_cont_reply", vo.getClient_cont_reply());
		
		ActionForward forward = new ActionForward(); 
		forward.setRedirect(false);
		
		if(state.equals("cont")) {
			forward.setPath("./page/admin/aCSBoard_cont.jsp"); //내용보기
		}else if(state.equals("reply")) {
			forward.setPath("./page/admin/aCSBoard_reply.jsp"); //답변글
		}
		return forward;
	}

}
