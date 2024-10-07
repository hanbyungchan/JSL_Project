<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 정보</title>
<script type="text/javascript">

	/* function goList(){
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
		
	} */
	
	

</script>
</head>
<body>
	<form name="stu">
	<input type="hidden" name="t_gubun">
	

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
			<th>학년</th>
			<th>학년</th>
			<th>학년</th>
			<th>학년</th>
			<th>학년</th>
			<th>학년</th>
			<th>학년</th>
			<th>학년</th>
			
					
		</tr>
		<tr>
			<td>${dto.getS_page_no() }</td>
			<td>${dto.getS_game_code() }</td>
			<td>${dto.getS_game_name() }</td>
			<td>${dto.getS_info_txt() }</td>
			<td>${dto.getS_date() }</td>
			<td>${dto.getS_sale() }</td>
			<td>${dto.getS_spec_1() }</td>
			<td>${dto.getS_icon() }</td>
			<td>${dto.getS_icon() }</td>
			
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