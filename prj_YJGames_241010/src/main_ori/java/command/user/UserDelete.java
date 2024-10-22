package command.user;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.UserDao;

public class UserDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		String u_password = request.getParameter("t_u_password_check");
		try {
			u_password = dao.encryptSHA256(u_password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String u_exit_date =CommonUtil.getToday();
		int result = dao.UserDelete(u_id, u_password, u_exit_date);
		if(result == 1) {
			request.setAttribute("t_msg", "Registration successful");
			HttpSession session = request.getSession();
			session.invalidate();
		} 
		else {request.setAttribute("t_msg", "Registration failed... Please try again");}
		request.setAttribute("t_url", "Game");
	}

}
