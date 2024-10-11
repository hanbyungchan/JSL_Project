package command.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.ReviewDto;

public class ReviewList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String code = request.getParameter("t_g_code");
		String g_name = request.getParameter("t_g_name");
		String option = request.getParameter("t_review_option");
		if(option == null) option = "rating_desc";
		String step = "order by r.r_score DESC";
		if(option.equals("rating_desc")) step = "order by r.r_score DESC";
		else if(option.equals("rating_asc")) step = "order by r.r_score ASC";
		else if(option.equals("recent")) step = "order by r.r_date DESC";
		else if(option.equals("old")) step = "order by r.r_date ASC";
		ArrayList<ReviewDto> dtos = dao.ReviewList(step, code);
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("t_review_option", option);
		request.setAttribute("t_g_name", g_name);
	}

}
