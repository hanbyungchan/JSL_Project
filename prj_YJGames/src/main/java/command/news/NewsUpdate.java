package command.news;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.NewsDao;
import dto.NewsDto;

public class NewsUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		String n_no = request.getParameter("n_no");
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_attach = request.getParameter("n_attach");
		String n_update_date = CommonUtil.getToday();
		NewsDto dto = new  NewsDto(n_no, n_title, n_content, n_attach, n_update_date);
		String msg = "It has been Updated.";
		int result = dao.NewsUpdate(dto);
		if(result == 0) {
			msg = "Update failed..";
		}
		request.setAttribute("t_gubun", "index");
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}
