package command.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.ReviewDto;

public class MyReviewList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		ArrayList<ReviewDto> dtos = dao.MyReviewList(id);
		request.setAttribute("t_dtos", dtos);
	}

}
