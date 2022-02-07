package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TsDTO;
import model.VisitDAO;

public class Ts_viewCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		String ts_name = request.getParameter("ts_name");
		VisitDAO dao = new VisitDAO();
		TsDTO tsInfo = dao.selectTsInfo(ts_name);

		if (tsInfo != null) {
//			HttpSession session = request.getSession();
//			response.sendRedirect("ts_view.jsp");
//			session.setAttribute("ts", ts);
			request.setAttribute("tsInfo", tsInfo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ts_view.jsp");
			dispatcher.forward(request, response);
		} else {
			out.print("<script>");
			out.print("alert('페이지 로딩 실패..!');");
			out.print("history.back()");
			out.print("</script>");
		}
	}

}