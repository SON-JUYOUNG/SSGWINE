package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product_basketDAO;
import model.Product_basketDTO;
import model.User_MemberDTO;
import model.Wine_basketDAO;
import model.Wine_basketDTO;

/**
 * Servlet implementation class UpdateCart
 */
@WebServlet("/UpdateWineCart")
public class UpdateWineCart extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User_MemberDTO user_dto = (User_MemberDTO)session.getAttribute("user_dto");
		
		String wine_name = request.getParameter("wine_name");
		int count = Integer.parseInt(request.getParameter("count"));
		String id = request.getParameter("id");
		int w_seq = Integer.parseInt(request.getParameter("w_seq"));
		
		System.out.println(wine_name);
		System.out.println(count);
		System.out.println(id);
		System.out.println(w_seq);
		
		Wine_basketDAO wine_basket_dao = new Wine_basketDAO();
		int cnt = wine_basket_dao.update(wine_name, count, id, w_seq);
		
		if(cnt > 0) { System.out.println("성공");
		}else { System.out.println("실패"); }
	}

}
