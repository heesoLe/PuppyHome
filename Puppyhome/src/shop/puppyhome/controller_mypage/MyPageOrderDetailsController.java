package shop.puppyhome.controller_mypage;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MemberDAOImpl;
import shop.puppyhome.vo.MemberVO;
import shop.puppyhome.vo.ProductVO;

public class MyPageOrderDetailsController implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    HttpSession session = request.getSession();
	    MemberDAOImpl mdao = new MemberDAOImpl();
	    
	    String id = (String)session.getAttribute("id");
	    
	    if(id == null) {
	       out.println("<script>");
	       out.println("alert('다시 로그인 하세요!');");
	       out.println("location='member_login.shop';"); // 새로고침하려면 Location.reload()함수 써야함
	       out.println("</script>");
	    } else {
			MemberVO m = mdao.getMember(id); // 세션에 담긴 값에 대한 회원 정보를 오라클 db로부터 가져온다.
			//List<ProductVO> getPList(ProductVO findP)
	       request.setAttribute("m", m); //
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/mypage/myPage_orderDetails.jsp"); // 뷰페이지 경로 설정.
		
		return forward;
	    }
	    return null;
	}

}
