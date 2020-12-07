package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User_MemberDAO;
import model.User_MemberDTO;
import model.Wine_basketDAO;
import model.Wine_basketDTO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class MemberLogin extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 System.out.print("서버 호출 성공");
	      
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      
	      System.out.println(id+pw);
	      
	      User_MemberDAO user_dao = new User_MemberDAO();
	      User_MemberDTO user_dto = user_dao.login(id, pw);
	      
	      
	      //Wine_basketDAO wine_basket_dao = new Wine_basketDAO();
	      //ArrayList<Wine_basketDTO>wine_list = wine_basket_dao.select(id);
	      //System.out.println(wine_list.size()+"<- 와인 장바구니 갯수");
	      
	    //회원정보가 있는 경우 로그인 성공
			if (user_dto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user_dto", user_dto);
				System.out.println("성공");
				response.sendRedirect("wine_home.jsp");
				
			}else {
			System.out.println("실패");
			response.sendRedirect("login.jsp");
			}

	
	
	}

}
