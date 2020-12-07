package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User_MemberDAO;
import model.User_MemberDTO;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/MemberUpdate")
public class MemberUpdate extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.print("서버 호출 성공");
		
		HttpSession session = request.getSession();
		User_MemberDTO user_dto = (User_MemberDTO) session.getAttribute("user_dto");
		
		String id = user_dto.getId();
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(email);
		System.out.println(tel);

		User_MemberDAO user_dao = new User_MemberDAO();
		int cnt = user_dao.Update(pw, email, tel, id);
		
		if(cnt>0) {
			System.out.println("성공");
			response.sendRedirect("wine_home.jsp");
		}else {
			System.out.println("실패");
			response.sendRedirect("mypage.jsp");
		}
		
	}

}
