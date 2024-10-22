package command.user;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		String t_gubun = null;
		String msg = "Id or Password is Wrong";
		String url = "Game";
		UserDto dto = dao.UserLogin(u_id, u_password);
		if(dto == null) {
			msg = "Login failed..";
			t_gubun = "goSignin";
		}else{
		msg = "Welcome " + dto.getU_name();
		HttpSession session = request.getSession();
		session.setAttribute("sessionId", dto.getU_id());
		session.setAttribute("sessionName", dto.getU_name());
		session.setAttribute("sessionLevel", dto.getU_level());
		session.setAttribute("sessionMoney", dto.getU_money());
		session.setMaxInactiveInterval(60*60);
		}
		request.setAttribute("t_gubun", t_gubun);
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}

}
