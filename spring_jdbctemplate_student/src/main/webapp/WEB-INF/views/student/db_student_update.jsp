<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%
/*
	request.setCharacterEncoding("UTF-8");
	StudentDao dao = new StudentDao();
	
	String syear = request.getParameter("u_year");
	String sclass = request.getParameter("u_class");
	String no = request.getParameter("u_no");
	String name = request.getParameter("u_name");
	String kor = request.getParameter("u_kor");
	String eng = request.getParameter("u_eng");
	String math = request.getParameter("u_math");

	StudentDto dto = new StudentDto(syear, sclass, no, name, Integer.parseInt(kor), Integer.parseInt(eng), Integer.parseInt(math));
	
	int result = dao.updateStudentInfo(dto);
	String msg ="수정에 성공했습니다.";
	if(result != 1){
		msg="수정에 실패했습니다.";
	}
	*/
	String msg = (String)request.getAttribute("t_msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="Student";
</script>
<title>업뎃중</title>
</head>
<body>
	
</body>
</html>