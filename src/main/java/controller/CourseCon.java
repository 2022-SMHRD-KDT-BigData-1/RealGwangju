package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		//HttpSession session = request.getSession();
		
		System.out.println("CourseCon 요청이 들어왔다");
		// int course_num = Integer.parseInt(request.getParameter("course_num"));
		CourseDAO dao = new CourseDAO();
		ArrayList<CourseDTO> courseInfo = dao.courseSelectAll();
		
		if (courseInfo != null) {
			request.setAttribute("courseInfo", courseInfo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("course.jsp");
			dispatcher.forward(request, response);
			response.sendRedirect("course.jsp");
		} else {
			out.print("<script>");
			out.print("alert('페이지 로딩 실패..!');");
			out.print("history.back()");
			out.print("</script>");
		}
	}

}