package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SearchDAO;

public class search_viewCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
//		session.removeAttribute("searchedTsList");
//		session.removeAttribute("searchedResList");
//		session.removeAttribute("searchedCfList");
//		session.removeAttribute("searchedAccomList");
//		session.removeAttribute("searchedPList");
		session.removeAttribute("searchedPopularWordList");
		
		
		SearchDAO dao = new SearchDAO();
		ArrayList<String> searchedPopularWordList = dao.selectPopularSearchWord();
		session.setAttribute("searchedPopularWordList", searchedPopularWordList);
		
//		response.sendRedirect("search.jsp");

		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}
}
