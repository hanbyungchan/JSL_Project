package command.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.UserDao;
import dto.SupportDto;

public class SupportSubmit implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		UserDao dao = new UserDao();
		String s_code = dao.AutoCode_sup();
		String s_txt = request.getParameter("t_txt");
		s_txt = s_txt.replace("'",".");
		s_txt = s_txt.replace("\"", "..");
		String s_type = request.getParameter("t_type");
		String s_title = request.getParameter("t_title");
		s_title = s_title.replace("'",".");
		s_title = s_title.replace("\"", "..");
		String s_date = CommonUtil.getToday();
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("sessionId");
		SupportDto dto = new SupportDto(s_code, s_txt, s_type, s_title, s_date, u_id);
		int result = dao.SupportSubmit(dto);
		if(result == 1) request.setAttribute("t_msg", "It has been received normally. Please check your email for the result of your inquiry.");
		else {request.setAttribute("t_msg", "failed... Please try again"); 
		}
		request.setAttribute("t_url", "Game");

	}

}
