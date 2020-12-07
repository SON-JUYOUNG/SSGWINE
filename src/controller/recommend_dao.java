package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class recommend_dao {
   Connection conn = null;
   PreparedStatement psmt = null;
   int cnt = 0;
   ResultSet rs = null;
   
   public void getcon() {
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

      }
   }
   
     
   public recommend_dto recommend2(String sort, String use, int sugar, int acidity, int body) {
      recommend_dto vo = null;
      //ArrayList<recommend_dto> arr = new ArrayList<recommend_dto>();

      try {
         getcon();
            //화이트와인,아페리티프와인,1,3,2
         String sql = "select wine_name,picture from wine where sort = ? and use = ? and sugar = ? and acidity = ? and body =? ";
         
         psmt = conn.prepareStatement(sql);
         
           psmt.setString(1, sort);
           psmt.setString(2, use);
           psmt.setInt(3, sugar);
           psmt.setInt(4, acidity);
           psmt.setInt(5, body);
         // ----------------------------------SQL준비
           rs = psmt.executeQuery();
         // ----------------------------------SQL실행

         if (rs.next()) {
            String winename = rs.getString(1);
            String picture = rs.getString(2);            
            vo = new recommend_dto(winename, picture);
         }
         
      } catch (Exception e) {

      } finally {
         close();
      } 
      return vo;
   }
   
   public  ArrayList<recommend_dto> recommend_product(String winename) {
      
      recommend_dto vo = null;
      ArrayList<recommend_dto> arr = new ArrayList<recommend_dto>();
            
      try {
         getcon();
            //화이트와인,아페리티프와인,1,3,2
         String sql = "select product_name from recommend_product where wine_name = ? ";
         
         
         psmt = conn.prepareStatement(sql);         
           psmt.setString(1, winename);

         // ----------------------------------SQL준비
           rs = psmt.executeQuery();
         // ----------------------------------SQL실행
         while (rs.next()) {         
            String product_name = rs.getString(1);
            vo = new recommend_dto(product_name);
            // ProjectVO에 하나씩 정보를저장하고,
            
            arr.add(vo);
            // arraylist에 누적
         }
      } catch (Exception e) {

      } finally {
         close();
      } 
      return arr;
   //추천상품을 2개를 가져와야함
   }

}
