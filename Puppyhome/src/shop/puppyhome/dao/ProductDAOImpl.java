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

public class ProductDAOImpl {

   Connection con = null; // db 연결
   PreparedStatement pt = null; // 쿼리문 수행
   Statement stmt = null; // 쿼리문 수행
   ResultSet rs = null; // 검색 결과 레코드를 저장
   DataSource ds = null; // 커넥션 풀 관리
   String sql = null; // 쿼리문 저장변수

   //jsp파일에서 action에 OKControll을 걸어줘서 넘김 


   public ProductDAOImpl() {
      try {
         Context ctx = new InitialContext();
         ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe"); //커넥션 풀 관리 ds 생성

      } catch(Exception e) {e.printStackTrace();}
   }

   //상품번호에 해당하는 상품정보 가져오기
   public ProductVO getProduct(String product_title) {
      ProductVO p = null;
      try {
         con=ds.getConnection();//커넥션 풀로 db연결 con생성
         sql="select * from tbl_product where product_title=?";
         pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 하여 수행할 pt생성
         pt.setString(1,product_title);//쿼리문의 첫번째 물음표에 상품번호를 저장
         rs=pt.executeQuery();//select문 수행후 결과 레코드를 rs에 저장
         if(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_maker(rs.getString("product_maker"));
            p.setProduct_type(rs.getString("product_type"));
            p.setProduct_cont(rs.getString("product_cont"));
            p.setProduct_star(rs.getInt("product_star"));

         }
      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }
      return p;
   }//getProduct();

   //상품등록
   public int insertProduct(ProductVO p) {
	      int re = 0;//상품 등록 실패시 반환값

	      try {
	         con=ds.getConnection();
	         sql="insert into tbl_product (product_no, product_title, product_price, product_maker, product_type, product_cont, product_star, product_date) "
	               + "values(product_seq.nextval, ?, ?, ?, ?, ?, 3, sysdate)";

	         pt=con.prepareStatement(sql);
	         pt.setString(1, p.getProduct_title());
	         pt.setInt(2, p.getProduct_price());
	         pt.setString(3, p.getProduct_maker());
	         pt.setString(4, p.getProduct_type());
	         pt.setString(5, p.getProduct_cont());

	         re = pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드개수
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if(pt != null)   pt.close();
	            if(con != null)   con.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      return re;
	   }//insertProduct();

   //결제창 주문서관리
   public void paymentProduct(MemberVO m) {
      try {
         con=ds.getConnection();
         sql="update tbl_member set user_name=?, postcode=?, roadaddr=?, detailaddr=?, user_email=?, user_phone=? where user_id=?";

         pt=con.prepareStatement(sql);
         pt.setString(1,m.getUser_name());
         pt.setString(2,m.getPostCode());
         pt.setString(3,m.getRoadAddr());
         pt.setString(4,m.getDetailAddr());
         pt.setString(5,m.getUser_email());
         pt.setString(6,m.getUser_phone());
         pt.setString(7,m.getUser_id());

         pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }

   }//paymentProduct();


   /*//상품개수
   public int getListCount(ProductVO p) {
      int count = 0;
       try {
              con=ds.getConnection();
              sql="select count(product_no) from tbl_product ";

              pt=con.prepareStatement(sql);
              pt.setString(1,m.getUser_name());
              pt.setString(2,m.getPostCode());
              pt.setString(3,m.getRoadAddr());
              pt.setString(4,m.getDetailAddr());
              pt.setString(5,m.getUser_email());
              pt.setString(6,m.getUser_phone());
              pt.setString(7,m.getUser_id());

              pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

           }catch(Exception e) {e.printStackTrace();}
           finally {
              try {
                 if(pt != null) pt.close();
                 if(con != null) con.close();
              }catch(Exception e) {e.printStackTrace();}
           }


      return count;

   }*/


   //퍼피리스트
   public List<ProductVO> getPuppyList(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"퍼피");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }

   //어덜트리스트
   public List<ProductVO> getAdultList(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"어덜트");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }
   
   //시니어리스트
   public List<ProductVO> getSeniorList(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"시니어");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }
   
   
   //껌간식 리스트
   public List<ProductVO> getGumList(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"껌간식");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }
   
   
   //간식리스트
   public List<ProductVO> getGansikList(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"일반간식");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }
   
   //유산균리스트
   public List<ProductVO> getProbioList(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"유산균");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }
   
   //오메가3리스트
   public List<ProductVO> Omaga3List(ProductVO p) {
      List<ProductVO> plist = new ArrayList<ProductVO>();

      try {
         con=ds.getConnection();
         sql="select * from tbl_product where product_type =? ";

         pt=con.prepareStatement(sql);
         pt.setString(1,"오메가3");

         rs = pt.executeQuery();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환

         while(rs.next()) {//검색된 다음레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행
            p=new ProductVO();
            p.setProduct_title(rs.getString("product_title"));
            p.setProduct_price(rs.getInt("product_price"));
            p.setProduct_star(rs.getInt("product_star"));
            p.setProduct_cont(rs.getString("product_cont"));

            plist.add(p);
         }

      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }


      return plist;
   }

   // 상품 수정 업로드
   public int updateProduct(ProductVO p) {
      int re = 0;//상품 등록 실패시 반환값

      try {
         con=ds.getConnection();
         sql="update tbl_product set product_title=?, product_price=?, product_maker=?, product_type=?, product_cont=? where product_no=?";

         pt=con.prepareStatement(sql);
         pt.setString(1, p.getProduct_title());
         pt.setInt(2, p.getProduct_price());
         pt.setString(3, p.getProduct_maker());
         pt.setString(4, p.getProduct_type());
         pt.setString(5, p.getProduct_cont());
         pt.setInt(6, p.getProduct_no());

         re = pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드개수
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(pt != null)   pt.close();
            if(con != null)   con.close();
         } catch (Exception e2) {
            e2.printStackTrace();
         }
      }
      return re;
   }
   
   //결제정보 저장(수령인)
      public int insertOrder(OrderVO o) {
         int re = 0;
         
         try {
            con=ds.getConnection();
            sql="insert into tbl_order (order_no, order_date, user_id, order_rec, postcode, roadAddr, detailAddr, user_phone, product_title"
                  + ", product_price, order_cnt, total_price) "
                  + "values(order_seq.nextval, sysdate, ?,?,?,?,?,?,?,?,?,?)";
            
            pt=con.prepareStatement(sql);
            pt.setString(1, o.getUser_id());
            pt.setString(2, o.getOrder_rec());
            pt.setString(3, o.getPostCode());
            pt.setString(4, o.getRoadAddr());
            pt.setString(5, o.getDetailAddr());
            pt.setString(6, o.getUser_phone());
            pt.setString(7, o.getProduct_title());
            pt.setInt(8, o.getProduct_price());
            pt.setInt(9, o.getOrder_cnt());
            pt.setInt(10, o.getTotal_price());


            re = pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드개수
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if(pt != null)   pt.close();
               if(con != null)   con.close();
            } catch (Exception e2) {
               e2.printStackTrace();
            }
         }
         
         return re;
         
      }
      
      //상품삭제
   public void delProduct(int product_no) {
      try {
         con = ds.getConnection();
         sql = "delete from tbl_product where product_no=?";
         pt=con.prepareStatement(sql);
         
         pt.setInt(1, product_no);
         
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