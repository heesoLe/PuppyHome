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

import shop.puppyhome.vo.CSClientVO;
import shop.puppyhome.vo.CSFAQVO;
import shop.puppyhome.vo.CSNoticeVO;

public class CSDAOImpl {
	
		DataSource ds = null;
		Connection con = null;
		Statement stmt=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
	   
	   public CSDAOImpl() {
	      
	      try {
	         Context ctx=new InitialContext();
	         ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");//JNDI 커넥션 풀 관리 ds 생성
	         
	      }catch(Exception e){
	         System.out.println("DB연결 실패 : "+e);
	         return;//종료
	      }//try~catch
	      
	   }//기본생성자

	 
	  
	   //문의 저장
	public void insertInquire(CSClientVO c) {
		 try {
			
	         con=ds.getConnection();
	         
	         sql="insert into tbl_client (client_no, client_title, client_cont, client_category,  client_date ,user_id) values(client_seq.nextval,?,?,?,sysdate,?)";
	         
	         pstmt=con.prepareStatement(sql);
	         
	         pstmt.setString(1,c.getClient_title());
	         pstmt.setString(2,c.getClient_cont());
	         pstmt.setString(3, c.getClient_category());
	         pstmt.setString(4, c.getUser_id());
	   
	         pstmt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
	         
	      }catch(Exception e) {e.printStackTrace();}
	      finally {
	         try {
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         }catch(Exception e) {e.printStackTrace();}
	      }
		
	}//insertInquire()


	//
	public int getListCount(CSClientVO findC) {
		// TODO Auto-generated method stub
		return 0;
	}



	public List<CSClientVO> getCSList(int page, int limit, CSClientVO findC) {
		// TODO Auto-generated method stub
		return null;
	}


