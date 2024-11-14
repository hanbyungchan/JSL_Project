package command.view;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		String msg = "";
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("sessionId");
		int count2 = dao.Whether_to_purchase(id, no);
		int count3 = dao.Whether_to_cart(id, no);
		if(count2 == 1){msg = "This game has already been purchased.";}
		if(count3 == 1){msg = "The game is already in your cart.";}
		ArrayList<ViewDto> dtos = dao.GameGenreList(no);
		req.setAttribute("dto", dto);
		req.setAttribute("dto1", dto1);
		req.setAttribute("dto2", dto2);
		req.setAttribute("dtos", dtos);
		req.setAttribute("msg", msg);
	}
}
