package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDTO;
import model.LikeDAO;


public class LikeListCon implements iCommand {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session =request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getMem_id();
		
		
		LikeDAO dao = new LikeDAO();
		
		ArrayList<String> likeList = dao.selectLikeList(id);
		if(likeList ==null) {
			System.out.println("찜목록 비어있음");
		}
		//session방식
//		HttpSession session = request.getSession();
//		response.sendRedirect("select.jsp");

		// forward방식
		request.setAttribute("likeList", likeList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("likeList.jsp");
		dispatcher.forward(request, response);
	}

}
