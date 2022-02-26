package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Paging;
import model.ReviewDAO;
import model.ReviewDTO;

public class ReviewCon implements iCommand {
//���� :
//	�̹� ���� ���¸� ���â���� �̹� ���� �� �Դϴ� ����
//��ü����, ���ѻ���Ȯ�� , �Ѱ����� 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
//		HttpSession session = request.getSession();

		ArrayList<ReviewDTO> allReviewList = new ArrayList<ReviewDTO>();
		ReviewDAO dao = new ReviewDAO();
		
		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		request.setAttribute("page", page);
		System.out.println("page : " + page);
		Paging paging = new Paging();
		paging.setPage(page);
		int pageCount = dao.getReviewCount();
		paging.setTotalCount(pageCount);
//		paging.setPage(page);
		
		allReviewList = dao.selectAllReview(page);
//		System.out.println(allReviewList.toString());
		
		request.setAttribute("allReviewList", allReviewList);
		request.setAttribute("paging", paging);
		RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
		dispatcher.forward(request, response);
	}

}