package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.recommend_dao;
import model.recommend_dto;

@WebServlet("/recommend")
public class recommend extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      System.out.println("서버 호출 성공");
      request.setCharacterEncoding("utf-8");
      
      String sort_plus = request.getParameter("sort_plus");
      String use_plus = request.getParameter("use_plus");
      int sugar = Integer.parseInt(request.getParameter("sugar"));
      int acidity = Integer.parseInt(request.getParameter("acidity"));
      int body = Integer.parseInt(request.getParameter("body"));
      
      if(use_plus.equals("식전")) {
         use_plus="아페리티프와인";
      }else if(use_plus.equals("식중")) {
         use_plus="테이블와인";
      }else if(sort_plus.equals("식후")) {
         use_plus="디저트와인";
      }else {
      }
      
      recommend_dao dao = new recommend_dao();
      
      //이친구가 DB에서 와인이름이랑 사진주소값 가져오는 친구
      recommend_dto vo = dao.recommend2(sort_plus, use_plus, sugar, acidity, body);
      
      //조건 5개를 통해 DB에서 가져온 와인이름
      String winename = vo.getWinename();
      System.out.println(vo);
      //와인이름을 통해 다시 한 번 더 DB에서 추천상품을 가지고 오는 친구
      //ArrayList<recommend_dto> arr = dao.recommend_product(winename);

      //String all = vo.getWinename() +","+ vo.getPicture()+"," + arr.get(0).getProduct_name()+","+arr.get(1).getProduct_name();
      //System.out.println(all);
      
      Gson g=new Gson();
      //String json1 =g.toJson(vo);
      //arr.get(0);
      //arr.get(1);      
      
      String json=g.toJson(vo);
      System.out.println(json);
      
      response.setContentType("text/plain;charset=utf-8");
      
      //저장된 값들을 json으로 보내줄 친구
      PrintWriter out=response.getWriter();
      out.printf(json);
      
      //out.println(arr.get(0).getProduct_name());
      
   }
}