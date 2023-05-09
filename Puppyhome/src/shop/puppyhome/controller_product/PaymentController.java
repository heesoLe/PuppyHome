package shop.puppyhome.controller_product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.ProductDAOImpl;
import shop.puppyhome.vo.BasketVO;
import shop.puppyhome.vo.MemberVO;
import shop.puppyhome.vo.OrderVO;
import shop.puppyhome.vo.ProductVO;

public class PaymentController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스 입니다.');");
			out.println("location='member_login.shop';");
			out.println("</script>");
		} else {
			request.setCharacterEncoding("UTF-8");
			
			String product_title = request.getParameter("product_title");
			int product_price = Integer.parseInt(request.getParameter("product_price"));
			int product_cnt = Integer.parseInt(request.getParameter("product_cnt"));
			int total_price = Integer.parseInt(request.getParameter("total_price"));
			
			request.setAttribute("product_title", product_title);
			request.setAttribute("product_price", product_price);
			request.setAttribute("product_cnt", product_cnt);
			request.setAttribute("total_price", total_price);

			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./page/product/payment.jsp"); // 뷰페이지 경로 설정.
			
			return forward;

			//out.println("<script>");
			//out.println("location='payment.jsp';");	
			//out.println("</script>");
		}
		return null;

	}
	
}