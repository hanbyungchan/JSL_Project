package command.student;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;
import dto.StudentDto;

public class DB_update implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		
		StudentDao dao = new StudentDao();
		
		
		String year = req.getParameter("u_year");
		String sclass = req.getParameter("u_class");
		String no = req.getParameter("u_no");
		String name = req.getParameter("u_name");
		
		String kor = req.getParameter("u_kor");
		String eng = req.getParameter("u_eng");
		String math = req.getParameter("u_math");
		
		
		StudentDto dto = new StudentDto(year, sclass, no, name, Integer.parseInt(kor), Integer.parseInt(eng), Integer.parseInt(math));
		
		int result = dao.updateStudentInfo(dto);
		
		String msg="성공적으로 업데이트 되었습니다.";
		if(result==0) {
			msg="업데이트에 실패했습니다.";
		}
		
		
		req.setAttribute("t_msg", msg);
		req.setAttribute("t_url", "Student");
	}

}
