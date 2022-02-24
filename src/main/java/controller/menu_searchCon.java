package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SearchDAO;
import model.TsDTO;

public class menu_searchCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * request.setCharacterEncoding("utf-8");
		 * response.setContentType("text/html; charset=utf-8"); HttpSession session =
		 * request.getSession(); SearchDAO dao = new SearchDAO();
		 * 
		 * String menu_kind = request.getParameter("menu_kind"); if
		 * (menu_kind.equals("ts")) { ArrayList<TsDTO> allTsList = new
		 * ArrayList<TsDTO>(); allTsList = dao.searchAllTsList();
		 * request.setAttribute("allTsList", allTsList); } else if
		 * (menu_kind.equals("res")) { } else if (menu_kind.equals("cf")) { } else if
		 * (menu_kind.equals("acc")) { } else if (menu_kind.equals("p")) { }
		 * 
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		 * dispatcher.forward(request, response);
		 */
	}
}