package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AccDTO;
import model.CfDTO;
import model.ParkDTO;
import model.ResDTO;
import model.SearchDAO;
import model.TsDTO;

public class SearchCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String search_word = request.getParameter("search_word");
		SearchDAO dao = new SearchDAO();
		ArrayList<TsDTO> searchedTsList = dao.search_ts(search_word);
		ArrayList<ResDTO> searchedResList = dao.search_res(search_word);
		ArrayList<CfDTO> searchedCfList = dao.search_cf(search_word);
		ArrayList<AccDTO> searchedAccomList = dao.search_accom(search_word);
		ArrayList<ParkDTO> searchedPList = dao.search_p(search_word);
		
//			세션에 넣는것보다 포워드로 일회용으로 보여주는게 좋을듯
			HttpSession session = request.getSession();
			session.setAttribute("searchedTsList", searchedTsList);
			session.setAttribute("searchedResList", searchedResList);
			session.setAttribute("searchedCfList", searchedCfList);
			session.setAttribute("searchedAccomList", searchedAccomList);
			session.setAttribute("searchedPList", searchedPList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);
			
	}
}
