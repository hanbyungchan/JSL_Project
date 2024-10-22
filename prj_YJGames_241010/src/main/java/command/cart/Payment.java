package command.cart;


import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;

public class Payment implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		String money = request.getParameter("t_money");
		request.setAttribute("t_money", money);
	}

}
