package command.view;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.ReviewDto;
import dto.ViewDto;

public class ViewPage implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		GameDao dao = new GameDao();
		String no = req.getParameter("t_pageNo");
		ViewDto dto = dao.StorePageView(Integer.parseInt(no));
		ReviewDto dto1 = dao.ViewRe1(no);
		ReviewDto dto2 = dao.ViewRe2(no);
		ArrayList<ViewDto> dtos = dao.GameGenreList(no);
		req.setAttribute("dto", dto);
		req.setAttribute("dto1", dto1);
		req.setAttribute("dto2", dto2);
		req.setAttribute("dtos", dtos);
	}

}
