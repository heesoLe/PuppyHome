package shop.puppyhome.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import shop.puppyhome.vo.MemberVO;

public class MemberDAOImpl {//회원관리 JDBC

   Connection con = null; //db 연결
   PreparedStatement pt = null; //쿼리문 수행
   Statement stmt = null; //쿼리문 수행
   ResultSet rs = null; //검색 결과 레코드를 저장
   DataSource ds = null; //커넥션 풀 관리
   String sql = null; //쿼리문 저장변수

   
   public MemberDAOImpl () {
      
      try {
         Context ctx = new InitialContext();
         ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe"); //커넥션 풀 관리 ds 생성
         
      } catch(Exception e) {e.printStackTrace();}
   }   //생성자
   
   //아이디 중복검색
   public MemberVO idCheck(String id) {
      MemberVO m=null;
      
      try {
         con=ds.getConnection();//커넥션 풀 관리 ds로 db연결 con생성
         sql="select * from tbl_member where user_id=?";
         pt = con.prepareStatement(sql);//쿼리문을 미리 컴파일하여 수행할 pt생성
         pt.setString(1,id);//쿼리문의 첫번째 물음표에 문자열로 아이디저장
         rs=pt.executeQuery();//검색 쿼리문 수행후 결과레코드를 rs에 저장
         
         if(rs.next()) {//다음 레코드 행이 존재하면 참
            m=new MemberVO();
            m.setUser_id(rs.getString("user_id"));//mem_id컬럼으로 부터 문자열로 아이디값을
            //가져와서 setter()메서드에 저장
         }
      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
             if(rs != null) rs.close();
             if(pt != null) pt.close();
             if(con != null) con.close();
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
      return m;
   }//idCheck()
   
   //회원저장
   public int insertMember(MemberVO m) {
      int re=-1;//삭제 실패시 반환값
      
      try {
         con=ds.getConnection();
         sql="insert into tbl_member (user_no,user_id,user_pwd,user_name,user_birth,postCode,"
         +"roadAddr,detailAddr,user_email,user_phone,user_date) values(user_no_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";

         pt=con.prepareStatement(sql);
         pt.setString(1,m.getUser_id());
         pt.setString(2,m.getUser_pwd());
         pt.setString(3,m.getUser_name());
         pt.setString(4,m.getUser_birth());
         pt.setString(5,m.getPostCode());
         pt.setString(6,m.getRoadAddr());
         pt.setString(7,m.getDetailAddr());
         pt.setString(8,m.getUser_email());
         pt.setString(9,m.getUser_phone());
         
         
         re=pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
         
      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
          if(pt != null) pt.close();
          if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }
      return re;
   }//insertMember()
   
   

   //비번찾기
   public MemberVO pwdMember(MemberVO m) {
      MemberVO pm=null;
      
      try{
         con=ds.getConnection();
         sql="select user_pwd from tbl_member where user_id=? and user_name=? and user_email=?";
         //회원아이디와 이름을 기준으로 오라클로부터 비번을 검색
         pt=con.prepareStatement(sql);
         pt.setString(1,m.getUser_id());
         pt.setString(2,m.getUser_name());
         pt.setString(3,m.getUser_email());
         rs=pt.executeQuery();
         
         if(rs.next()) {
            pm=new MemberVO();
            pm.setUser_pwd(rs.getString("user_pwd"));
         }
      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(rs != null) rs.close();
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }
      return pm;
   }//PwdMember()
   
   
   //아디찾기
      public MemberVO idMember(MemberVO m) {
         MemberVO pm=null;
         
         try{
            con=ds.getConnection();
            sql="select user_id from tbl_member where user_name=? and user_email=?";
            //회원아이디와 이름을 기준으로 오라클로부터 비번을 검색
            pt=con.prepareStatement(sql);
            pt.setString(1,m.getUser_name());
            pt.setString(2,m.getUser_email());
            rs=pt.executeQuery();
            
            if(rs.next()) {
               pm=new MemberVO();
               pm.setUser_id(rs.getString("user_id"));
            }
         }catch(Exception e) {e.printStackTrace();}
         finally {
            try {
               if(rs != null) rs.close();
               if(pt != null) pt.close();
               if(con != null) con.close();
            }catch(Exception e) {e.printStackTrace();}
         }
         return pm;
      }//PwdMember()
   
   

   //로그인 인증처리
   public MemberVO loginCheck(String login_id) {
      MemberVO m=null;
      
      try {
         con=ds.getConnection();
         sql="select * from tbl_member where user_id=? and user_state=0";
         //아이디와 가입회원 1인 경우만 로그인 인증
         pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 해서 수행할 pt생성
         pt.setString(1,login_id);
         rs=pt.executeQuery();
         
         if(rs.next()) {
            m=new MemberVO();
            m.setUser_pwd(rs.getString("user_pwd"));
         
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
   }//loginCheck()


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
   public int updateMember(MemberVO m) {
        int re=-1;//저장 실패시 반환값
     
     try {
        con=ds.getConnection();
        sql="update tbl_member set user_pwd=?,user_name=?,user_birth=?"
              + ",postcode=?,roadaddr=?,detailaddr=?,user_email=?,user_phone=? where user_id=?";
        
        pt=con.prepareStatement(sql);
        pt.setString(1,m.getUser_pwd());
        pt.setString(2,m.getUser_name());
        pt.setString(3,m.getUser_birth());
        pt.setString(4,m.getPostCode());
        pt.setString(5,m.getRoadAddr());
        pt.setString(6,m.getDetailAddr());
        pt.setString(7,m.getUser_email());
        pt.setString(8,m.getUser_phone());
        pt.setString(9,m.getUser_id());
        
       
        
        re=pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
        
     }catch(Exception e) {e.printStackTrace();}
     finally {
        try {
           if(pt != null) pt.close();
           if(con != null) con.close();
        }catch(Exception e) {e.printStackTrace();}
     }
     return re;
  }

   //회원탈퇴
   public void delMember(MemberVO dm) {
      try {
         con=ds.getConnection();
         sql="update tbl_member set user_state=1 where user_id=?";
         pt=con.prepareStatement(sql);
         //pt.setString(1,dm.getMem_delcont());
         pt.setString(2,dm.getUser_id());
         pt.executeUpdate();
         
      }catch(Exception e) {e.printStackTrace();}
      finally {
         try {
            if(pt != null) pt.close();
            if(con != null) con.close();
         }catch(Exception e) {e.printStackTrace();}
      }
   }//delMember()

}