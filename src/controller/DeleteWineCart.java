package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Wine_basketDAO;

/**
 * Servlet implementation class DeleteWineCart
 */
@WebServlet("/DeleteWineCart")
public class DeleteWineCart extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wine_name = request.getParameter("wine_name");
		int count = Integer.parseInt(request.getParameter("count"));
		String id = request.getParameter("id");
		int w_seq = Integer.parseInt(request.getParameter("w_seq"));
		System.out.println(wine_name);
		System.out.println(count);
		System.out.println(id);
		System.out.println(w_seq);
		Wine_basketDAO wine_basket_dao = new Wine_basketDAO();
		
		//int cnt = wine_basket_dao.delete(wine_name, count, id);
		int cnt = wine_basket_dao.delete(wine_name, count, id, w_seq);
		
		
		if(cnt > 0) { System.out.println("성공");
		}else { System.out.println("실패"); }
		 
		
		
	}

}
