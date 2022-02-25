package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.PreferenceDAO;
import model.PreferenceDTO;

public class preferenceCon implements iCommand {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int cnt = 0;
		String mem_like2 = null;
		HttpSession session =request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String mem_id = member.getMem_id();
		
		String mem_like[] = request.getParameterValues("place");
		PreferenceDAO dao = new PreferenceDAO();
		
		for(int i = 0; i < mem_like.length; i++) {
			
			mem_like2 = mem_like[i];
			cnt = dao.savePrefer(new PreferenceDTO(0, mem_id, mem_like2));
		}
		
		if (cnt > 0) {
			session.setAttribute("place", mem_like);
			out.print("<script>");
			out.print("alert('선호도 조사 성공..!');");
//			out.print("history.back();");
//			out.print("history.back();");
//			out.print("location.reload();");
			out.print("location.href='main.jsp';");
			out.print("</script>");
//			response.sendRedirect("main.jsp");
		} else {
			out.print("<script>");
			out.print("alert('선호도 조사 실패..!');");
			out.print("location.href='preference.jsp';");
			out.print("</script>");
		}
	}

}
