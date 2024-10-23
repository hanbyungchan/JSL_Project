package command.news;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NewsDao;
import dto.NewsDto;

public class News implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		//뉴스게시판
		NewsDao dao = new NewsDao();
		
		ArrayList<NewsDto> dtos = dao.getAllNewsList();
		
		request.setAttribute("dtos", dtos);
		
		
	}

}
