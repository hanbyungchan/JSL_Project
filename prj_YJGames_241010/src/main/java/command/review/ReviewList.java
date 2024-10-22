package command.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.ReviewDto;
import dto.ViewDto;

public class ReviewList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String code = request.getParameter("t_pageNo");
		ViewDto dto = dao.GameName(code);
		ReviewDto dto2 = dao.MyReview(id, code);
		String option = request.getParameter("t_review_option");
		if(option == null) option = "recent";
		String step = "order by r.r_date DESC";
		if(option.equals("good")) step = "and r_recommand ='g' order by r.r_date DESC";
		else if(option.equals("bad")) step = "and r_recommand ='b' order by r.r_date DESC";
		else if(option.equals("recent")) step = "order by r.r_date DESC";
		else if(option.equals("old")) step = "order by r.r_date ASC";
		ArrayList<ReviewDto> dtos = dao.ReviewList(step, code);
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_dto2", dto2);
		request.setAttribute("t_review_option", option);
	}

}
