package shop.puppyhome.controller_CS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.CSDAOImpl;
import shop.puppyhome.vo.CSFAQVO;

public class AddFAQOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String faq_category=request.getParameter("faq_category");
		String faq_title=request.getParameter("faq_title");
		String faq_cont=request.getParameter("faq_cont");
		
		
		CSFAQVO c=new CSFAQVO();
		c.setFaq_title(faq_title);
		c.setFaq_cont(faq_cont);
		c.setFaq_category(faq_category);
		
		CSDAOImpl cdao=new CSDAOImpl();
		cdao.insertfaq(c);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cs_FAQ.shop");
		
		return forward;	}

}
