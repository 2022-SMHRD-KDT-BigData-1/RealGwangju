package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.ReviewDAO;
import model.ReviewDTO;
import model.ResDTO;
import model.VisitDAO;

public class Res_viewCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String res_name = request.getParameter("visit_name");
		VisitDAO dao = new VisitDAO();
		ResDTO resInfo = dao.selectResInfo(res_name);
		
		if (resInfo != null) {
			request.setAttribute("resInfo", resInfo);
			ReviewDAO reviewDao = new ReviewDAO();
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ArrayList<ReviewDTO> allReview =  reviewDao.selectAllReview(res_name);
			request.setAttribute("allReview", allReview);
			if (member != null) {
				ReviewDTO myReview = new ReviewDTO();
				myReview = reviewDao.selectMyReview(member.getMem_nick(), res_name);
				request.setAttribute("myReview", myReview);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("res_view.jsp");
			dispatcher.forward(request, response);
//			response.sendRedirect("res_view.jsp");
		} else {
			out.print("<script>");
			out.print("alert('페이지 로딩 실패..!');");
			out.print("history.back()");
			out.print("</script>");
		}
	}

}