	//공지사항 저장
	public void insertnotice(CSNoticeVO c) {
		try {
			 
	         con=ds.getConnection();
	         
	         sql="insert into tbl_notice values(notice_seq.nextval,?,?,sysdate)";
	         
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1,c.getNotice_title());
	         pstmt.setString(2,c.getNotice_cont());
	   
	         pstmt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
	         
	      }catch(Exception e) {e.printStackTrace();}
	      finally {
	         try {
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         }catch(Exception e) {e.printStackTrace();}
	      }
		
	}//insertnotice



	//Notice.jsp 페이징을 위한
	public int getNoticeListCount(CSNoticeVO b) {
		int count = 0;
		
		try {
            con=ds.getConnection();
            sql="select count(notice_no) from tbl_notice ";
                    if(b.getFind_field() == null) {//검색 전 총 레코드 개수
                        sql+="";
                    }else if(b.getFind_field().equals("notice_title")) {
                        sql+="where notice_title like ?";
                    }else if(b.getFind_field().equals("notice_cont")) {
                        sql+="where notice_cont like ?";
                    }

            pstmt=con.prepareStatement(sql);

            if(b.getFind_field()!=null) {
                pstmt.setString(1,b.getFind_name());
            }

            rs = pstmt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

            if(rs.next()) {
                count=rs.getInt(1);
            }
        }catch(Exception e) {e.printStackTrace();}
        finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(con != null) con.close();
            }catch(Exception e) {e.printStackTrace();}
        }
		
		return count;
	}//getNoticeListCount()



	public List<CSNoticeVO> getCSNoticeList(int page, int limit, CSNoticeVO b) {
		List<CSNoticeVO> blist = new ArrayList<>();

		try {
			con=ds.getConnection();
			sql="select * from (select rowNum rnum, notice_no, notice_title, notice_cont, "
					+ "notice_date from (select * from tbl_notice ";

			if(b.getFind_field() == null) {//검색 전 총 레코드 개수
				sql+="";
			}else if(b.getFind_field().equals("notice_title")) {
				sql+="where notice_title like ?";
			}else if(b.getFind_field().equals("notice_cont")) {
				sql+="where notice_cont like ?";
			}
			sql+=" order by notice_no asc)) where rNum>=? and rNum<=?";
			/*
			 * 페이징과 검색관련 쿼리문, rowNum 컬럼은 오라클에서 테이블 생성시 추가되는 컬럼으로 최초 레코드 저장시 일련번호값이 알아서 저장된다.
			 * rNum은 rowNum컬럼의 별칭명이다.
			 */


			pstmt=con.prepareStatement(sql);

			int startrow=(page-1)*limit+1;//읽기 시작할 행번호.
			int endrow=startrow+limit-1;//읽을 마지막 행번호

			if(b.getFind_field()!=null) {
				pstmt.setString(1,b.getFind_name());
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
			}else {
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
			}

			rs = pstmt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

			while(rs.next()) {
				CSNoticeVO bvo= new CSNoticeVO();
				bvo.setNotice_no(rs.getInt("notice_no"));
				bvo.setNotice_title(rs.getNString("notice_title"));
				bvo.setNotice_cont(rs.getNString("notice_cont").replace("\n", "<br>"));
				bvo.setNotice_date(rs.getString("notice_date"));

				blist.add(bvo);
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return blist;
	}



	//FAQ 저장
	public void insertfaq(CSFAQVO c) {
		try {
			 
	         con=ds.getConnection();
	         
	         sql="insert into tbl_faq values(faq_seq.nextval,?,?,?)";
	         
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1,c.getFaq_category());
	         pstmt.setString(2,c.getFaq_title());
	         pstmt.setString(3,c.getFaq_cont());
	   
	         pstmt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
	         
	      }catch(Exception e) {e.printStackTrace();}
	      finally {
	         try {
	            if(pstmt != null) pstmt.close();
	            if(con != null) con.close();
	         }catch(Exception e) {e.printStackTrace();}
	      }
	}



	//FAQ List Loader
	public List<CSFAQVO> getCSFAQList(String faq_category) {
		List<CSFAQVO> blist = new ArrayList<>();

		
		try {
			con=ds.getConnection();
			sql="select * from tbl_faq ";

			if(faq_category == null) {//검색 전 총 레코드 개수
				sql+="";
			}else{
				sql+="where faq_category = ?";
				
			}
			sql+=" order by faq_category ";
			


			pstmt=con.prepareStatement(sql);

			
			if(faq_category!=null) {
				pstmt.setString(1,faq_category);
			}
			

			rs = pstmt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

			while(rs.next()) {
				CSFAQVO bvo= new CSFAQVO();
				bvo.setFaq_title(rs.getNString("faq_title"));
				bvo.setFaq_cont(rs.getNString("faq_cont").replace("\n", "<br>"));
				bvo.setFaq_category(rs.getString("faq_category"));

				blist.add(bvo);
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return blist;
	}



	//
	public List<CSClientVO> getCSClientList() {
		List<CSClientVO> blist = new ArrayList<>();

		
		try {
			con=ds.getConnection();
			
			sql="select * from tbl_client order by client_category";

			pstmt=con.prepareStatement(sql);

			rs = pstmt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
			
			
			while(rs.next()) {
				CSClientVO bvo= new CSClientVO();
				bvo.setClient_no(rs.getInt("client_no"));
				bvo.setClient_category(rs.getString("client_category"));
				bvo.setClient_title(rs.getString("client_title"));
				bvo.setClient_cont(rs.getNString("client_cont").replace("\n", "<br>"));
				bvo.setUser_id(rs.getString("user_id"));
				bvo.setClient_date(rs.getString("client_date"));
				bvo.setClient_cont_reply(rs.getString("client_cont_reply").replace("\n", "<br>"));

				blist.add(bvo);
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return blist;
	}



	/*public List<CSClientVO> getCSClientReplyList() {
List<CSClientVO> blist = new ArrayList<>();

		
		try {
			con=ds.getConnection();
			
			sql="select * from tbl_client_reply order by client_no";

			pstmt=con.prepareStatement(sql);

			rs = pstmt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
			
			
			while(rs.next()) {
				CSClientVO bvo= new CSClientVO();
				bvo.setClient_no(rs.getInt("client_no"));
				bvo.setClient_reply_cont(rs.getString("client_reply_cont").replace("<p>", "").replace("\n", "<br>"));
				blist.add(bvo);
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return blist;
	}*/

}
