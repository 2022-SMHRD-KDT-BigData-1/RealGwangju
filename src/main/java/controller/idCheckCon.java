package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

@WebServlet("/idCheckCon")
public class idCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("mem_id");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		
		int idCheck = dao.checkId(userId);
		
		if(idCheck == 0) {
			System.out.println("이미 존재하는 아이디입니다");
		} else if(idCheck==1) {
			System.out.println("사용 가능한 아이디입니다.");
		}
		out.write(idCheck + "");
	}


	
}
