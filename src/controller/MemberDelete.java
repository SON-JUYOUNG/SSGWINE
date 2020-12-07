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
		
		// 1. ����ڿ��� ������ email ���� ��������
		String id = request.getParameter("id");

		// 2. project_member ���̺��� email �� �����ϱ�
		// JDBC
		WineDAO wine_dao = new WineDAO();
		int cnt = wine_dao.memberDelete(id);

		if (cnt > 0) {
			response.sendRedirect("adpage.jsp");
		}

	}
}
		
		
		

