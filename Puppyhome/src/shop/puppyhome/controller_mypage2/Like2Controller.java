//package shop.puppyhome.controller_mypage2;
//
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import shop.puppyhome.controller.Action;
//import shop.puppyhome.controller.ActionForward;
//import shop.puppyhome.dao.LikeDAOImpl;
//import shop.puppyhome.dao.ProductDAOImpl;
//import shop.puppyhome.vo.LikeVO;
//import shop.puppyhome.vo.ProductVO;
//
//public class Like2Controller implements Action {
//
//	@Override
//	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		response.setContentType("text/html;charset=UTF-8"); // 브라우저에 출력되는 문자/태그 언어코딩 타입을 설정 / 밑에 alert같은 경우가 있을 때 적어줘야함
//		request.setCharacterEncoding("UTF-8"); // post방식으로 전달된 한글을 안깨지게 한다.
//		PrintWriter out = response.getWriter(); // 출력 스트림 생성 / 밑에 alert같은 경우가 있을 때 적어줘야함
//		
//		HttpSession session = request.getSession(); // 세션을 받아온다? 생성?
//		String id = (String)session.getAttribute("id"); // MemberLoginOKController의 Session의 setAttribute에서 가져온 것. 세션 = id
//		
//		/* 찜 목록보기(검색 기능 X, 페이징 O) */
//		int page = 1; // 쪽 번호
//		int limit = 5; // 한 페이지에 보여지는 목록 개수
//		
//		if(request.getParameter("page") != null) { // get으로 전달된 페이지 번호가 있는 경우 실행
//			page = Integer.parseInt(request.getParameter("page")); // 페이지 번호를 정수 숫자로 변경
//		}
//		
//		LikeVO lvo = new LikeVO();
//		ProductVO pvo = new ProductVO();
//		
//		ProductDAOImpl pdao = new ProductDAOImpl();
//		List<ProductVO> productlist = pdao.getPList(pvo, id);
//		
//		LikeDAOImpl dao = new LikeDAOImpl();
//		int listcount = dao.getListCount(lvo); // 레코드 개수
//		List<LikeVO> likelist = dao.getLikeList(page, limit, lvo, id); // 찜 목록 / id = Session값
//		
//		/* 페이지 연산 */
//		int maxpage = (int)((double)listcount/limit + 0.95); // 총 페이지 수
//		int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; // 시작 페이지, 하나의 공식으로 보면 편함
//		int endpage = maxpage; // 끝 페이지
//		if(endpage > startpage + 10-1) {
//			endpage = startpage + 10-1;
//		}
//		request.setAttribute("likelist", likelist); // likelist속성키 이름에 목록 저장
//		request.setAttribute("page", page); // 쪽번호
//		request.setAttribute("startpage", startpage); // 시작 페이지
//		request.setAttribute("endpage", endpage); // 끝 페이지
//		request.setAttribute("maxpage", maxpage); // 총 페이지
//		request.setAttribute("listcount", listcount); // 개수
//		
//		request.setAttribute("product_title", pvo.getProduct_title()); // 상품 제목
//		request.setAttribute("product_price", pvo.getProduct_price()); // 상품 가격
//		
//		request.setAttribute("lvo", lvo); // 기존 정보를 유지하면서?
//		request.setAttribute("pvo", pvo); // 기존 정보를 유지하면서?
//		
//		ActionForward forward = new ActionForward();
//		forward.setRedirect(false); // 기본 매핑주소를 유지하면서 뷰페이지로 이동.
//		forward.setPath("./page/mypage2/like2.jsp"); // 뷰페이지 경로 설정.
//		
//		return forward; // 리턴값을 null로 하면 해당 뷰페이지로 이동하지 않고 브라우저 화면이 하얗게 나옴.
//	}
//
//}
