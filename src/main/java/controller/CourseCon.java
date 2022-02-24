package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CourseDAO;
import model.CourseDTO;

@WebServlet("/CourseCon")
public class CourseCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		System.out.println("CourseCon 요청이 들어왔다");
		String course_name = request.getParameter("course_name");
		System.out.println(course_name);
		CourseDAO dao = new CourseDAO();
		CourseDTO viewInfo = dao.selectCourse(course_name);
		
		session.setAttribute("viewInfo", viewInfo);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("course_view.jsp");
//		dispatcher.forward(request, response);
		response.sendRedirect("course_view.jsp");
		

	}

}
