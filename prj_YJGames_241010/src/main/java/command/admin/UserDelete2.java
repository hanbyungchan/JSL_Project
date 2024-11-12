package command.admin;


import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.UserDao;

public class UserDelete2 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		String u_exit_date =CommonUtil.getToday();
		int result = dao.UserDelete(u_id, u_exit_date);
		if(result == 1) {
			request.setAttribute("t_msg", "Delete successful");
		} 
		else {request.setAttribute("t_msg", "Delete failed... Please try again");}
		request.setAttribute("t_url", "Game");
		request.setAttribute("t_gubun", "user_list");
	}

}
