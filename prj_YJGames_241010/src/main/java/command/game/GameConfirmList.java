package command.game;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.GameRegiDto;

public class GameConfirmList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		
		ArrayList<GameRegiDto> dtos = dao.GameRegiList();
		request.setAttribute("dtos", dtos);
	}

}
