package command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.GameDao;
import dto.ReviewDto;

public class ReviewUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String g_code = request.getParameter("t_pageNo");
		String r_txt = request.getParameter("t_r_txt");
		r_txt = r_txt.replace("'","''");
		r_txt = r_txt.replace("\"", "..");
		String r_recommand = request.getParameter("t_r_recommand");
		String r_date = CommonUtil.getToday();
		ReviewDto dto = new ReviewDto(id, g_code, r_txt, r_date, r_recommand);
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
