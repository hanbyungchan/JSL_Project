<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*, dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	StudentDao dao = new StudentDao();
	

	
	String syear = request.getParameter("t_year");
	
	String sclass = request.getParameter("t_class");
	
	String no = request.getParameter("t_no");

	String name = request.getParameter("t_name");
	
	String kor = request.getParameter("t_kor");
	
	
	

	String eng = request.getParameter("t_eng");

	String math = request.getParameter("t_math");
	
	
	
	int result = dao.insertStudent(syear, sclass, no, name, Integer.parseInt(kor), Integer.parseInt(eng), Integer.parseInt(math));
	
	String msg = "등록에 성공했습니다.";
	
	if(result==0){
		msg="중복되는 학년/반/번호입니다. 등록에 실패했습니다.";
	}
	
	
	
	
	/*
	out.print("YEAR: "+syear);
	out.print("<br>SCLASS: "+sclass);
	out.print("<br>NO: "+no);
	out.print("<br>NAME: "+name);
	out.print("<br>KOR: "+kor);
	out.print("<br>ENG: "+eng);
	out.print("<br>MATH: "+math);
	*/
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	alert("<%=msg%>");
 	location.href="student_list.jsp";
	
	
</script>

</head>
<body>

</body>
</html>