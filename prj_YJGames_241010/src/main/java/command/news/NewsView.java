package command.news;


import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.NewsDao;
import dto.NewsDto;

public class NewsView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		//상세보기
		NewsDao dao = new NewsDao();
		String n_no = request.getParameter("n_no");
		NewsDto dto = dao.getNewsView(n_no);
		
		request.setAttribute("dto", dto);
		
	}

}
