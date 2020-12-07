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
      
      System.out.println("���� ȣ�� ����");
      request.setCharacterEncoding("utf-8");
      
      String sort_plus = request.getParameter("sort_plus");
      String use_plus = request.getParameter("use_plus");
      int sugar = Integer.parseInt(request.getParameter("sugar"));
      int acidity = Integer.parseInt(request.getParameter("acidity"));
      int body = Integer.parseInt(request.getParameter("body"));
      
      if(use_plus.equals("����")) {
         use_plus="���丮Ƽ������";
      }else if(use_plus.equals("����")) {
         use_plus="���̺����";
      }else if(sort_plus.equals("����")) {
         use_plus="����Ʈ����";
      }else {
      }
      
      recommend_dao dao = new recommend_dao();
      
      //��ģ���� DB���� �����̸��̶� �����ּҰ� �������� ģ��
      recommend_dto vo = dao.recommend2(sort_plus, use_plus, sugar, acidity, body);
      
      //���� 5���� ���� DB���� ������ �����̸�
      String winename = vo.getWinename();
      System.out.println(vo);
      //�����̸��� ���� �ٽ� �� �� �� DB���� ��õ��ǰ�� ������ ���� ģ��
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
      
      //����� ������ json���� ������ ģ��
      PrintWriter out=response.getWriter();
      out.printf(json);
      
      //out.println(arr.get(0).getProduct_name());
      
   }
}