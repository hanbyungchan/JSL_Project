package command.game;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.GameRegiDto;

public class GameConfirmView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String g_code = request.getParameter("t_g_code");
		ArrayList<GameRegiDto> dto = dao.GameRegiView(g_code);
		request.setAttribute("dto", dto);

	}

}
