package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Product_basketDAO {
	Connection conn = null;
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
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void close() { // DB연결 종료 메소드
		try {
			if(rs != null) {rs.close();}
			if(ps != null) {ps.close();}
			if(conn != null) {conn.close();}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insert(String id, String product_name, int count) {
		getCon();
		String sql = "insert into product_basket values (p_seq.nextval,?,?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, product_name);
			ps.setString(2, id);
			ps.setInt(3, count);
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return cnt;
		
		
	}
	
	public ArrayList<Product_basketDTO> select(String input_id) {//위시리스트 불러오기(화면 이동 할때!)
		getCon();
		String sql = "select * from product_basket where id = ?";
		Product_basketDTO product_basket_dto = null;
		ArrayList<Product_basketDTO>product_list = new ArrayList<Product_basketDTO>();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, input_id);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int p_seq = rs.getInt(1);
				String product_name = rs.getString(2);
				String id= rs.getString(3);
				int count = rs.getInt(4);
				
				product_basket_dto = new Product_basketDTO(p_seq, product_name, id, count);
				product_list.add(product_basket_dto);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return product_list;
	}
	
	public int delete(String product_name, int count, String id, int p_seq) {//
		getCon();
		int cnt=0;
		String sql = "delete from product_basket where product_name=? and count=? and id=? and p_seq = ?";// 
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, product_name);
			ps.setInt(2, count);
			ps.setString(3, id);
			ps.setInt(4, p_seq);
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return cnt;
	}

	public int update(String product_name, int count, String id, int p_seq) {
		getCon();
		int cnt=0;
		String sql = "update product_basket set count=? where product_name=? and id=? and p_seq=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, count);
			ps.setString(2, product_name);
			ps.setString(3, id);
			ps.setInt(4, p_seq);
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} return cnt;
	}

	public int Alldelete(String id) {
		getCon();
		int cnt = 0;
		String sql = "delete from product_basket where id=?";
		
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return 0;
	}
	
}
