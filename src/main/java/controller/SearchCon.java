package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SearchDAO;
import model.TsDTO;

public class SearchCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String search_word = request.getParameter("search_word");
		SearchDAO dao = new SearchDAO();
		ArrayList<TsDTO> searchedTsList = dao.search_ts(search_word);
		
//			���ǿ� �ִ°ͺ��� ������� ��ȸ������ �����ִ°� ������
			request.setAttribute("searchedTsList", searchedTsList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);
			
	}
}
