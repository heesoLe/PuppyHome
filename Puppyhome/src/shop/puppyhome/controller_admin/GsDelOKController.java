package shop.puppyhome.controller_admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.MyPageDAOImpl;
import shop.puppyhome.dao.ProductDAOImpl;

public class GsDelOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String id = (String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('상품 삭제 되었습니다.')");
			out.println("location='gslist.shop'");
			out.println("</script>");
		} else {
			request.setCharacterEncoding("UTF-8");
			
			int product_no = Integer.parseInt(request.getParameter("product_no"));
			
			ProductDAOImpl pdao = new ProductDAOImpl();
			
			pdao.delProduct(product_no);
			
			out.println("<script>");
			out.println("location='gslist.shop';");	
			out.println("</script>");
		}
		return null;
	}

}
