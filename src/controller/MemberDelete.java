package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.WineDAO;


@WebServlet("/memberdelete")
public class MemberDelete extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 1. 사용자에게 삭제할 email 값을 가져오기
		String id = request.getParameter("id");

		// 2. project_member 테이블에서 email 값 삭제하기
		// JDBC
		WineDAO wine_dao = new WineDAO();
		int cnt = wine_dao.memberDelete(id);

		if (cnt > 0) {
			response.sendRedirect("adpage.jsp");
		}

	}
}
		
		
		

