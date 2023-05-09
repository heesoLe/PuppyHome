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

public class OrderCancelOKController implements Action{

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

			int order_no = Integer.parseInt(request.getParameter("order_no")); 


			MyPageDAOImpl mdao = new MyPageDAOImpl();

			
			mdao.deleteOrder(order_no);
			
			out.println("<script>");
			out.println("location='order_cancel.shop';");	
			out.println("</script>");
		}
		return null;
	}

}
