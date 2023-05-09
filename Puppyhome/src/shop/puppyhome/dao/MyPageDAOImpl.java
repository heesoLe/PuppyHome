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

import shop.puppyhome.vo.MemberVO;
import shop.puppyhome.vo.OrderVO;
import shop.puppyhome.vo.ProductVO;

public class MyPageDAOImpl {//회원관리 JDBC

	Connection con = null; //db 연결
	PreparedStatement pt = null; //쿼리문 수행
	Statement stmt = null; //쿼리문 수행
	ResultSet rs = null; //검색 결과 레코드를 저장
	DataSource ds = null; //커넥션 풀 관리
	String sql = null; //쿼리문 저장변수

	
	public MyPageDAOImpl () {
		
		try {
			Context ctx = new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe"); //커넥션 풀 관리 ds 생성
			
		} catch(Exception e) {e.printStackTrace();}
	}	//생성자

//		//주문내역
//		public List<ProductVO> getPList(ProductVO findP) {
//			List<ProductVO> plist = new ArrayList<>();
//
//			try {
//				con = ds.getConnection();
//				sql = "select * from (select rowNum rNum, product_no, product_title, product_type, product_price, product_date " //목록 : NO, 상품번호, 상품명, 분류(소분류), 가격, 등록날짜
//						+ " from(select * from tbl_product ";
//				if (findP.getFind_field() == null) {// 검색전
//					sql += "";
//				} else if (findP.getFind_field().equals("product_title")) { //상품명
//					sql += " where product_title like ?";
//				} else if (findP.getFind_field().equals("product_type")) { //분류(소분류)
//					sql += " where product_type like ?";
//				}
//				sql += "order by product_no asc)) where rNum >= ? and rNum <= ?";
//
//				pt = con.prepareStatement(sql);
//
//				int startrow = (page - 1) * limit + 1; // 읽기 시작할 행번호. 10이 한 페이지 보여지는 목록개수
//				int endrow = startrow + limit - 1; // 읽을 마지막 행번호
//
//				if (findP.getFind_field() != null) {// 검색하는 경우
//					pt.setString(1, findP.getFind_name());
//					pt.setInt(2, startrow);
//					pt.setInt(3, endrow);
//				} else {// 검색하지 않는 경우
//					pt.setInt(1, startrow);
//					pt.setInt(2, endrow);
//				}
//
//				rs = pt.executeQuery();
//
//				while (rs.next()) {// 복수개의 레코드가 검색되는 경우는 while 반복문으로 반복
//					ProductVO pv = new ProductVO();
//					pv.setProduct_no(rs.getInt("product_no"));
//					pv.setProduct_title(rs.getString("product_title"));
//					pv.setProduct_type(rs.getString("product_type"));
//					pv.setProduct_price(rs.getInt("product_price"));
//					pv.setProduct_date(rs.getString("product_date"));
//					
//					plist.add(pv);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				try {
//					if (rs != null)
//						rs.close();
//					if (pt != null)
//						pt.close();
//					if (con != null)
//						con.close();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//			return plist;
//		}

