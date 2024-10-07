<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="dao.*, dto.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");


	/*
	//여기 일단 원본임

	ArrayList<StudentDto> dtos = (ArrayList<StudentDto>)request.getAttribute("t_dtos");
	String syear = (String)request.getAttribute("s_syear");
	String sclass = (String)request.getAttribute("s_sclass");
	
	String select = (String)request.getAttribute("s_select");
	String search = (String)request.getAttribute("search_text");
	*/
	
	/*
	StudentDao dao = new StudentDao();
	
	
	String select = request.getParameter("s_select");
	if(select == null){
		select = "";	
	}
	String search = request.getParameter("search_text");
	if(search == null){
		search = "";
	}
	String syear = request.getParameter("s_syear");
	if(syear == null){
		syear = "";
	}
	String sclass = request.getParameter("s_sclass");
	if(sclass == null){
		sclass = "";
	}
	
	dtos = dao.getStudentList(select, search, syear, sclass);
	*/
	
//	out.print("<br>select: "+select);
//	out.print("<br>saerch: "+search);
//	out.print("<br>syear: "+syear);
//	out.print("<br>sclass: "+sclass);
	


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<script type="text/javascript">

	function goView(syear, sclass, no){
		stu.t_gubun.value = "view";
		stu.t_year.value = syear;
		stu.t_class.value = sclass;
		stu.t_no.value = no;
		stu.method="post";
		stu.action="Student";
		stu.submit();
	}
	
	function goList(){
		location.href="Student";
	}
	
	function goSearch(){//새로고침 하면서 보낸 정보만을 정렬하게끔
						//그러면 기존 전체출력이 학년/반/번호가 null일때 전부 나와야 함.
		stu.t_gubun.value = "search";
		stu_search.method="post";
		stu_search.action="Student";
		//stu_search.submit();
	}
	
	
</script>
</head>
<body>




	<table width="800" border="1">
		
		
		
		<caption>학생목록</caption>
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
		<form name="stu_search">
		
		
		
		<!-- 원래 검색기능 있었음 -->
		
		</form>
		<tr>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>이름</th>
		</tr>
		
		
		
		
		<form name="stu">
			<input type="hidden" name="t_gubun">
			<input type="hidden" name="t_year">
			<input type="hidden" name="t_class">
			<input type="hidden" name="t_no">
			
		</form>
		
		
		
		<c:forEach items="${dtos }" var="dto">
			<tr>
				<td>${dto.getSyear()}</td>
				<td>${dto.getSclass()}</td>
				<td>${dto.getNo()}</td>
				<td><a href="javascript:goView('${dto.getSyear()}','${dto.getSclass()}','${dto.getNo()}')">${dto.getName()}</a></td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="4" style="text-align:center">
				<a href="Student?t_gubun=writeForm">[등록]</a>
			</td>
			
		</tr>
		



</body>
</html>