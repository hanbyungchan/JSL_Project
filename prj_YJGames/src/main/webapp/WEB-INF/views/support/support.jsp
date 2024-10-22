<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSL Games</title>
    <link rel="stylesheet" href="css/support.css">
     <link rel="stylesheet" href="css/styles.css" />
     <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <%@ include file = "../scripts.jsp"%>
</head>
<body>
 <form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
	<%@ include file = "../header.jsp"%>
    <div class="main-content">
        <h1>Support</h1>
        <h2>What do you need help with?</h2>
        <div class="menu22">
            <button id="gameButton">Games, Software, etc.</button>
            <div id="gamesButtons" class="hidden">
    			<button>게임이 라이브러리에 추가되지 않았습니다</button>
    			<button>제가 구매하지 않은 게임이 라이브러리에 있습니다.</button>
			</div>
            <button id="purgameButton">Purchases</button>
            <div id="purButtons" class="hidden">
    			<button>구매가 진행되지 않습니다</button>
    			<button>지갑이 충전되지 않습니다</button>
    			<button>지갑에 돈이 충분한데 구매가 되지 않습니다.</button>
			</div>
            <button id="userButton">My Account</button>
            <div id="userButtons" class="hidden">
    			<button>구매가 진행되지 않습니다</button>
    			<button>지갑이 충전되지 않습니다</button>
    			<button>지갑에 돈이 충분한데 구매가 되지 않습니다.</button>
			</div>
			<button>If you have any questions you would like to ask yourself, please click here</button>
        </div>
    </div>
    <script src="js/main.js"></script>
    <script>
    document.getElementById('gameButton').addEventListener('click', function() {
        const additionalButtons = document.getElementById('gamesButtons');
        additionalButtons.classList.toggle('hidden');
    });

    document.getElementById('purgameButton').addEventListener('click', function() {
        const additionalButtons = document.getElementById('purButtons');
        additionalButtons.classList.toggle('hidden');
    });

    document.getElementById('userButton').addEventListener('click', function() {
        const additionalButtons = document.getElementById('userButtons');
        additionalButtons.classList.toggle('hidden');
    });
</script>
</body>
</html>
<%@ include file = "../footer.jsp"%>