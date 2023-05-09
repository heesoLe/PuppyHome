package shop.puppyhome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAOImpl {
	
	DataSource ds = null; // 커넥션 풀 관리 ds
	Connection con = null; // DB연결
	PreparedStatement pstmt = null; // 쿼리문 수행
	Statement stmt = null; // 쿼리문 수행
	ResultSet rs = null; // 검색 결과 레코드를 저장할 rs / select일때만 씀
	String sql = null; // 쿼리문 저장변수
	
	public ReviewDAOImpl() { // 기본생성자(여기에 DB연결을 시켜놓고 밑에 기능 메서드를 만들어줌.)
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/xe"); // JNDI 커넥션풀 관리 ds 생성
		} catch(Exception e) {
			System.out.println("DB 연결 실패 : " + e);
			return; // 오류나면 종료
		} // end try~catch
		
	} // end ReviewDAOImpl()
		
} // end ReviewDAOImpl class
