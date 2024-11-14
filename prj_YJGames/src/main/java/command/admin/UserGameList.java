package command.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.LibraryDto;

public class UserGameList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String id = request.getParameter("u_id");
		String search = request.getParameter("t_search");
		if(search == null) search = "";
		GameDao dao = new GameDao();
		ArrayList<LibraryDto> dtos = dao.Library_game_List(id,search);
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("t_search", search);
	}
}
