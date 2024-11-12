package command.news;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NewsDao;

public class NewsDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		String no = request.getParameter("n_no");
		String msg = "It has been deleted";
		int result = dao.NewsDelete(no);
		if(result == 0) {
			msg = "Deletion failed..";
		}
		request.setAttribute("t_gubun", "list");
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}
