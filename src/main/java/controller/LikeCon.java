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
//���� :
//	�̹� ���� ���¸� ���â���� �̹� ���� �� �Դϴ� ����
//��ü����, ���ѻ���Ȯ�� , �Ѱ����� 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session =request.getSession();
		MemberDTO member = null;
		member=(MemberDTO)session.getAttribute("member");
		if(member==null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�α��ν� �̿밡���մϴ�');");
			out.print("history.back();");
			out.print("</script>");
		}
		
		
		
		String id = member.getMem_id();
		String ts_name = request.getParameter("ts_name");
		LikeDAO dao = new LikeDAO();
		int cnt = dao.like(id, ts_name);

		if (cnt > 0) {
			System.out.println("���Ͽ� �߰�����");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('���Ͽ� �߰��߾��~');");
			out.print("history.back()");
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