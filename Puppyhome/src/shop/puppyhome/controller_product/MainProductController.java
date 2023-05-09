package shop.puppyhome.controller_product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.ProductDAOImpl;
import shop.puppyhome.vo.ProductVO;

public class MainProductController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductVO p = new ProductVO();
		ProductDAOImpl pdao = new ProductDAOImpl();

		List<ProductVO> puppy_list = pdao.getPuppyList(p);//퍼피목록
		List<ProductVO> gum_list = pdao.getGumList(p);//어덜트목록
		List<ProductVO> probio_list = pdao.getProbioList(p);//시니어목록

		request.setAttribute("plist", puppy_list);
		request.setAttribute("glist", gum_list);
		request.setAttribute("prlist", probio_list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/product/mainProduct.jsp"); // 뷰페이지 경로 설정.
		
		return forward;
		
	}

}
