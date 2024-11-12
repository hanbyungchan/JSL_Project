package command.admin;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.UserDao;
import dto.UserDto;

public class UserInfo2 implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String id = request.getParameter("u_id");
		UserDto dto = dao.UserInfo(id);
		request.setAttribute("t_dto", dto);
	}

}
