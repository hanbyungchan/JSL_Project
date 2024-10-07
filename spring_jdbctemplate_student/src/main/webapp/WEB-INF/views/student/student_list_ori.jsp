<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="dao.*, dto.*, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");

	ArrayList<StudentDto> dtos = (ArrayList<StudentDto>)request.getAttribute("t_dtos");
	String syear = (String)request.getAttribute("s_syear");
	String sclass = (String)request.getAttribute("s_sclass");
	
	String select = (String)request.getAttribute("s_select");
	String search = (String)request.getAttribute("search_text");
	
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
		stu_search.submit();
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
		
		<tr>
			<td colspan="4">
				<input type="radio" name="s_syear" value="" <c:if test="${syear eq '' }">checked</c:if>>학년 전체
				<input type="radio" name="s_syear" value="1" <c:if test="${syear eq '1' }">checked</c:if>>1학년
				<input type="radio" name="s_syear" value="2" <c:if test="${syear eq '2' }">checked</c:if>>2학년
				<input type="radio" name="s_syear" value="3" <c:if test="${syear eq '3' }">checked</c:if>>3학년
			</td>
		</tr>
			
		<tr>
			<td colspan="4">
				<input type="radio" name="s_sclass" value="" <c:if test="${sclass eq '' }">checked</c:if>>반 전체
				<input type="radio" name="s_sclass" value="1" <c:if test="${sclass eq '1' }">checked</c:if>>1반
				<input type="radio" name="s_sclass" value="2" <c:if test="${sclass eq '2' }">checked</c:if>>2반
				<input type="radio" name="s_sclass" value="3" <c:if test="${sclass eq '3' }">checked</c:if>>3반
				<input type="radio" name="s_sclass" value="4" <c:if test="${sclass eq '4' }">checked</c:if>>4반
				<input type="radio" name="s_sclass" value="5" <c:if test="${sclass eq '5' }">checked</c:if>>5반
				<input type="radio" name="s_sclass" value="6" <c:if test="${sclass eq '6' }">checked</c:if>>6반
				<input type="radio" name="s_sclass" value="7" <c:if test="${sclass eq '7' }">checked</c:if>>7반
				<input type="radio" name="s_sclass" value="8" <c:if test="${sclass eq '8' }">checked</c:if>>8반
				<input type="radio" name="s_sclass" value="9" <c:if test="${sclass eq '9' }">checked</c:if>>9반
			</td>
		</tr>
		
		
		<tr>
			<td colspan="4">
				<select name="s_select">
					<option value="" <%if(select.equals("")||select.equals("s_default")){ out.print("selected");} %>>검색</option>
					<option value="s_sName" <%if(select.equals("s_sName")){ out.print("selected");} %>>이름 검색</option>
					<!-- <option value="s_sYear">학년 검색</option>
					<option value="s_sClass">반 검색</option> 
					이 부분은 예시대로 윗부분에 칸 새로 파서 1, 2, 3학년. 1~9반으로 데이터 받을 것.
					-->
					
					<option value="s_sNo" <%if(select.equals("s_sNo")){ out.print("selected");} %>>번호 검색</option>					
				</select>
				<input type="text" value="<%=search%>" name="search_text">
				<input type="button" onclick="goSearch()" value="검색">
			</td>
		
		</tr>
		
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
			<%
		for(StudentDto cntDto:dtos){
			%>
		<tr>
			<td><%=cntDto.getSyear() %></td>
			<td><%=cntDto.getSclass() %></td>
			<td><%=cntDto.getNo() %></td>
			<td><a href="javascript:goView('<%=cntDto.getSyear()%>','<%=cntDto.getSclass()%>','<%=cntDto.getNo()%>')"><%=cntDto.getName() %></a></td>
		</tr>
			<%} %>
		
		<tr>
			<td colspan="4" style="text-align:center">
				<a href="Student?t_gubun=writeForm">[등록]</a>
			</td>
			
		</tr>
		



</body>
</html>