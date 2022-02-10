package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberDTO;

public class WriteReviewCon implements iCommand{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		//아이디는 받아와서 저장해야지 날짜는 안넣어도 저장되나?
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		MemberDAO dao = new MemberDAO();
		MemberDTO member = dao.memberLogin(id, pw);

		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			out.print("<script>");
			out.print("alert('로그인 성공..!');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
//			response.sendRedirect("main.jsp");
		} else {
//			response.setContentType("text/html; charset=utf-8");
			out.print("<script>");
			out.print("alert('로그인 실패..!');");
			out.print("location.href='login.jsp';");
			out.print("</script>");
		}
	}
}
