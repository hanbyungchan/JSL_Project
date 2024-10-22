package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.UserDao;
import dto.UserDto;

public class UserInfo implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
		UserDto dto = dao.UserInfo(id);
		request.setAttribute("t_dto", dto);
	}

}
