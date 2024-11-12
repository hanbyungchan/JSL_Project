package command.admin;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.HomeDto;

public class GamesList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		HttpSession session = request.getSession();
		ArrayList<HomeDto> dtos = null;
		String id = (String)session.getAttribute("sessionId");
		if(id.equals("admin")) {
			dtos = dao.GamesList();
		}else {
			dtos = dao.CompanyList(id);
		}
		request.setAttribute("dtos", dtos);
		
	}

}
