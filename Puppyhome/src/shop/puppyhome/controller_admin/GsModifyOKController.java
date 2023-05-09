package shop.puppyhome.controller_admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.ProductDAOImpl;
import shop.puppyhome.vo.ProductVO;

public class GsModifyOKController implements Action {

	// 수정 완료
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();

		String product_title = request.getParameter("product_title");
		int product_price = Integer.parseInt(request.getParameter("product_price"));
		String product_maker = request.getParameter("product_maker");
		String product_type = request.getParameter("product_type");
		String product_cont = request.getParameter("product_cont1") + ","
							+ request.getParameter("product_cont2") + ","
							+ request.getParameter("product_cont3");
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		
		
		ProductVO p = new ProductVO();
		p.setProduct_title(product_title);
		p.setProduct_price(product_price);
		p.setProduct_maker(product_maker);
		p.setProduct_type(product_type);
		p.setProduct_cont(product_cont);
		p.setProduct_no(product_no);

		ProductDAOImpl pdao = new ProductDAOImpl();

		int re = pdao.updateProduct(p); // 상품 수정 업로드
		
		if (re == 1) {
			out.println("<script>");
			out.println("alert('상품이 수정 되었습니다.');");
			out.println("location='gslist.shop'");
			out.println("</script>");
		} else {
			System.out.print("수정이 되지 않았습니다.");
		}

		return null;
	}

}
