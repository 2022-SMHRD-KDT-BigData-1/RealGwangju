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
import model.TsDTO;
import model.VisitDAO;

public class Ts_viewCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");

		
		

		String ts_name = request.getParameter("visit_name");
		VisitDAO dao = new VisitDAO();
		TsDTO tsInfo = dao.selectTsInfo(ts_name);
		
		try {
			String mem_id = member.getMem_id();
			int cnt = dao.selectTsSee(mem_id, ts_name);
		} catch (Exception e) {
			
		}
		//String mem_id = "호우";
		
		if (tsInfo != null) {
			request.setAttribute("tsInfo", tsInfo);
			ReviewDAO reviewDao = new ReviewDAO();
			
			ArrayList<ReviewDTO> allReview =  reviewDao.selectAllReview(ts_name);
			request.setAttribute("allReview", allReview);
			if (member != null) {
				ReviewDTO myReview = new ReviewDTO();
				myReview = reviewDao.selectMyReview(member.getMem_nick(), ts_name);
				request.setAttribute("myReview", myReview);
			}
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