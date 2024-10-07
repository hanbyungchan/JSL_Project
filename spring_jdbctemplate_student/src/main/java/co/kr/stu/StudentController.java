package co.kr.stu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import command.student.ConfirmDone;
import command.student.DB_confirm;
import command.student.DB_delete;
import command.student.DB_insert;
import command.student.DB_update;
import command.student.StudentList;
import command.student.StudentView;
import common.CommonExecute;
import common.CommonTemplate;

@Controller
public class StudentController {
	
	@Autowired
	JdbcTemplate template;
	
	@Autowired
	public void aaa() {
		CommonTemplate.setTmplate(template);
		
	}
	
	@RequestMapping("Student")
	public String student(HttpServletRequest req){
		String viewPage = "";
		String gubun = req.getParameter("t_gubun");
		
		if(gubun == null) {
			gubun ="list";
		}
		
		if(gubun.equals("list")) {
			CommonExecute student = new StudentList();
			student.execute(req);
			viewPage="student/student_list";
		}
		else if(gubun.equals("view")) {
			CommonExecute student = new StudentView();
			student.execute(req);
			viewPage="student/student_view";
		}
		else if(gubun.equals("updateForm")) {
			CommonExecute student = new StudentView();
			student.execute(req);
			viewPage="student/student_update";
		}
		else if(gubun.equals("dbUpdate")) {
			CommonExecute student = new DB_update();
			student.execute(req);
			viewPage="common_alert";
		}
		else if(gubun.equals("delete")) {
			CommonExecute student = new DB_delete();
			student.execute(req);
			viewPage="common_alert";
		}
		
		
		else if(gubun.equals("writeForm")) {
			viewPage="student/student_write";
		}
		else if(gubun.equals("dbConfirm")) {
			CommonExecute student = new DB_confirm();
			student.execute(req);
			viewPage="common_alert";
		}
		else if(gubun.equals("writeForm2")) {
			CommonExecute student = new ConfirmDone();
			student.execute(req);
			viewPage="student/student_write2";
		}
		else if(gubun.equals("dbInsert")) {
			CommonExecute student = new DB_insert();
			student.execute(req);
			viewPage="common_alert";
		}
		
		
		return viewPage;
	}
	
}
