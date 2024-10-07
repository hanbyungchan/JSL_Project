<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<% 

	StudentDao dao = new StudentDao();
	
	String syear = request.getParameter("v_year");
	String sclass = request.getParameter("v_class");
	String no = request.getParameter("v_no");

	
	int result = dao.deletStudentInfo(syear, sclass, no);
	String msg ="삭제에 성공했습니다.";
	if(result != 1){
		msg="삭제에 실패했습니다.";
	}


	/*
	String msg="삭제 성공";
	if(result!=1) msg="삭제 실패";
	
	*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	location.href="Student";
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>