package command.admin;


import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.UserDao;

public class UserActivate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		int result = dao.UserActivate(u_id);
		if(result == 1) {
			request.setAttribute("t_msg", "Activate successful");
		} 
		else {request.setAttribute("t_msg", "Activate failed... Please try again");}
		request.setAttribute("t_url", "Game");
		request.setAttribute("t_gubun", "user_list");
	}

}
