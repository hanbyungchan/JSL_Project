package command.library;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.LibraryDto;

public class LibraryList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("sessionId");
		String search = request.getParameter("t_search");
		if(search == null) search = "";
		GameDao dao = new GameDao();
		ArrayList<LibraryDto> dtos = dao.Library_game_List(u_id,search);
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("t_search", search);

	}

}
