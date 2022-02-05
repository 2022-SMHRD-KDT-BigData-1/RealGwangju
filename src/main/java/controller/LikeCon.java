package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.VisitDAO;

public class LikeCon implements iCommand {
//할일 :
//	이미 찜한 상태면 경고창으로 이미 찜한 곳 입니다 띄우기
//전체삭제, 찜한상태확인 , 한개삭제 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session =request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getMem_id();
//		String ts_name= "";   <<< 여기해야함
//		
		VisitDAO dao = new VisitDAO();
		int cnt = dao.like(id, ts_name);

		if (cnt > 0) {
			System.out.println("찜목록에 추가성공");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('찜목록에 추가했어요~');");
			out.print("</script>");
		} else {
			System.out.println("찜목록에 추가실패");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('찜목록 저장 실패');");
//			out.print("location.href='main.jsp';");
			out.print("</script>");
		}

	}

}