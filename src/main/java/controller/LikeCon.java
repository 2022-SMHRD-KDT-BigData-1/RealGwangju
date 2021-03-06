package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LikeDAO;
import model.MemberDTO;

public class LikeCon implements iCommand {
//할일 :
//	이미 찜한 상태면 경고창으로 이미 찜한 곳 입니다 띄우기
//전체삭제, 찜한상태확인 , 한개삭제 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		MemberDTO member = null;
		member = (MemberDTO) session.getAttribute("member");
		if (member == null) {
			out.print("<script>");
			out.print("alert('로그인시 이용가능합니다');");
			out.print("history.back();");
			out.print("</script>");
		}

		String id = member.getMem_id();
		String ts_name = request.getParameter("ts_name");
//		String kind = request.getParameter("kind");
		LikeDAO dao = new LikeDAO();
		int likeIsDuplicate = dao.like_duplicate_check(id, ts_name);
		if (likeIsDuplicate > 0) {
			System.out.println("찜목록에 이미있음");
			out.print("<script>");
			out.print("alert('이미 찜이 되어있습니다.');");
			out.print("history.back()");
			out.print("</script>");

		} else {

			int cnt = dao.like(id, ts_name);

			if (cnt > 0) {
				System.out.println("찜목록에 추가성공");
				out.print("<script>");
				out.print("alert('찜목록에 추가했어요~');");
				out.print("history.back()");
				out.print("</script>");
			} else {
				System.out.println("찜목록에 추가실패");
				out.print("<script>");
				out.print("alert('찜목록 저장 실패');");
				out.print("history.back()");
//			out.print("location.href='main.jsp';");
				out.print("</script>");
			}
		}

	}

}