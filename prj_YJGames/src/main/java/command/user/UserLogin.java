package command.user;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.UserDao;
import dto.UserDto;

public class UserLogin implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		String u_password = request.getParameter("t_u_password");
		
		
		try {
			u_password = dao.encryptSHA256(u_password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		UserDto dto = dao.UserLogin(u_id, u_password);
		
		String msg = "Id or Password is Wrong";
		String url = "Game";
		
		msg = "Welcome" + dto.getU_name();
		url = "Game";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}

}
