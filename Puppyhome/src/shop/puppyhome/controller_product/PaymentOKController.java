package shop.puppyhome.controller_product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MyPageDAOImpl;
import shop.puppyhome.dao.ProductDAOImpl;
import shop.puppyhome.vo.MemberVO;
import shop.puppyhome.vo.OrderVO;

public class PaymentOKController implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('다시 로그인하세요')");
			out.println("location='member_login.shop';");
			out.println("</script>");
		} else {
			request.setCharacterEncoding("UTF-8");

			String order_rec = request.getParameter("order_rec");
			String postCode = request.getParameter("postCode");
			String roadAddr = request.getParameter("roadAddr");
			String detailAddr = request.getParameter("detailAddr");
			String user_phone = request.getParameter("user_phone");

			String product_title = request.getParameter("product_title");
			int product_price = Integer.parseInt(request.getParameter("product_price"));
			int product_cnt = Integer.parseInt(request.getParameter("product_cnt"));
			int total_price = Integer.parseInt(request.getParameter("total_price"));
			
			ProductDAOImpl pdao = new ProductDAOImpl();

			OrderVO o = new OrderVO();
			
			o.setUser_id(id);
			o.setOrder_rec(order_rec);
			o.setPostCode(postCode);
			o.setRoadAddr(roadAddr);
			o.setDetailAddr(detailAddr);
			o.setUser_phone(user_phone);
			o.setProduct_title(product_title);
			o.setProduct_price(product_price);
			o.setOrder_cnt(product_cnt);
			o.setTotal_price(total_price);

			int re = pdao.insertOrder(o);

			if(re == 1) {
				out.println("<script>");
				out.println("location='mypagemain.shop';");	
				out.println("</script>");
			}
		}
		return null;
	}
}
