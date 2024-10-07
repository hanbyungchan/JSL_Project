package command.student;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;

public class DB_delete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		
		
		StudentDao dao = new StudentDao();
		String year = req.getParameter("t_year");
		String sclass = req.getParameter("t_class");
		String no = req.getParameter("t_no");
		
		int result = dao.deletStudentInfo(year, sclass, no);
		
		String msg="성공적으로 삭제 되었습니다.";
		if(result==0) {
			msg="삭제에 실패했습니다.";
		}
		
		
		req.setAttribute("t_msg", msg);
		req.setAttribute("t_url", "Student");
		
		
	}

}
