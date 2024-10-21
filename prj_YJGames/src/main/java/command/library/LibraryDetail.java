package command.library;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.LibraryDto;
import dto.ReviewDto;
import dto.ViewDto;

public class LibraryDetail implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("sessionId");
		String search = request.getParameter("t_search");
		String g_code = request.getParameter("t_pageNo");
		if(search == null) search = "";
		GameDao dao = new GameDao();
		ArrayList<LibraryDto> dtos = dao.Library_game_List(u_id,search);
		ArrayList<ReviewDto> dtos2 = dao.ReviewList("order by r.r_date DESC", g_code);
		ViewDto dto = dao.StorePageView(Integer.parseInt(g_code));
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("t_dtos2", dtos2);
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_search", search);

	}

}
