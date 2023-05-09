package shop.puppyhome.controller_member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;

public class MemberFindPwController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기존 매핑주소 값을 ?���??���?,?��?��?��?��름과 값도 ?���??��?��.
		forward.setPath("./page/member/find_pw.jsp");
		return forward;
	}
}





