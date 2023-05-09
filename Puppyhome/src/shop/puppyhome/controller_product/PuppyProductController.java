package shop.puppyhome.controller_product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.ProductDAOImpl;
import shop.puppyhome.vo.ProductVO;

public class PuppyProductController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductVO p = new ProductVO();
		ProductDAOImpl pdao = new ProductDAOImpl();

		List<ProductVO> puppy_list = pdao.getPuppyList(p);//목록, ProductDAOImpl

		request.setAttribute("plist", puppy_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/product/puppyList.jsp"); // 뷰페이지 경로 설정.
		
		return forward;
		
	}

}
