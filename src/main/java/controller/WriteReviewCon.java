package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.ReviewDAO;

public class WriteReviewCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		//아이디는 받아와서 저장해야지 날짜는 안넣어도 저장되나?
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String visit_name = request.getParameter("visit_name");
		String mem_nick = member.getMem_nick();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.writeReview(visit_name, mem_nick, title, content);

		if (cnt > 0) {
			out.print("<script>");
			out.print("alert('리뷰 작성 완료!');");
			out.print("location.reload();");
			out.print("</script>");
//			response.sendRedirect("main.jsp");
		} else {
			out.print("<script>");
			out.print("alert('리뷰 작성 실패');");
//			out.print("location.href='login.jsp';");
			out.print("</script>");
		}
	}
}
