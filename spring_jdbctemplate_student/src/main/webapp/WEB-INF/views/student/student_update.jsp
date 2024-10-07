<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*,dto.*" %>
<%
/*
	StudentDao dao = new StudentDao();
	String syear = request.getParameter("v_year");
	String sclass = request.getParameter("v_class");
	String no = request.getParameter("v_no");
	
	
	StudentDto dto = dao.getStudentDetailInfo(syear, sclass, no);
	*/
	//StudentDto dto = (StudentDto)request.getAttribute("t_dto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정</title>

<script type="text/javascript">

	function goList(){
		location.href="Student";
	}
	function goUpdate(){
		
		if(stu.u_name.value == ""){
			alert("성명을 입력하십시오.");
			stu.t_name.focus();
			return;
		}
		if(stu.u_kor.value == ""){
			alert("국어점수를 입력하십시오.");
			stu.u_kor.focus();
			return;
		}
		if(stu.u_eng.value == ""){
			alert("영어점수를 입력하십시오.");
			stu.u_eng.focus();
			return;
		}
		if(stu.u_math.value == ""){
			alert("수학점수를 입력하십시오.");
			stu.u_math.focus();
			return;
		}
		stu.t_gubun.value="dbUpdate";
		stu.method="post";
		stu.action="Student"//이걸로 파일 만들기
		stu.submit();
		
		
		
		
	}
	
</script>

</head>
<body>
<form name="stu">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="u_year" value="${dto.getSyear()}">
	<input type="hidden" name="u_class" value="${dto.getSclass()}">
	<input type="hidden" name="u_no" value="${dto.getNo()}">
	
	<table border="1" width="500">
		<caption>${dto.getName()}님 회원정보</caption>
		<colgroup>
		<col width="30%">
		<col width="70%">
		
		
		
		</colgroup>
		<tr>
			<th>이름</th>
			<td><input type="text" name="u_name" value="${dto.getName()}"></td>
			
			
		</tr>
		
		<tr>
			<th>국어</th>
			<td><input type="text" name="u_kor" value="${dto.getKor()}"></td>
		</tr>
		
		<tr>
			<th>영어</th>
			<td><input type="text" name="u_eng" value="${dto.getEng()}"></td>
		</tr>
		
		<tr>
			<th>수학</th>
			<td><input type="text" name="u_math" value="${dto.getMath()}"></td>
		</tr>
		
		
		
		<tr>
			<th colspan="2">
			<!--
			<a href="member_list.jsp">목록1</a>
			<a href="javascript:goList()">목록2</a>
			<input type="button" onclick="goList()" value="목록3">
			 -->
			<input type="button" onclick="location.href='Student'" value="목록">
			<input type="button" onclick="goUpdate()" value="수정저장">
			</th>
		</tr>
		
		
	</table>
</form>

</body>
</html>