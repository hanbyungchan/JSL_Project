package command.student;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;
import dto.StudentDto;

public class StudentList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		
		StudentDto dto = new StudentDto();
		StudentDao dao = new StudentDao();
		
		String s_select = req.getParameter("t_select");
		String s_search = req.getParameter("t_search");
		if(s_select == null) {
			s_select = "id";
			s_search = "";
		}
		ArrayList<StudentDto> dtos = dao.getStudentList();
		
		
		req.setAttribute("dtos", dtos);
		req.setAttribute("select", s_select);
		req.setAttribute("search", s_search);
		
		
	}

}
