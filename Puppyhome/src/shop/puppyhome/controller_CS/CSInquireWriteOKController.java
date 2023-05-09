package shop.puppyhome.controller_CS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.CSDAOImpl;
import shop.puppyhome.vo.CSClientVO;

public class CSInquireWriteOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String client_category = request.getParameter("client_category");
		String client_title = request.getParameter("reg-title");
		String client_cont = request.getParameter("editordata");
		
		
		
		CSClientVO c= new CSClientVO();
		c.setUser_id(user_id);
		c.setClient_category(client_category);
		c.setClient_title(client_title);
		c.setClient_cont(client_cont);
		
		CSDAOImpl cdao= new CSDAOImpl();
		cdao.insertInquire(c);//문의 저장
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cs_contact.shop");
		
		return forward;
	}

}
