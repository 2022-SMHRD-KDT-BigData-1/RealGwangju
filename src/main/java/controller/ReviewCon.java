package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		allReviewList = dao.selectAllReview();
		request.setAttribute("allReviewList", allReviewList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
		dispatcher.forward(request, response);
	}

}