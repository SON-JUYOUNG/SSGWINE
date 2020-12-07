package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.User_MemberDTO;
import model.Wine_basketDAO;
import model.Wine_basketDTO;

@WebServlet("/SelectWineBasket")
public class SelectWineBasket extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Wine_basketDAO dao = new Wine_basketDAO();
		
		User_MemberDTO dto = (User_MemberDTO)session.getAttribute("user_dto");
		
		ArrayList<Wine_basketDTO> list = dao.select(dto.getId());
		
		Gson gson = new Gson();
		
		String jsonArr = gson.toJson(list);
		
		response.setContentType("text/plain; charset=utf-8");
		
		response.getWriter().print(jsonArr);
		
	}

}
