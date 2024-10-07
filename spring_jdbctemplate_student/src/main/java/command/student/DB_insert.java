package command.student;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;

public class DB_insert implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		StudentDao dao = new StudentDao();
		
		
		String year = req.getParameter("t_year");
		String sclass = req.getParameter("t_class");
		String no = req.getParameter("t_no");
		String name = req.getParameter("t_name");
		
		String kor = req.getParameter("t_kor");
		String eng = req.getParameter("t_eng");
		String math = req.getParameter("t_math");
		
		int result = dao.insertStudent(year, sclass, no, name, Integer.parseInt(kor), Integer.parseInt(eng), Integer.parseInt(math));
		
		
		String msg="성공적으로 등록 되었습니다.";
		if(result==0) {
			msg="등록에 실패했습니다.";
		}
		
		
		req.setAttribute("t_msg", msg);
		req.setAttribute("t_url", "Student");
		
		
	}

}
