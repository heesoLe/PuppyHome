package shop.puppyhome.controller_member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;

public class MemberJoinController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	
		//String[] phone = {"010","011"};
		//String[] email = {"선택","naver.com","daum.net","nate.com","google.co.kr","직접입력"};
		//폰과 이메일 배열을 생성
		
		//request.setAttribute("phone",phone);//phone속성 키이름에 Object타입으로 phone배열값을 저장.관례적으로
		//속성키이름과 값객체는  이름을 같게한다.
		//request.setAttribute("email",email);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./page/member/signup.jsp");
		return forward;
	}
}





