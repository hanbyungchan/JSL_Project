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
            <button class="gameAnswer" data-answer="라이브러리에 추가되지 않은 게임을 확인하고 싶다면, 지원팀에 문의하세요.">게임이 라이브러리에 추가되지 않았습니다</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="gameAnswer" data-answer="구매하지 않은 게임이 라이브러리에 있는 경우, 계정 설정을 확인해보세요.">제가 구매하지 않은 게임이 라이브러리에 있습니다.</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
        </div>
        <button id="purgameButton">Purchases</button>
        <div id="purButtons" class="hidden">
            <button class="purchaseAnswer" data-answer="구매가 진행되지 않으면, 결제 정보를 확인해 주세요.">구매가 진행되지 않습니다</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="purchaseAnswer" data-answer="지갑 충전 문제는 고객 지원에 문의하시기 바랍니다.">지갑이 충전되지 않습니다</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="purchaseAnswer" data-answer="구매 시 문제가 발생하면, 오류 메시지를 확인해 주세요.">지갑에 돈이 충분한데 구매가 되지 않습니다.</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
        </div>
        <button id="userButton">My Account</button>
        <div id="userButtons" class="hidden">
            <button class="userAnswer" data-answer="계정 확인 후 다시 시도해 주세요.">구매가 진행되지 않습니다</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="userAnswer" data-answer="지갑 충전 확인 후 지원팀에 문의하세요.">지갑이 충전되지 않습니다</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="userAnswer" data-answer="구매 문제가 계속 발생하면 고객 지원에 문의하세요.">지갑에 돈이 충분한데 구매가 되지 않습니다.</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
        </div>
        <button id="questionButton">If you have any questions you would like to ask yourself, please click here</button>
        <div id="questionForm" class="hidden">
    <h3>Ask Your Question</h3>
    <input type="text" id="questionTitle" placeholder="Title" />
    <select id="questionType">
        <option value="">Select Type</option>
        <option value="general">General Inquiry</option>
        <option value="technical">Technical Support</option>
        <option value="billing">Billing Issue</option>
    </select>
    <textarea id="userQuestion" placeholder="Type your question here..." rows="4"></textarea>
    <button id="submitQuestion">Submit</button>
</div>
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
    document.getElementById('questionButton').addEventListener('click', function() {
        const questionForm = document.getElementById('questionForm');
        questionForm.classList.toggle('hidden'); // 질문 폼 보이기/숨기기
    });
	// 답변 버튼 클릭 이벤트 리스너 추가
	const answerButtons = document.querySelectorAll('.gameAnswer, .purchaseAnswer, .userAnswer');
	answerButtons.forEach((button, index) => {
	    button.addEventListener('click', function() {
	        const answerText = button.nextElementSibling; // 다음 textarea 선택

	        // 현재 textarea가 보이는지 확인
	        if (answerText.classList.contains('hidden')) {
	            // 숨겨져 있다면 보여주고 값을 설정
	            answerText.value = this.getAttribute('data-answer'); // 버튼의 data-answer 속성에서 답변 가져오기
	            answerText.classList.remove('hidden'); // textarea 표시
	        } else {
	            answerText.classList.add('hidden'); // textarea 숨김
	            answerText.value = ''; // 내용 지우기
	        }
	    });
	});
</script>
</body>
</html>
<%@ include file = "../footer.jsp"%>