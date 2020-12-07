package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Wine_basketDAO;

/**
 * Servlet implementation class InsertWineCart
 */
@WebServlet("/InsertWineCart")
public class InsertWineCart extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서버 호출 성공");
		
		request.setCharacterEncoding("utf-8");
		
		String wine_basket = request.getParameter("wine_basket");
		System.out.println(wine_basket);

		int count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		Wine_basketDAO winebasket_dao = new Wine_basketDAO();
		
		int cnt = winebasket_dao.insert(id, wine_basket, count);
		
		if(cnt>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}

}
