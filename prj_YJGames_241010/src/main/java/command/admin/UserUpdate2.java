package command.admin;


import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.UserDao;
import dto.UserDto;

public class UserUpdate2 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String u_id = request.getParameter("t_u_id");
		String u_name = request.getParameter("t_u_name");
		String u_birth = request.getParameter("t_u_birth");
		if(u_birth == null) u_birth ="";
		String u_gender = request.getParameter("t_u_gender");
		if(u_gender == null) u_gender ="";
		String u_email_1 = request.getParameter("t_u_email_1");
		String u_email_2 = request.getParameter("t_u_email_2");
		String u_money = request.getParameter("t_u_money");
		if(u_money == null) u_money ="";
		UserDto dto = new UserDto(u_id, u_name, u_birth, u_gender, u_email_1, u_email_2, u_money);
		int result = dao.UserUpdate2(dto);
		if(result == 1) request.setAttribute("t_msg", "Update successful");
		else {request.setAttribute("t_msg", "Update failed... Please try again");}
		request.setAttribute("t_id", u_id);
		request.setAttribute("t_url", "Game");
		request.setAttribute("t_gubun", "user_list");
	}

}
