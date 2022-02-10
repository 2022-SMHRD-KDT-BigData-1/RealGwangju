package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.ReviewDAO;
import model.ReviewDTO;
import model.TsDTO;
import model.VisitDAO;

public class Ts_viewCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String ts_name = request.getParameter("visit_name");
		VisitDAO dao = new VisitDAO();
		TsDTO tsInfo = dao.selectTsInfo(ts_name);
		ReviewDAO reviewDao = new ReviewDAO();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		ReviewDTO review = new ReviewDTO();
		review = reviewDao.selectReview(member.getMem_nick(), ts_name);

		if (tsInfo != null) {
			request.setAttribute("tsInfo", tsInfo);
			request.setAttribute("review", review);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ts_view.jsp");
			dispatcher.forward(request, response);
//			response.sendRedirect("ts_view.jsp");
		} else {
			out.print("<script>");
			out.print("alert('페이지 로딩 실패..!');");
			out.print("history.back()");
			out.print("</script>");
		}
	}

}