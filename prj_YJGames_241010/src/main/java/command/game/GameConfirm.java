package command.game;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.GameRegiDto;

public class GameConfirm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String g_code = request.getParameter("t_g_code");
		GameRegiDto dto = new GameRegiDto();
		int result = dao.GameConfirm(g_code);
		if(result != 0) request.setAttribute("t_msg", "Confirm successful");
		else {request.setAttribute("t_msg", "Confirm failed... Please try again");}
		request.setAttribute("t_url", "Game");
	}

}
