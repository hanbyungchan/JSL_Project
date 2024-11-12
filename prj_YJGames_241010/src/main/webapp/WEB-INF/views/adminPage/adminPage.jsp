<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
</script>
<script type="text/javascript">
function goConfirm() {
	game.method="post";
	game.action="Game?t_gubun=GameConfirmList";
	game.submit();
}
function goUsers() {
	game.method="post";
	game.action="Game?t_gubun=user_list";
	game.submit();
}
function goGamesList() {
	game.method="post";
	game.action="Game?t_gubun=games_list";
	game.submit();
}
function goNewsList() {
	game.method="post";
	game.action="Game?t_gubun=news_list";
	game.submit();
}
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSL Games</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <!-- CSS 연동 -->
    <link rel="stylesheet" href="css/styles.css">
     <link rel="stylesheet" href="css/adminPage.css">
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- 구글 Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <%@ include file = "../scripts.jsp"%>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	</form>
    <%@ include file = "../header.jsp"%>
<div class="admin-container">
    <div class="button-container">
		<c:if test="${sessionId ne null}">
	   		<c:if test="${sessionLevel ne '3'}">
	        	<div class="button-container">
	        	<c:if test="${sessionLevel eq '2'}">
	            	<button class="action-btn" onclick="goGameRegi()">GAME REGIST</button>
	            	<button class="action-btn" onclick="goStoreRegi()">STORE REGIST</button>
	            	</c:if>
	            	<button class="action-btn" onclick="goGamesList()">Game Management</button>
	            	<button class="action-btn" onclick="goNewsList()">News Management</button>
	            	<c:if test="${sessionLevel eq '1'}">
	            	<button class="action-btn" onclick="goUsers()">User</button>
	            	<button class="action-btn" onclick="goConfirm()">GameConfirm</button>
	            	</c:if>
	        	</div>
	  	  	</c:if>
		</c:if>
    </div>
</div>

<div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
    <script src="js/main.js"></script> 
    <script src="js/adminPage.js"></script>

</body>
</html>
<%@ include file = "../footer.jsp"%>
    