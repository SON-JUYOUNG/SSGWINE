package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.WineDAO;

@WebServlet("/wineDelete")
public class WineDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		// 1. ����ڿ��� ������ email ���� ��������
		String winename = request.getParameter("winename");

		// 2. project_member ���̺��� email �� �����ϱ�
		// JDBC
		WineDAO wine_dao = new WineDAO();
		int cnt = wine_dao.wineDelete(winename);

		if (cnt > 0) {
			response.sendRedirect("adpage_product.jsp");
		}

	}

}
