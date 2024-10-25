package command.cart;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;

public class Payment implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		String money = request.getParameter("t_money");
		request.setAttribute("t_money", money);
		request.setAttribute("t_id", id);
	}

}
