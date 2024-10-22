package command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.ReviewDto;
import dto.ViewDto;

public class ReviewUpdateForm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String code = request.getParameter("t_pageNo");
		ViewDto dto = dao.GameName(code);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		ReviewDto dto2 = dao.MyReview(id, code);
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_dto2", dto2);

	}

}
