package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class WineDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;

	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int wineDelete(String winename) {

		try {

			getConn();

			String sql = "delete from wine where winename=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, winename);

			// ---------------------------SQL준비

			cnt = psmt.executeUpdate();
			// ---------------------------SQL실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	public int memberDelete(String id) {

		try {

			getConn();

			String sql = "delete from user_member where id=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			// ---------------------------SQL준비

			cnt = psmt.executeUpdate();
			// ---------------------------SQL실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public WineDTO wineOneSelect(String wine_name){
		System.out.println("sql 실행 성공");
		WineDTO wine_dto = null;

		try {

			getConn();

			String sql = "select * from wine where wine_name=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, wine_name);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String winename = rs.getString(1);
				String use = rs.getString(2);
				String sort = rs.getString(3);
				String country = rs.getString(4);
				String area = rs.getString(5);
				String grape = rs.getString(6);
				String grade = rs.getString(7);
				String sugar = rs.getString(8);
				String acidity = rs.getString(9);
				String body = rs.getString(10);
				String alcohol = rs.getString(11);
				String price = rs.getString(12);
				String picture = rs.getString(13);
				String info = rs.getString(14);
				
				wine_dto = new WineDTO(winename, use, sort, country, area, grape, grade, sugar, acidity, body, alcohol, price, picture, info);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println(wine_dto.getInfo());
		return wine_dto;
	}
	
//	와인 전체 리스트 
	public ArrayList<WineDTO> wineSelect() {
		WineDTO dto = null;
		ArrayList<WineDTO> winearr = new ArrayList<WineDTO>();

		try {

			getConn();

			String sql = "select * from wine";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String winename = rs.getString(1);
				String use = rs.getString(2);
				String sort = rs.getString(3);
				String country = rs.getString(4);
				String area = rs.getString(5);
				String grape = rs.getString(6);
				String grade = rs.getString(7);
				String sugar = rs.getString(8);
				String acidity = rs.getString(9);
				String body = rs.getString(10);
				String alcohol = rs.getString(11);
				String price = rs.getString(12);
				String picture = rs.getString(13);
				String info = rs.getString(14);
				
				dto = new WineDTO(winename, use, sort, country, area, grape, grade, sugar, acidity, body, alcohol, price, picture, info);
				winearr.add(dto); // 정보들 추가
				// array list / VO(DTO) 6가지 하나로 묶어줄 것 생성
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return winearr;
	}
	
	//회원리스트
	public ArrayList<User_MemberDTO> memberSelect() {
		User_MemberDTO dto = null;
		ArrayList<User_MemberDTO> marr = new ArrayList<User_MemberDTO>();

		try {

			getConn();

			String sql = "select * from user_member";
			psmt = conn.prepareStatement(sql);

			// ---------------------------SQL준비

			rs = psmt.executeQuery();

			// ---------------------------SQL실행

			while (rs.next()) {

				String id = rs.getString(1);
				String pw = rs.getString(2);
				String email = rs.getString(3);
				String name = rs.getString(4);
				String tel = rs.getString(5);
				
				
				dto = new User_MemberDTO(id, pw, email, name, tel);
				 marr.add(dto); // 정보들 추가
				// array list / VO(DTO) 6가지 하나로 묶어줄 것 생성
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return  marr;
	}
	
	
	
}
