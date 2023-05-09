package shop.puppyhome.controller_admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.puppyhome.controller.Action;
import shop.puppyhome.controller.ActionForward;
import shop.puppyhome.dao.AdminDAOImpl;
import shop.puppyhome.vo.MemberVO;
import shop.puppyhome.vo.ProductVO;

public class GsListController implements Action {

	// 상풍 목록
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 페이징
		int page = 1;
		int limit = 10;

		String find_field = null;// 검색 필드(제목,작성자)
		String find_name = null;// 검색어

		if (request.getParameter("page") != null) {// get으로 전달된 페이지번호가 있는 경우 실행
			page = Integer.parseInt(request.getParameter("page"));// 페이지 번호를 정수 숫자로 변경
		}

		find_field = request.getParameter("find_field");
		if (request.getParameter("find_name") != null) {// 검색어가 있는 경우
			find_name = request.getParameter("find_name").trim();// 양쪽 공백을 제거해서 저장
		}

		ProductVO findP = new ProductVO();
		findP.setFind_field(find_field);
		findP.setFind_name("%" + find_name + "%");

		AdminDAOImpl adao = new AdminDAOImpl();

		int listcountP = adao.getListCountP(findP); // 검색 전후 레코드 개수
		List<ProductVO> plist = adao.getPList(page, limit, findP); // 검색 전후 목록

		// 페이징
		int maxpage = (int) ((double) listcountP / limit + 0.95); // 총 페이지수
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1; // 시작페이지
		int endpage = maxpage; // 마지막 페이지
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("plist", plist);
		request.setAttribute("page", page);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("listcountP", listcountP);
		request.setAttribute("find_field", find_field);
		request.setAttribute("find_name", find_name);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./page/admin/aGslist.jsp"); // 뷰페이지 경로 설정.

		return forward;
	}

}
