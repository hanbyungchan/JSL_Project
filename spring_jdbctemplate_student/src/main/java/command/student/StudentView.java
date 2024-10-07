package command.student;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;
import dto.StudentDto;

public class StudentView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		
		StudentDao dao = new StudentDao();
		
		String syear = req.getParameter("t_year");
		String sclass = req.getParameter("t_class");
		String no = req.getParameter("t_no");
		
		StudentDto dto = dao.getStudentDetailInfo(syear, sclass, no);
		req.setAttribute("dto", dto);
		
		
		
	}

}
