package shop.puppyhome.controller_admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.AdminDAOImpl;
import shop.puppyhome.vo.CSVO;

public class CSBoardReplyOKController implements Action {

	// 문의 게시판 답글
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("UTF-8");

		int client_no = Integer.parseInt(request.getParameter("client_no"));
		String client_title = request.getParameter("client_title");
		String client_cont = request.getParameter("client_cont");
		String user_id = request.getParameter("user_id");
		String client_category = request.getParameter("client_category");
		String client_cont_reply = request.getParameter("client_cont_reply");
		
		CSVO cv = new CSVO();

		// 컨트롤러에서 모델 DAO로 여러개의 값을 하나의 객체로 만들어서 효율적으로 한꺼번에 전달함.
		cv.setClient_no(client_no);
		cv.setClient_title(client_title);
		cv.setClient_cont(client_cont);
		cv.setClient_category(client_category);
		cv.setUser_id(user_id);
		cv.setClient_cont_reply(client_cont_reply);	
		
		AdminDAOImpl adao = new AdminDAOImpl();
		adao.replyBoard(cv);// 2-2.문의게시판 : 답변 저장		
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("csboard.shop");
		return forward;
	}

}
