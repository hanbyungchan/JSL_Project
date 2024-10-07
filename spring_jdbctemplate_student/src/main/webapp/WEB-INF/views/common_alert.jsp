<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="stu">
		<input type="hidden" name="t_year" value="${t_year }">
		<input type="hidden" name="t_sclass" value="${t_sclass }">
		<input type="hidden" name="t_no" value="${t_no }">
		<input type="hidden" name=t_url value="${t_url }">
		<input type="hidden" name=t_gubun>
	</form>
	<script>
	if("${t_url}" == "Student"){
		alert("${t_msg}");
		location.href="${t_url}";
	}
	else{
		stu.t_gubun.value="writeForm2";
		alert("${t_msg}");
		stu.method="post"; 
		stu.action="Student";
		stu.submit();
	}
	</script>

	
</body>
</html>