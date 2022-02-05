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
//���� :
//	�̹� ���� ���¸� ���â���� �̹� ���� �� �Դϴ� ����
//��ü����, ���ѻ���Ȯ�� , �Ѱ����� 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session =request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getMem_id();
//		String ts_name= "";   <<< �����ؾ���
//		
		VisitDAO dao = new VisitDAO();
		int cnt = dao.like(id, ts_name);

		if (cnt > 0) {
			System.out.println("���Ͽ� �߰�����");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('���Ͽ� �߰��߾��~');");
			out.print("</script>");
		} else {
			System.out.println("���Ͽ� �߰�����");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('���� ���� ����');");
//			out.print("location.href='main.jsp';");
			out.print("</script>");
		}

	}

}