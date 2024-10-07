package command.student;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.StudentDao;

public class ConfirmDone implements CommonExecute {

	@Override
	public void execute(HttpServletRequest req) {
		
		
		
		String year = req.getParameter("t_year");
		String sclass = req.getParameter("t_sclass");
		String no = req.getParameter("t_no");
		
		req.setAttribute("t_year", year);
		req.setAttribute("t_sclass", sclass);
		req.setAttribute("t_no", no);
		
	}

}