	//아이디에 해당하는 회원정보 가져오기
	public MemberVO getMember(String id) {
		MemberVO m=null;
		
		try {
			con=ds.getConnection();//커넥션 풀로 db연결 con생성
			sql="select * from tbl_member where user_id=?";
			pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 하여 수행할 pt생성
			pt.setString(1,id);//쿼리문의 첫번째 물음표에 문자열로 아이디를 저장
			rs=pt.executeQuery();//select문 수행후 결과 레코드를 rs에 저장
			if(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
				m=new MemberVO();
				m.setUser_id(rs.getString("user_id"));//mem_id컬럼으로 부터 문자열로 회원아이디 레코드를 가져와서
				//해당 setter()메서드에 저장
				m.setUser_pwd(rs.getString("user_pwd"));
				m.setUser_name(rs.getString("user_name"));
				m.setUser_birth(rs.getString("user_birth"));
				m.setPostCode(rs.getString("postCode"));
				m.setRoadAddr(rs.getString("roadAddr"));
				m.setDetailAddr(rs.getString("detailAddr"));
				m.setUser_email(rs.getString("user_email"));
				m.setUser_phone(rs.getString("user_phone"));
				
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return m;
	}//getMember()

	
	//회원정보 수정
	public void updateUser(/*MemberVO m*/ MemberVO m) {
     try {
        con=ds.getConnection();
        sql="update tbl_member set user_name=?, user_birth=?"
              + ",postcode=?, roadaddr=?, detailaddr=?, user_email=?, user_phone=? where user_id=?";
        
        pt=con.prepareStatement(sql);
        pt.setString(1,m.getUser_name());
        pt.setString(2,m.getUser_birth());
        pt.setString(3,m.getPostCode());
        pt.setString(4,m.getRoadAddr());
        pt.setString(5,m.getDetailAddr());
        pt.setString(6,m.getUser_email());
        pt.setString(7,m.getUser_phone());
        pt.setString(8,m.getUser_id());
        
        pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
        
     }catch(Exception e) {e.printStackTrace();}
     finally {
        try {
           if(pt != null) pt.close();
           if(con != null) con.close();
        }catch(Exception e) {e.printStackTrace();}
     }
  }

	//현재 비밀번호 체크
	public int pwdCheck(String id, String user_pwd) {
		int re = -1;
		
		try {
	        con=ds.getConnection();
	        sql="select * from tbl_member where user_id = ?";
	        
	        pt=con.prepareStatement(sql);
	        pt.setString(1, id);
	  
	        rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
	        
	        if(rs.next()) {
	        	String pw = rs.getString("user_pwd");
	        	if(pw.equals(user_pwd)) {
	        		re = 1;
	        	} else {
	        		re = -1;
	        	}
	        }
	     }catch(Exception e) {e.printStackTrace();}
	     finally {
	        try {
	           if(rs != null) rs.close();
	           if(pt != null) pt.close();
	           if(con != null) con.close();
	        }catch(Exception e) {e.printStackTrace();}
	     }
		
		
		return re;
	}

	//비밀번호 변경
	public boolean pwdChange(String id, String new_pwd) {
		boolean flag = false;
		
		try {
	        con=ds.getConnection();
	        sql="update tbl_member set user_pwd=? where user_id=?";
	        
	        pt=con.prepareStatement(sql);
	        pt.setString(1, new_pwd);
	        pt.setString(2, id);
	  
	        if(pt.executeUpdate()==1) {
	        	flag = true;
	        } else {
	        	flag = false;
	        }
	     }catch(Exception e) {e.printStackTrace();}
	     finally {
	        try {
	           if(rs != null) rs.close();
	           if(pt != null) pt.close();
	           if(con != null) con.close();
	        }catch(Exception e) {e.printStackTrace();}
	     }
		
		return flag;
	}
	
	//회원탈퇴
	public void delMember(MemberVO dm) {
		try {
			con=ds.getConnection();
			sql="update tbl_member set user_state=1 where user_id=?";
			pt=con.prepareStatement(sql);
			pt.setString(1 , dm.getUser_id());
			pt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
	}//delMember()


	public void updateAddr(MemberVO m) {
		try {
	        con=ds.getConnection();
	        sql="update tbl_member set postcode=?, roadaddr=?, detailaddr=? where user_id=?";
	        
	        pt=con.prepareStatement(sql);
	        pt.setString(1,m.getPostCode());
	        pt.setString(2,m.getRoadAddr());
	        pt.setString(3,m.getDetailAddr());
	        pt.setString(4,m.getUser_id());
	        
	        pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
	        
	     }catch(Exception e) {e.printStackTrace();}
	     finally {
	        try {
	           if(pt != null) pt.close();
	           if(con != null) con.close();
	        }catch(Exception e) {e.printStackTrace();}
	     }
	}//updateAddr()

	public List<OrderVO> getOList(String id) {
		List<OrderVO> olist = new ArrayList<>();

		try {
			con = ds.getConnection();
			sql = "select order_no, product_title, order_date, order_cnt, product_price, total_price from tbl_order where user_id =?";
			
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			rs = pt.executeQuery();

			while (rs.next()) {// 복수개의 레코드가 검색되는 경우는 while 반복문으로 반복
				OrderVO ov = new OrderVO();				
				ov.setOrder_no(rs.getInt("order_no"));
				ov.setProduct_title(rs.getString("product_title"));
				ov.setOrder_date(rs.getString("order_date"));
				ov.setOrder_cnt(rs.getInt("order_cnt"));
				ov.setProduct_price(rs.getInt("product_price"));
				ov.setTotal_price(rs.getInt("total_price"));
				
				olist.add(ov);
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
		return olist;
	}

	public void deleteOrder(int order_no) {
		try {
			con = ds.getConnection();
			sql = "delete from tbl_order where order_no=?";
			pt=con.prepareStatement(sql);
			
			pt.setInt(1, order_no);
			
			pt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con != null) con.close();
			} catch (Exception e) {e.printStackTrace();}
			}		
	}

}


