package shop.puppyhome.controller_CS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.CSDAOImpl;
import shop.puppyhome.vo.CSNoticeVO;

public class AddOKCSNoticeController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String notice_title=request.getParameter("notice_title");
		String notice_cont=request.getParameter("notice_cont");
		
		
		CSNoticeVO c=new CSNoticeVO();
		c.setNotice_title(notice_title);
		c.setNotice_cont(notice_cont);
		
		CSDAOImpl cdao=new CSDAOImpl();
		cdao.insertnotice(c);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cs_notice.shop");
		
		return forward;
	}

}
