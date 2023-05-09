package shop.puppyhome.controller_product;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.ProductDAOImpl;
import shop.puppyhome.vo.ProductVO;

public class ProductRegisterOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String product_title = request.getParameter("product_title");
		int product_price = Integer.parseInt(request.getParameter("product_price"));
		String product_maker = request.getParameter("product_maker");
		String product_type = request.getParameter("product_type");
		String product_cont = request.getParameter("product_cont1")+","+request.getParameter("product_cont2")+","+request.getParameter("product_cont3");
		
		// 검색 기능
		//String find_name = request.getParameter("find_name");
		//String find_field = request.getParameter("find_field");
		
		ProductVO p = new ProductVO();
		p.setProduct_title(product_title);
		p.setProduct_price(product_price);
		p.setProduct_maker(product_maker);
		p.setProduct_type(product_type);
		p.setProduct_cont(product_cont);
		//p.setFind_name(find_name);
		//p.setFind_field(find_field);

		ProductDAOImpl pdao = new ProductDAOImpl();

		int re = pdao.insertProduct(p);// 상품저장
		
		if (re == 1) {
			out.println("<script>");
			out.println("alert('상품등록이 완료되었습니다.');");
			out.println("location='gslist.shop'");
			out.println("</script>");
		}
		return null;
	}
}
