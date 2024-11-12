package command.admin;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.NewsDao;
import dto.NewsDto;

public class NewsList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		HttpSession session = request.getSession();
		ArrayList<NewsDto> dtos = null;
		String id = (String)session.getAttribute("sessionId");
		if(id.equals("admin")) {
			dtos = dao.getAllNewsList2();
		}else {
			dtos = dao.getDeveloperNewsList(id);
		}
		request.setAttribute("dtos", dtos);
		
	}

}
