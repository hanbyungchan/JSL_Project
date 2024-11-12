package command.game;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.GameRegiDto;

public class GameConfirm2 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		String[] confirmList = request.getParameterValues("confirmList");
		GameRegiDto dto = new GameRegiDto();
		
		int result = dao.GameConfirm2(confirmList);
		if(result != 0) request.setAttribute("t_msg", "Confirm successful");
		else {request.setAttribute("t_msg", "Confirm failed... Please try again");}
		request.setAttribute("t_url", "Game");

	}

}
