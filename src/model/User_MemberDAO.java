package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class User_MemberDAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int cnt = 0;
	

	public void getCon() { // DB연결 메소드
		// JDBC
		// WebContent/WEB-INF/lib 안에 ojdbc6.jar 넣어야함
		// DB연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			con = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void close() { // DB연결 종료 메소드
		try {
			if(rs != null) {rs.close();}
			if(ps != null) {ps.close();}
			if(con != null) {con.close();}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int Join(String id, String pw, String email, String name, String tel) {//2. 회원가입
		   try {
		      getCon();

		      String sql = "insert into user_member values(?,?,?,?,?)";
		      ps = con.prepareStatement(sql);
		      ps.setString(1, id);
		      ps.setString(2, pw);
		      ps.setString(3, email);
		      ps.setString(4, name);
		      ps.setString(5, tel);

		      cnt = ps.executeUpdate();

		   } catch (Exception e) {
		      e.printStackTrace();
		   } finally {
		      close();
		   } return cnt;
		}

		public int Update(String pw, String email, String tel, String id) {//4. 회원 수정
		   try {
		      getCon();

		      String sql = "update user_member set pw=?, email =?, tel = ? where id = ?";
		      ps = con.prepareStatement(sql);

		      ps.setString(1, pw);
		      ps.setString(2, email);
		      ps.setString(3, tel);
		      ps.setString(4, id);

		      cnt = ps.executeUpdate();

		   } catch (Exception e) {
		      e.printStackTrace();
		   }finally {
		      close();
		   }
		   return cnt;
		}
		   

		   public User_MemberDTO login(String id, String pw) { //로그인
		      getCon();
		      User_MemberDTO user_dto = null;
		      
		      String sql = "select * from USER_MEMBER where id = ? and pw = ?";
		      
		      try {
		         ps = con.prepareStatement(sql);
		         ps.setString(1, id);
		         ps.setString(2, pw);
		         rs = ps.executeQuery();
		         
		         if(rs.next()) {

						String get_id = rs.getString(1);
						String get_pw = rs.getString(2);
						String get_email = rs.getString(3);
						String get_name = rs.getString(4);
						String get_tel = rs.getString(5);
						
						user_dto = new User_MemberDTO(get_id, get_pw, get_email, get_name, get_tel);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      }finally {
		         close();
		      } 
		      return user_dto;
		   }

	
}
