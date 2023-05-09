package shop.puppyhome.controller_CS;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.CSDAOImpl;
import shop.puppyhome.vo.CSClientVO;
import shop.puppyhome.vo.CSFAQVO;

public class CSContactController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
	
		
		CSDAOImpl cdao = new CSDAOImpl();
		List<CSClientVO> clist = cdao.getCSClientList();
		/*List<CSClientVO> rlist = cdao.getCSClientReplyList();*/
		
		request.setAttribute("clist", clist);
		/*request.setAttribute("rlist", rlist);*/
		System.out.println(clist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/cs/contact.jsp");
		return forward;
	}

}
