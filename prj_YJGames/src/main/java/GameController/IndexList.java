package GameController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.GameDao;
import dto.HomeDto;

public class IndexList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		ArrayList<HomeDto> dtos = dao.GameList("");
		
		request.setAttribute("t_dtos", dtos);

	}

}
