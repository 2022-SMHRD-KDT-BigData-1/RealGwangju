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
//할일 :
//	이미 찜한 상태면 경고창으로 이미 찜한 곳 입니다 띄우기
//전체삭제, 찜한상태확인 , 한개삭제 
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