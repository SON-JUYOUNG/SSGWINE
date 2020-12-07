package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product_basketDAO;
import model.Wine_basketDAO;

/**
 * Servlet implementation class InsertProductCart
 */
@WebServlet("/InsertProductCart")
public class InsertProductCart extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서버호출 성공");
		request.setCharacterEncoding("utf-8");
		
		String product = request.getParameter("product");
		System.out.println(product);
		
		int count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		String id = request.getParameter("id");
		
		Product_basketDAO product_dao = new Product_basketDAO();
		int cnt = product_dao.insert(id, product, count);
		
		if(cnt>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
	}

}
