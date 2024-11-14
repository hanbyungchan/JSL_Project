package command.cart;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.GameDao;
import dao.UserDao;
import dto.UserDto;

public class Payment_now implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String code = request.getParameter("t_pageNo");
		String money = request.getParameter("t_money");
		UserDao dao = new UserDao();
		UserDto dto = dao.UserInfo(id);
		request.setAttribute("t_dto", dto);
		request.setAttribute("t_money", money);
		request.setAttribute("t_id", id);
		request.setAttribute("code", code);
	}
}
