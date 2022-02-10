package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LikeDAO;
import model.MemberDTO;

public class DeleteLikeListCon implements iCommand{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session =request.getSession();
		MemberDTO member = null;
		member=(MemberDTO)session.getAttribute("member");
		String id = member.getMem_id();
		
		String[] delete_ts_nameList = request.getParameterValues("delete_ts_nameList");
		LikeDAO dao = new LikeDAO();
		int cnt = dao.deleteLikeList(id, delete_ts_nameList);

		if (cnt > 0) {
			System.out.println("선택삭제 완료");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('선택 삭제 완료');");
			out.print("location.href='LikeListCon.do';");
//			out.print("history.back()");
			out.print("</script>");
		} else {
			System.out.println("선택삭제 실패");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('선택삭제 실패');");
			out.print("history.back()");
			out.print("location.href='LikeListCon.do';");
			out.print("</script>");
		}

	}
}
