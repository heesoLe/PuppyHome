package shop.puppyhome.controller_admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.AdminDAOImpl;
import shop.puppyhome.vo.ProductVO;

public class GsModifyController implements Action {

   // 상품 수정 페이지 
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      int product_no = Integer.parseInt(request.getParameter("product_no"));
      int page = 1;
      
//      String state = request.getParameter("state"); //내용보기
      
      AdminDAOImpl adao = new AdminDAOImpl();
      ProductVO po = adao.getProductCont(product_no); // 수정폼
      
      String url = po.getProduct_cont();
      String[] product_cont = url.split(",");
      String product_cont1 = product_cont[0];
      String product_cont2 = product_cont[1];
      String product_cont3 = product_cont[2];
      String product_type = po.getProduct_type();
      
      request.setAttribute("po", po);
      request.setAttribute("page", page);
      request.setAttribute("product_type", product_type);
      request.setAttribute("product_cont1", product_cont1);
      request.setAttribute("product_cont2", product_cont2);
      request.setAttribute("product_cont3", product_cont3);
      
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("./page/admin/aGs_edit.jsp"); // 뷰페이지 경로 설정.
      
      return forward;
   }

}