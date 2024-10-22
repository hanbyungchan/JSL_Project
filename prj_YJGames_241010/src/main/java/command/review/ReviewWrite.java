package command.review;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.ViewDto;

public class ReviewWrite implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String code = request.getParameter("t_pageNo");
		ViewDto dto = dao.GameName(code);
		request.setAttribute("t_dto", dto);
		
	}

}
