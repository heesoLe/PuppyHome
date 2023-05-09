package shop.puppyhome.controller_mypage;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MyPageDAOImpl;
import shop.puppyhome.vo.OrderVO;

public class OrderCancelController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		//MemberDAOImpl mdao = new MemberDAOImpl(); 
		MyPageDAOImpl mdao = new MyPageDAOImpl();

		String id = (String)session.getAttribute("id");

		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='member_login.shop';"); // 새로고침하려면 Location.reload()함수 써야함
			out.println("</script>");
		} else {
			List<OrderVO> olist = mdao.getOList(id);
			request.setAttribute("olist", olist);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./page/mypage/myPage_orderCancel.jsp"); // 뷰페이지 경로 설정.

			return forward;
		}
		return null;
	}
}
