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
		HttpSession session = request.getSession();
		SearchDAO dao = new SearchDAO();
		String search_word = request.getParameter("search_word");

		int isCountPopularSearchWord = dao.countPopularSearchWord(search_word);
		if (isCountPopularSearchWord > 0) {
			System.out.println("�˻��� ī��Ʈ ����");
		}
		ArrayList<TsDTO> searchedTsList = dao.search_ts(search_word);
		ArrayList<ResDTO> searchedResList = dao.search_res(search_word);
		ArrayList<CfDTO> searchedCfList = dao.search_cf(search_word);
		ArrayList<AccDTO> searchedAccomList = dao.search_accom(search_word);
		ArrayList<ParkDTO> searchedPList = dao.search_p(search_word);

//			���ǿ� �ִ°ͺ��� ������� ��ȸ������ �����ִ°� ������
//			HttpSession session = request.getSession();
		request.setAttribute("searchedTsList", searchedTsList);
		request.setAttribute("searchedResList", searchedResList);
		request.setAttribute("searchedCfList", searchedCfList);
		request.setAttribute("searchedAccomList", searchedAccomList);
		request.setAttribute("searchedPList", searchedPList);
		session.setAttribute("search_word", search_word);

		RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);

	}
}
