package command.cart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dto.CartDto;

public class CartList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		GameDao dao = new GameDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		ArrayList<CartDto> dtos = dao.CartList(id);
		request.setAttribute("t_dtos", dtos);
	}

}
