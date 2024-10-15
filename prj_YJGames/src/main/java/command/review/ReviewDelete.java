package command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;

public class ReviewDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String code = request.getParameter("t_pageNo");
		String msg = "It has been deleted";
		int result = dao.ReviewDelete(id, code);
		if(result == 0) {
			msg = "Deletion failed..";
		}
		request.setAttribute("t_gubun", "review");
		request.setAttribute("t_page_no", code);
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}
