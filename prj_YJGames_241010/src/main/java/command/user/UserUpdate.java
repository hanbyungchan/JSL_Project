package command.user;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.UserDao;
import dto.UserDto;

public class UserUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		String u_name = request.getParameter("t_u_name");
		String u_password = request.getParameter("t_u_password");
		try {
			u_password = dao.encryptSHA256(u_password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String cur_pw = request.getParameter("t_u_password_check");
		try {
			cur_pw = dao.encryptSHA256(cur_pw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String u_birth = request.getParameter("t_u_birth");
		String u_gender = request.getParameter("t_u_gender");
		String u_email_1 = request.getParameter("t_u_email_1");
		String u_email_2 = request.getParameter("t_u_email_2");
		String u_level = request.getParameter("t_u_level");
		UserDto dto = new UserDto(u_id, u_name, u_password, u_birth, u_gender, u_email_1, u_email_2, u_level);
		int result = dao.UserUpdate(dto, cur_pw);
		if(result == 1) request.setAttribute("t_msg", "Update successful");
		else {request.setAttribute("t_msg", "Update failed... Please try again");}
		request.setAttribute("t_id", u_id);
		request.setAttribute("t_url", "Game");
		request.setAttribute("t_gubun", "userinfo");
	}

}
