package command.admin;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import dao.UserDao;
import dto.UserDto;

public class UserList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		ArrayList<UserDto> dtos = dao.UserList();
		request.setAttribute("dtos", dtos);
		
	}

}
