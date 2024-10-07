package command.student;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;

public class DB_confirm implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		
		StudentDao dao = new StudentDao();
		String year = req.getParameter("t_year");
		String sclass = req.getParameter("t_class");
		String no = req.getParameter("t_no");
		
		int result= dao.confirm(year, sclass, no);
		String url="";
		
		String msg ="사용 가능한 학번입니다.";
		//url = "Student?t_confirm="+Integer.toString(result);
		
		if(result==1) {
			msg="중복되는 학번입니다.";
			url = "Student";
		}
		
		
		//result가 1이면 중복, 0이면 중복x
		
		req.setAttribute("t_year", year);
		req.setAttribute("t_sclass", sclass);
		req.setAttribute("t_no", no);
		
		req.setAttribute("t_msg", msg);
		req.setAttribute("t_url", url);
		
	}

}
