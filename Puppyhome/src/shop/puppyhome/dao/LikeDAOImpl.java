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

import shop.puppyhome.vo.LikeVO;

public class LikeDAOImpl {
	
	DataSource ds = null; // 커넥션 풀 관리 ds
	Connection con = null; // DB연결
	PreparedStatement pstmt = null; // 쿼리문 수행
	Statement stmt = null; // 쿼리문 수행
	ResultSet rs = null; // 검색 결과 레코드를 저장할 rs / select일때만 씀
	String sql = null; // 쿼리문 저장변수
	
	public LikeDAOImpl() { // 기본생성자(여기에 DB연결을 시켜놓고 밑에 기능 메서드를 만들어줌.)
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/xe"); // JNDI 커넥션풀 관리 ds 생성
		} catch(Exception e) {
			System.out.println("DB 연결 실패 : " + e);
			return; // 오류나면 종료
			
		} // end try~catch
		
	} // end LikeDAOImpl()
	
	// 리스트 목록 개수 세기
	public int getListCount(LikeVO vo) {
		int count = 0;
		
		try {
			con = ds.getConnection(); // 커넥션 풀인 관리 ds를 사용하여 db연결, con생성
			sql = "select count(like_no) from tbl_like";

			pstmt = con.prepareStatement(sql); // 쿼리문을 미리 컴파일하여 수행할 pstmt생성
			
			rs = pstmt.executeQuery(); // 검색 쿼리문 수행 후 결과 레코드를 rs에 저장
			
			if(rs.next()) { // next()메서드는 다음 레코드행이 존재하면 참
				count = rs.getInt(1); // 1의 뜻은 select문 다음에 나오는 컬럼순번
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) { // 관례적으로 생성된 역순으로 close함
					con.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return count;
	} // end getListCount()
	
	// 찜 목록 리스트 구하기
	public List<LikeVO> getLikeList(int page, int limit, LikeVO vo, String id) {
		List<LikeVO> likelist = new ArrayList<>();
		
		try {
			con = ds.getConnection(); // 커넥션 풀인 관리 ds를 사용하여 db연결, con생성
			sql = "select * from (select rowNum rNum, like_no, product_no, user_id from(select * from tbl_like order by like_no asc)) where user_id=? and rNum >=? and rNum <=?";

			pstmt = con.prepareStatement(sql);
			
			int startrow = (page-1)*5+1; // 읽기 시작할 행번호. 10이 한페이지에 보여지는 목록개수
			int endrow = startrow + limit-1; // 읽을 마지막 행번호
			
			
			pstmt.setString(1, id); // 여기서 id는 세션값
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { // 복수개의 레코드가 검색되는 경우는 while반복문으로 검색
				LikeVO like = new LikeVO();
				like.setLike_no(rs.getInt("Like_no"));
				like.setProduct_no(rs.getInt("product_no"));
				like.setUser_id(rs.getString("user_id"));
				
				likelist.add(like); // 컬렉션에 추가
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) { // 관례적으로 생성된 역순으로 close함
					con.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return likelist;
	}
	
	
	// 찜 목록 조회(검색)
	
	

	// 찜 목록에서 삭제
	
	// 장바구니에 해당 상품 추가
	
		
} // end LikeDAOImpl class