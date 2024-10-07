<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 정보</title>
<script type="text/javascript">

	function goList(){
		location.href="Student";
	}
	function goUpdateForm(){//수정파트
		
		stu.t_gubun.value="updateForm";
		stu.method="post";
		stu.action="Student"//아직 안만듦
		stu.submit();
		
		
	}
	function goDelete(){//삭제파트
		
		var result=confirm("정말 삭제하시겠습니까?");
		if(result){
			stu.t_gubun.value="delete";
			stu.method="post";
			stu.action="Student"
			stu.submit();
		}
		else return;
		
	}
	
	

</script>
</head>
<body>
	<form name="stu">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_year" value="${dto.getSyear() }">
	<input type="hidden" name="t_class" value="${dto.getSclass() }">
	<input type="hidden" name="t_no" value="${dto.getNo() }">



	<table border="1" width="800">
	
	<caption>회원 상세 정보</caption>
		<colgroup>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		<col>
		</colgroup>
		<tr>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>합계</th>
			<th>평균</th>
			
			
		</tr>
		<tr>
			<td>${dto.getSyear() }</td>
			<td>${dto.getSclass() }</td>
			<td>${dto.getNo() }</td>
			<td>${dto.getName() }</td>
			<td>${dto.getKor() }</td>
			<td>${dto.getEng() }</td>
			<td>${dto.getMath() }</td>
			<td>${dto.getKor()+dto.getEng()+dto.getMath() }</td>
			<td><fmt:formatNumber value="${(dto.getKor()+dto.getEng()+dto.getMath())/3.0 }" maxFractionDigits="2"></fmt:formatNumber></td>
			
					
		</tr>
		<tr>
			<th  colspan="9">
				<input type="button" onclick="goList()" value="목록">
				<input type="button" onclick="goUpdateForm()" value="수정">
				<input type="button" onclick="goDelete()" value="삭제">
				
			</th>
		</tr>
	
	
	</table>
	</form>
	

</body>
</html>