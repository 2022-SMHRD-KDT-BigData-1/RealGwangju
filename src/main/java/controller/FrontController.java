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
			map.put("/Res_viewCon.do", new Res_viewCon());
			map.put("/Cf_viewCon.do", new Cf_viewCon());
			map.put("/Accom_viewCon.do", new Accom_viewCon());
			map.put("/P_viewCon.do", new P_viewCon());
			map.put("/DeleteLikeListCon.do", new DeleteLikeListCon());
			map.put("/SearchCon.do", new SearchCon());
			map.put("/search_viewCon.do", new search_viewCon());
			map.put("/menu_searchCon.do", new menu_searchCon());
			map.put("/searchSeeMoreCon.do", new searchSeeMoreCon());
			map.put("/searchMenuCon.do", new searchMenuCon());
			map.put("/WriteReviewCon.do", new WriteReviewCon());
			map.put("/DeleteReviewCon.do", new DeleteReviewCon());
			map.put("/ReviewCon.do", new ReviewCon());
			map.put("/preferenceCon.do", new preferenceCon());
		}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getServletPath();
		System.out.println("들어온 요청 : "+command);
		
		iCommand com = map.get(command);
		com.execute(request, response);
	}
}
		