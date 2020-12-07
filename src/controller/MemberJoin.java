package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User_MemberDAO;

/**
 * Servlet implementation class Join
 */
@WebServlet("/Join")
public class MemberJoin extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("서버 호출 성공");
	      
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      String email = request.getParameter("email");
	      String name = request.getParameter("name");
	      String tel = request.getParameter("tel");
	      
	      User_MemberDAO member_dao = new User_MemberDAO();
	      int cnt = member_dao.Join(id, pw, email, name, tel);
	      
	      if(cnt>0) {
	         response.sendRedirect("login.jsp");
	      }else {
	         response.sendRedirect("join.jsp");
	      }

	}

}
