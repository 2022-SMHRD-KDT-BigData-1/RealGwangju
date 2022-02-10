package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LikeDAO;
import model.MemberDTO;
import model.TsDTO;
import model.VisitDAO;


public class LikeListCon implements iCommand {


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
			out.print("alert('로그인시 이용가능합니다');");
			out.print("history.back();");
			out.print("</script>");
		}
		String id = member.getMem_id();
		LikeDAO dao = new LikeDAO();
		ArrayList<String> likeNameList = dao.selectLikeList(id);
		VisitDAO visitDao = new VisitDAO();
		ArrayList<TsDTO> likeList = new ArrayList<TsDTO>();
		for(int i = 0 ; i<likeNameList.size(); i++) {
			likeList.add(visitDao.selectTsInfo(likeNameList.get(i)));
		}
		
		
		
//		if(likeList ==null) {
//			System.out.println("찜목록 비어있음");
//		}
		//session방식
//		HttpSession session = request.getSession();
//		response.sendRedirect("likeList.jsp");
		// forward방식
		request.setAttribute("likeList", likeList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("likeList.jsp");
		dispatcher.forward(request, response);
	}

}
