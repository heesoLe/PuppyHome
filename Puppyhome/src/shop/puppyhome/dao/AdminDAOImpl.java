package shop.puppyhome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import shop.puppyhome.vo.CSVO;
import shop.puppyhome.vo.MemberVO;
import shop.puppyhome.vo.ProductVO;

public class AdminDAOImpl {

	Connection con = null; // db 연결
	PreparedStatement pt = null; // 쿼리문 수행
	Statement stmt = null; // 쿼리문 수행
	ResultSet rs = null; // 검색 결과 레코드를 저장
	DataSource ds = null; // 커넥션 풀 관리
	String sql = null; // 쿼리문 저장변수

	// 생성자
	public AdminDAOImpl() {

		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/xe"); // 커넥션 풀 관리 ds 생성
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 1.회원관리
	// 1-1.회원 게시판 : 검색 전후 레코드 개수
	public int getListCountB(MemberVO findM) {
		int count = 0;

		try {
			con = ds.getConnection();
			sql = "select count(user_no) from tbl_member";
			if (findM.getFind_field() == null) {
				sql += "";
			} else if (findM.getFind_field().equals("user_id")) {
				sql += " where user_id like ?";
			} else if (findM.getFind_field().equals("user_name")) {// 검색필드가 글 제목인 경우
				sql += " where user_name like ?";
			} else if (findM.getFind_field().equals("user_birth")) {
				sql += " where user_birth like ?";
			}
			pt = con.prepareStatement(sql);

			if (findM.getFind_field() != null) {// 검색필드가 있는경우
				pt.setString(1, findM.getFind_name());
			}

			rs = pt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1); // 1의 뜻은 select문 다음에 나오는 컬럼 순번
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	} // end getListCountB()

	// 1-1.회원 게시판 : 검색전후 목록
	public List<MemberVO> getMemList(int page, int limit, MemberVO findM) {
		List<MemberVO> mlist = new ArrayList<MemberVO>();

		try {
			con = ds.getConnection();
			sql = "select * from (select rowNum rNum, user_no, user_id, user_name, user_birth, user_date "
					+ " from(select * from tbl_member ";
			if (findM.getFind_field() == null) {// 검색전
				sql += "";
			} else if (findM.getFind_field().equals("user_id")) {
				sql += "where user_id like ?";
			} else if (findM.getFind_field().equals("user_name")) {
				sql += "where user_name like ?";
			} else if (findM.getFind_field().equals("user_birth")) {
				sql += "where user_birth like ?";
			}
			sql += "order by user_no asc)) where rNum >= ? and rNum <= ?";

			pt = con.prepareStatement(sql);

			int startrow = (page - 1) * limit + 1; // 읽기 시작할 행번호. 10이 한 페이지 보여지는 목록개수
			int endrow = startrow + limit - 1; // 읽을 마지막 행번호

			if (findM.getFind_field() != null) {// 검색하는 경우
				pt.setString(1, findM.getFind_name());
				pt.setInt(2, startrow);
				pt.setInt(3, endrow);
			} else {// 검색하지 않는 경우
				pt.setInt(1, startrow);
				pt.setInt(2, endrow);
			}

			rs = pt.executeQuery();

			while (rs.next()) {// 복수개의 레코드가 검색되는 경우는 while 반복문으로 반복
				MemberVO m = new MemberVO();
				m.setUser_no(rs.getInt("user_no"));
				m.setUser_name(rs.getString("user_name"));
				m.setUser_id(rs.getString("user_id"));
				m.setUser_birth(rs.getString("user_birth"));
				m.setUser_date(rs.getString("user_date"));

				mlist.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mlist;
	} // end getMemList()

	// 1-2. 회원게시판 : 아이디에 해당하는 회원 정보 가져오기
	public MemberVO getMemCont(String user_id) {
		MemberVO mv = null;

		try {
			con = ds.getConnection();
			sql = "select * from tbl_member where user_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, user_id);
			rs = pt.executeQuery();

			if (rs.next()) {
				mv = new MemberVO();
				mv.setUser_id(rs.getString("user_id"));
				mv.setUser_name(rs.getString("user_name"));
				mv.setUser_birth(rs.getString("user_birth"));
				mv.setPostCode(rs.getString("postCode"));
				mv.setRoadAddr(rs.getString("roadAddr"));
				mv.setDetailAddr(rs.getString("detailAddr"));
				mv.setUser_email(rs.getString("user_email"));
				mv.setUser_phone(rs.getString("user_phone"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mv;
	}

	// 1-3. 회원 게시판 : 회원 저장
	public int contOKMem(MemberVO mv) {
		int re = 0;
		try {
			con = ds.getConnection();
			sql = "update tbl_member set user_name=?, user_birth=?, postCode=?, roadAddr=?, detailAddr=?, user_email=?, user_phone=? where user_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, mv.getUser_name());
			pt.setString(2, mv.getUser_birth());
			pt.setString(3, mv.getPostCode());
			pt.setString(4, mv.getRoadAddr());
			pt.setString(5, mv.getDetailAddr());
			pt.setString(6, mv.getUser_email());
			pt.setString(7, mv.getUser_phone());
			pt.setString(8, mv.getUser_id());

			re = pt.executeUpdate(); // 저장쿼리문 수행후 성공한 레코드 행의 개수 반환

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}

	// 2. 문의게시판
	// 2-1.문의 : 검색 전후 레코드 개수
	public int getListCountC(CSVO findC) {
		int count = 0;

		try {
			con = ds.getConnection();
			sql = "select count(client_no) from tbl_client";
			if (findC.getFind_field() == null) {
				sql += "";
			} else if (findC.getFind_field().equals("user_id")) {
				sql += " where user_id like ?";
			} else if (findC.getFind_field().equals("client_title")) {// 검색필드가 글 제목인 경우
				sql += " where client_title like ?";
			}
			pt = con.prepareStatement(sql);

			if (findC.getFind_field() != null) {// 검색필드가 있는경우
				pt.setString(1, findC.getFind_name());
			}

			rs = pt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1); // 1의 뜻은 select문 다음에 나오는 컬럼 순번
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	// 2-1.문의 게시판 : 검색전후 목록
	public List<CSVO> getClientList(int page, int limit, CSVO findC) {
		List<CSVO> clist = new ArrayList<CSVO>();

		try {
			con = ds.getConnection();
			sql = "select * from (select rowNum rNum, client_cont, client_cont_reply, client_no, client_category, client_title, user_id, client_date"
					+ " from(select * from tbl_client ";
			if (findC.getFind_field() == null) {// 검색전
				sql += "";
			} else if (findC.getFind_field().equals("user_id")) {
				sql += "where user_id like ?";
			} else if (findC.getFind_field().equals("client_title")) {
				sql += "where client_title like ?";
			}
			sql += "order by client_no asc)) where rNum >= ? and rNum <= ?";

			pt = con.prepareStatement(sql);

			int startrow = (page - 1) * limit + 1; // 읽기 시작할 행번호. 10이 한 페이지 보여지는 목록개수
			int endrow = startrow + limit - 1; // 읽을 마지막 행번호

			if (findC.getFind_field() != null) {// 검색하는 경우
				pt.setString(1, findC.getFind_name());
				pt.setInt(2, startrow);
				pt.setInt(3, endrow);
			} else {// 검색하지 않는 경우
				pt.setInt(1, startrow);
				pt.setInt(2, endrow);
			}

			rs = pt.executeQuery();

			while (rs.next()) {// 복수개의 레코드가 검색되는 경우는 while 반복문으로 반복
				CSVO cv = new CSVO();
				cv.setClient_no(rs.getInt("client_no"));
				cv.setClient_category(rs.getString("client_category"));
				cv.setClient_title(rs.getString("client_title"));
				cv.setUser_id(rs.getString("user_id"));
				cv.setClient_date(rs.getString("client_date"));
				cv.setClient_cont(rs.getString("client_cont"));
				cv.setClient_cont_reply(rs.getNString("client_cont_reply"));

				clist.add(cv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return clist;
	}

	// 2-2. 문의 게시판 : 내용보기
	public CSVO getClientCont(int client_no) {
		CSVO cv = new CSVO();

		try {
			con = ds.getConnection();
			sql = "select * from tbl_client where client_no=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, client_no);
			rs = pt.executeQuery();

			if (rs.next()) {
				cv.setClient_no(rs.getInt("client_no"));
				cv.setClient_category(rs.getString("client_category"));
				cv.setUser_id(rs.getString("user_id"));
				cv.setClient_title(rs.getString("client_title"));
				cv.setClient_cont(rs.getString("client_cont"));
				cv.setClient_cont_reply(rs.getString("client_cont_reply"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cv;
	}

	// 2-2.문의게시판 : 답변 저장
	public void replyBoard(CSVO cv) {

		try {
			con = ds.getConnection();
			
				sql = "update tbl_client set client_cont_reply=? where client_no=?";
				pt = con.prepareStatement(sql);
				pt.setString(1, cv.getClient_cont_reply());
				pt.setInt(2, cv.getClient_no());

				pt.executeUpdate();
			}

		 catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // end replyBoard()

	// 3. 상품 목록
	// 3-1.검색 전후 레코드 개수
	public int getListCountP(ProductVO findP) {
		int count = 0;

		try {
			con = ds.getConnection();
			sql = "select count(product_no) from tbl_product";
			if (findP.getFind_field() == null) { // 검색
				sql += "";
			} else if (findP.getFind_field().equals("product_title")) { // 상품명
				sql += " where product_title like ?";
			} else if (findP.getFind_field().equals("product_type")) { // 분류
				sql += " where product_type like ?";
			}
			pt = con.prepareStatement(sql);

			if (findP.getFind_field() != null) {// 검색필드가 있는경우
				pt.setString(1, findP.getFind_name());
			}

			rs = pt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1); // 1의 뜻은 select문 다음에 나오는 컬럼 순번
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	// 3-1.검색 전후 목록
	public List<ProductVO> getPList(int page, int limit, ProductVO findP) {
		List<ProductVO> plist = new ArrayList<>();

		try {
			con = ds.getConnection();
			sql = "select * from (select rowNum rNum, product_no, product_title, product_type, product_price, product_date " // 목록 : NO, 상품번호, 상품명, 분류(소분류), 가격, 등록날짜
					+ " from(select * from tbl_product ";
			if (findP.getFind_field() == null) {// 검색전
				sql += "";
			} else if (findP.getFind_field().equals("product_title")) { // 상품명
				sql += " where product_title like ?";
			} else if (findP.getFind_field().equals("product_type")) { // 분류(소분류)
				sql += " where product_type like ?";
			}
			sql += "order by product_no asc)) where rNum >= ? and rNum <= ?";

			pt = con.prepareStatement(sql);

			int startrow = (page - 1) * limit + 1; // 읽기 시작할 행번호. 10이 한 페이지 보여지는 목록개수
			int endrow = startrow + limit - 1; // 읽을 마지막 행번호

			if (findP.getFind_field() != null) {// 검색하는 경우
				pt.setString(1, findP.getFind_name());
				pt.setInt(2, startrow);
				pt.setInt(3, endrow);
			} else {// 검색하지 않는 경우
				pt.setInt(1, startrow);
				pt.setInt(2, endrow);
			}

			rs = pt.executeQuery();

			while (rs.next()) {// 복수개의 레코드가 검색되는 경우는 while 반복문으로 반복
				ProductVO pv = new ProductVO();
				pv.setProduct_no(rs.getInt("product_no"));
				pv.setProduct_title(rs.getString("product_title"));
				pv.setProduct_type(rs.getString("product_type"));
				pv.setProduct_price(rs.getInt("product_price"));
				pv.setProduct_date(rs.getString("product_date"));

				plist.add(pv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return plist;
	}

	// 3-3. 수정품
	public ProductVO getProductCont(int product_no) {
		ProductVO pv = new ProductVO();

		try {
			con = ds.getConnection();
			sql = "select * from tbl_product where product_no=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, product_no);
			rs = pt.executeQuery();

			if (rs.next()) {
				pv.setProduct_no(rs.getInt("product_no"));
				pv.setProduct_title(rs.getString("product_title"));
				pv.setProduct_price(rs.getInt("product_price"));
				pv.setProduct_type(rs.getString("product_type"));
				pv.setProduct_maker(rs.getString("product_maker"));
				pv.setProduct_cont(rs.getString("product_cont"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pt != null)
					pt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return pv;
	}

}
