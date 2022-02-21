package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class search_viewCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		session.removeAttribute("searchedTsList");
		session.removeAttribute("searchedResList");
		session.removeAttribute("searchedCfList");
		session.removeAttribute("searchedAccomList");
		session.removeAttribute("searchedPList");
		
		response.sendRedirect("search.jsp");

//		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
//		dispatcher.forward(request, response);

	}
}
