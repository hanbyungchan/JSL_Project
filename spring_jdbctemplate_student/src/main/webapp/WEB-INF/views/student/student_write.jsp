<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, java.util.*,dto.*" %>

<%
	StudentDao dao = new StudentDao();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>

<script type="text/javascript">
	function goConfirm(){
		if(stu.t_year.value==""){
			alert("학년이 입력되지 않았습니다.")
			stu.t_year.focus();
			return;
		}
		if(stu.t_class.value==""){
			alert("반이 입력되지 않았습니다.")
			stu.t_class.focus();
			return;
		}
		if(stu.t_no.value==""){
			alert("번호가 입력되지 않았습니다.")
			stu.t_no.focus();
			return;
		}
		
		if(isNaN(stu.t_year.value)){
			alert("학년은 숫자만 입력해야 합니다.")
			stu.t_year.focus();
			return;
		}
		else if(stu.t_year.value<0 || stu.t_year.value>4){
			alert("1~3 사이의 정수를 입력하시오.")
			stu.t_year.focus();
			return;
		}
		
		if(isNaN(stu.t_class.value)){
			alert("반은 숫자만 입력해야 합니다.")
			stu.t_class.focus();
			return;
		}
		else if(stu.t_class.value<0 || stu.t_class.value>10){
			alert("1~9 사이의 정수를 입력하시오.")
			stu.t_class.focus();
			return;
		}
		if(isNaN(stu.t_no.value)){
			alert("번호는 숫자만 입력해야 합니다.")
			stu.t_no.focus();
			return;
		}
		else if(stu.t_no.value<0){
			alert("1이상의 정수를 입력하시오.")
			stu.t_no.focus();
			return;
		}
		
		//해당 정보를 가지고 중복체크 dao로 이동. 체크 이후 result값을 리턴받음. 중복이면 1, 아니면 0
		stu.t_gubun.value="dbConfirm";
		stu.method="post"; //현재 페이지의 값을 특정 위치로 보내는 방법. 1.post, 2.get
		stu.action="Student";
		stu.submit();
		//여기서 하다 말음. db가서 컨펌해야돼. 이걸 왜 안 만들어놨었대.
		
		
	}

	function goSave(){
		
		if(stu.t_year.value == ""){
			alert("학년이 입력되지 않았습니다. 다시 입력하십시오.")
			stu.t_year.focus();
			return;
		}
		if(stu.t_class.value == ""){
			alert("반이 입력되지 않았습니다. 다시 입력하십시오.")
			stu.t_class.focus();
			return;
		}
		if(stu.t_no.value == ""){
			alert("번호가 입력되지 않았습니다. 다시 입력하십시오.")
			stu.t_value.focus();
			return;
		}
		if(stu.t_name.value == ""){
			alert("이름이 입력되지 않았습니다. 다시 입력하십시오.")
			stu.t_name.focus();
			return;
		}
		
		if(isNaN(stu.t_kor.value)){
			alert("국어 점수는 숫자를 입력해야 합니다.")
			stu.t_kor.focus();
			return;
		}
		else if(stu.t_kor.value<=0 || stu.t_kor.value>=100){
			alert("0~100 사이의 정수를 입력하시오.")
			stu.t_kor.focus();
			return;
		}
		
		if(isNaN(stu.t_eng.value)){
			alert("영어 점수는 숫자를 입력해야 합니다.")
			stu.t_eng.focus();
			return;
		}
		else if(stu.t_eng.value<=0 || stu.t_eng.value>=100){
			alert("0~100 사이의 정수를 입력하시오.")
			stu.t_eng.focus();
			return;
		}
		
		if(isNaN(stu.t_math.value)){
			alert("수학 점수는 숫자를 입력해야 합니다.")
			stu.t_math.focus();
			return;
		}
		else if(stu.t_math.value<=0 || stu.t_math.value>=100){
			alert("0~100 사이의 정수를 입력하시오.")
			stu.t_math.focus();
			return;
		}
		
		
		
		
		stu.t_gubun.value="dbInsert";
		stu.method="post"; //현재 페이지의 값을 특정 위치로 보내는 방법. 1.post, 2.get
		stu.action="Student";
		stu.submit();
		
	}
	function goList(){
		location.href="Student";
	}
</script>
</head>
<body>
<form name="stu">
<input type="hidden" name="t_gubun">
<input type="hidden" name="t_confirm" value="">

<table border="1" width="500">
		<caption><h3>회원등록</h3></caption>
		<colgroup>
			<col width="30">
			<col width="70">
		
		</colgroup>
		<tr>
			<th>학년</th>
			<td><input type="text" name="t_year" size="10"></td>
		</tr>
		<tr>
			<th>반</th>
			<td><input type="text" name="t_class" size="10"></td>
		</tr>
		<tr>
			<th>번호</th>
			<td><input type="text" name="t_no" size="10"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" onclick="goConfirm()" value="중복확인">
			</th>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="t_name" size="10"></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><input type="text" name="t_kor" size="10"></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><input type="text" name="t_eng" size="10"></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><input type="text" name="t_math" size="10"></td>
		</tr>
			
		
		
		<tr>
			<th colspan="2">
			<input type="button" onclick="goList()" value="목 록">
			<input type="button" onclick="goSave()" disabled value="저 장">
			</th>
		</tr>
		
		
		
	</table>
</form>
	
</body>
</html>