package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.MemberDTO;
import model.ReviewDAO;

public class WriteReviewCon implements iCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디는 받아와서 저장해야지 날짜는 안넣어도 저장되나?
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String visit_name = request.getParameter("visit_name");
		String visit_img = request.getParameter("visit_img");
		String mem_nick = member.getMem_nick();

		String dir = "images/uploadedReviewImages";
		String realDir = request.getRealPath(dir);
		
		MultipartRequest multi = new MultipartRequest(request, realDir, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy());
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String reviewImgName = multi.getFilesystemName("reviewImg");
		String reviewImgPath = dir+"/"+reviewImgName;
//		if(reviewImgPath.equals("images/uploadedReviewImages/null")) {
//			reviewImgPath="";
//		}
//		File reviewImg = multi.getFile("fileName");
		
//		System.out.println("reviewImgName : " + reviewImgName);
//		System.out.println("reviewImgPath : " + reviewImgPath);
//		System.out.println("realDir : " + realDir);
//		
		ReviewDAO dao = new ReviewDAO();
		int cnt = dao.writeReview(visit_name, mem_nick, title, content, reviewImgPath);

		if (cnt > 0) {
			out.print("<script>");
			out.print("alert('리뷰 작성 완료!');");
			out.print("location.href = document.referrer;");
//			out.print("location.reload();");
			out.print("</script>");
//			response.sendRedirect("main.jsp");
		} else {
			out.print("<script>");
			out.print("alert('리뷰 작성 실패');");
			out.print("history.back();");
			out.print("</script>");
		}
	}
}
