package command.user;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.UserDao;

public class UserDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		String u_password = request.getParameter("t_u_password_check");
		String u_exit_date =CommonUtil.getToday();
		int result = dao.UserDelete(u_id, u_password, u_exit_date);
		if(result == 1) request.setAttribute("t_msg", "Registration successful");
		else {request.setAttribute("t_msg", "Registration failed... Please try again");}
		
		request.setAttribute("t_url", "Game");
	}

}
