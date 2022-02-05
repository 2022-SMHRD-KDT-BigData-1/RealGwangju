package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;
import controller.iCommand;

public class JoinCon implements iCommand  {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String nick= request.getParameter("nick");
		int age= Integer.parseInt(request.getParameter("age"));
		String gen= request.getParameter("gen");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberJoin(new MemberDTO(id, pw, nick, age, gen));
		
		if(cnt>0) { //ȸ������ ���� > join_success (email��������)
			System.out.println("ȸ������ ����");
			request.setAttribute("success_data", nick);
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			out.print("alert('ȸ������ ����');");
//			out.print("</script>");
			//forward������� ������ �̵�
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
			dispatcher.forward(request, response);
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('ȸ������ ����..!');");
			out.print("location.href='main.jsp';");
			out.print("</script>");
		}
		
	}

}