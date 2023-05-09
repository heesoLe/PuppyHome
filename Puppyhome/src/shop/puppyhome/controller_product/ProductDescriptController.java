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
import shop.puppyhome.vo.ProductVO;

public class ProductDescriptController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		ProductDAOImpl pdao = new ProductDAOImpl();
		
		String product_title = request.getParameter("product_title");
		ProductVO p = pdao.getProduct(product_title);
		
		request.setAttribute("p", p);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/product/productDescript.jsp"); // 뷰페이지 경로 설정.
		
		return forward;
		
		
	}

}
