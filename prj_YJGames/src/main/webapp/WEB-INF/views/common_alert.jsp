<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뭔가 하는중~</title>
</head>
<body>
	<form name="alertForm">
		<input type = "hidden" name = "t_gubun">
		<input type = "hidden" name = "t_no">
	</form>
	<c:if test="${empty t_gubun}">
	<script type="text/javascript">
		alert("${t_msg}");
		location.href="${t_url}";
	</script>
</c:if>
<c:if test="${t_gubun ne null}">
	<script type="text/javascript">
		alert("${t_msg}");
		alertForm.t_gubun.value="${t_gubun}";
		alertForm.method="post";
		alertForm.action="${t_url}";
		alertForm.submit();
	</script>
</c:if>
<c:if test="${t_gubun eq 'view'}">
	<script type="text/javascript">
		alert("${t_msg}");
		alertForm.t_gubun.value="${t_gubun}";
		alertForm.t_no.value="${t_no}";
		alertForm.method="post";
		alertForm.action="${t_url}";
		alertForm.submit();
	</script>
</c:if>
</body>
</html>