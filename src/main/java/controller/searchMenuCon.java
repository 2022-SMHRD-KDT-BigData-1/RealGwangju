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
import model.Paging;
import model.ParkDTO;
import model.ResDTO;
import model.SearchDAO;
import model.TsDTO;

public class searchMenuCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String visit_kind = request.getParameter("visit_kind");
//		session.removeAttribute("search_word");
		String search_word = "";
		
		System.out.println("visit_kind : " + visit_kind + " / search_word : " + search_word);

		SearchDAO dao = new SearchDAO();
//		session.removeAttribute("visit_kind");
		session.setAttribute("visit_kind", visit_kind);

		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page=1;
		}
		request.setAttribute("page", page);
		System.out.println("page : " + page);
		Paging paging = new Paging();
		paging.setPage(page);
		
		
//		String pc = request.getParameter("pageCount");
//		System.out.println("pc : " + pc);
		int pageCount;
		pageCount = dao.getVisitCount(visit_kind);
		session.setAttribute("pageCount", pageCount);

		System.out.println("pageCount : " + pageCount);
		paging.setTotalCount(pageCount);
		paging.setPage(page);

		if (visit_kind.equals("ts")) {
			ArrayList<TsDTO> searchedTsList = new ArrayList<TsDTO>();
			searchedTsList = dao.seeMore_ts(search_word, page);
			request.setAttribute("searchedTsList", searchedTsList);
		} else if (visit_kind.equals("res")) {
			ArrayList<ResDTO> searchedResList = new ArrayList<ResDTO>();
			searchedResList = dao.seeMore_res(search_word, page);
			request.setAttribute("searchedResList", searchedResList);
		} else if (visit_kind.equals("cf")) {
			ArrayList<CfDTO> searchedCfList = new ArrayList<CfDTO>();
			searchedCfList = dao.seeMore_cf(search_word, page);
			request.setAttribute("searchedCfList", searchedCfList);
		} else if (visit_kind.equals("acc")) {
			ArrayList<AccDTO> searchedAccomList = new ArrayList<AccDTO>();
			searchedAccomList = dao.seeMore_accom(search_word, page);
			request.setAttribute("searchedAccomList", searchedAccomList);
		} else if (visit_kind.equals("p")) {
			ArrayList<ParkDTO> searchedPList = new ArrayList<ParkDTO>();
			searchedPList = dao.seeMore_p(search_word, page);
			request.setAttribute("searchedPList", searchedPList);
		}

		request.setAttribute("search_word", search_word);
		request.setAttribute("paging", paging);
		RequestDispatcher dispatcher = request.getRequestDispatcher("searchSeeMore.jsp");
		dispatcher.forward(request, response);

	}
}
