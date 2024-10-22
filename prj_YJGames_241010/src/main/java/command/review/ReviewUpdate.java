package command.review;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.GameDao;
import dto.ReviewDto;

public class ReviewUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String u_id = request.getParameter("t_u_id");
		String g_code = request.getParameter("t_pageNo");
		String r_txt = request.getParameter("t_r_txt");
		String r_recommand = request.getParameter("t_r_recommand");
		String r_date = CommonUtil.getToday();
		ReviewDto dto = new ReviewDto(u_id, g_code, r_txt, r_date, r_recommand);
		String msg = "It has been edited";
		int result = dao.ReviewUpdate(dto);
		if(result == 0) {
			msg = "Edit failed..";
		}
		request.setAttribute("t_gubun", "review");
		request.setAttribute("t_page_no", g_code);
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Game");
	}

}