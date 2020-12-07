package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product_basketDAO;

/**
 * Servlet implementation class DeleteProductCart
 */
@WebServlet("/DeleteProductCart")
public class DeleteProductCart extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_name = request.getParameter("product_name");
		int count = Integer.parseInt(request.getParameter("count"));
		String id = request.getParameter("id");
		int p_seq = Integer.parseInt(request.getParameter("p_seq"));
		
		System.out.println(product_name);
		System.out.println(count);
		System.out.println(id);
		System.out.println(p_seq);
		Product_basketDAO product_basket_dao = new Product_basketDAO();
		
		//int cnt = wine_basket_dao.delete(wine_name, count, id);
		int cnt = product_basket_dao.delete(product_name, count, id, p_seq);
		
		
		if(cnt > 0) { System.out.println("성공");
		}else { System.out.println("실패"); }
		 
	}

}
