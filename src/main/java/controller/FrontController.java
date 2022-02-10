package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, iCommand> map;
	@Override
		public void init() throws ServletException {
			map = new HashMap<String, iCommand>();
			map.put("/JoinCon.do", new JoinCon());
			map.put("/LoginCon.do", new LoginCon());
			map.put("/LikeCon.do", new LikeCon());
			map.put("/LikeListCon.do", new LikeListCon());
			map.put("/Ts_viewCon.do", new Ts_viewCon());
			map.put("/DeleteLikeListCon.do", new DeleteLikeListCon());
			map.put("/SearchCon.do", new SearchCon());
			map.put("/WriteReviewCon.do", new WriteReviewCon());
		}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getServletPath();
		System.out.println("들어온 요청 : "+command);
		
		iCommand com = map.get(command);
		com.execute(request, response);
	}
}
		