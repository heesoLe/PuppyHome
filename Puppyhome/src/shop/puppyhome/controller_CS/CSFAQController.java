package shop.puppyhome.controller_CS;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.CSDAOImpl;
import shop.puppyhome.vo.CSFAQVO;

public class CSFAQController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String faq_category = null;
		faq_category = request.getParameter("faq_category");
		
		CSDAOImpl cdao = new CSDAOImpl();
		List<CSFAQVO> clist = cdao.getCSFAQList(faq_category);
		
		request.setAttribute("clist", clist);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/cs/FAQ.jsp");
		return forward;
	}

}
