package command.news;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NewsDao;
import dto.NewsDto;

public class News implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		NewsDao dao = new NewsDao();
		ArrayList<NewsDto> dtos = new ArrayList<NewsDto>();
		String g_code = request.getParameter("g_code");
		
		if(g_code==null) {
			dtos = dao.getAllNewsList();
		}
		else {
			dtos = dao.getParticularNewsList(g_code);
		}
		
		
		
		
		
		request.setAttribute("dtos", dtos);
		
		
	}

}
