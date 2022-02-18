package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CfDTO;
import model.MemberDTO;
import model.ReviewDAO;
import model.ReviewDTO;
import model.VisitDAO;

public class Cf_viewCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String cf_name = request.getParameter("visit_name");
		VisitDAO dao = new VisitDAO();
		CfDTO cfInfo = dao.selectCfInfo(cf_name);
		
		if (cfInfo != null) {
			request.setAttribute("cfInfo", cfInfo);
			ReviewDAO reviewDao = new ReviewDAO();
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			ArrayList<ReviewDTO> allReview =  reviewDao.selectAllReview(cf_name);
			request.setAttribute("allReview", allReview);
			if (member != null) {
				ReviewDTO myReview = new ReviewDTO();
				myReview = reviewDao.selectMyReview(member.getMem_nick(), cf_name);
				request.setAttribute("myReview", myReview);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("cf_view.jsp");
			dispatcher.forward(request, response);
//			cfponse.sendRedirect("cf_view.jsp");
		} else {
			out.print("<script>");
			out.print("alert('페이지 로딩 실패..!');");
			out.print("history.back()");
			out.print("</script>");
		}
	}

}