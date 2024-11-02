package command.news;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.NewsDao;
import dto.NewsDto;

public class NewsWrite implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		HttpSession session = request.getSession();
		String n_no = dao.AutoCode();
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_attach = request.getParameter("n_attach");
		String n_uploader = (String)session.getAttribute("sessionId");
		String n_upload_date = CommonUtil.getToday();
		String g_code = request.getParameter("g_code");
		NewsDto dto = new  NewsDto(n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, g_code);
		String msg = "It has been Registered.";
		int result = dao.NewsSave(dto);
		if(result == 0) {
			msg = "Registration failed..";
		}
		request.setAttribute("t_gubun", "index");
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}
