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
      <script type="text/javascript">
      function goSubmit(a) {
    	sup.t_id.value = a;
    	if(sup.t_id.value ==""){goAlert();return;}
		if(sup.t_title.value == ""){alert("Please enter the title!"); sup.t_title.focus();return;}
		if(sup.t_type.value == ""){alert("Please select a question type!");sup.t_type.focus(); return;}
		if(sup.t_txt.value == ""){alert("Please enter the contents!");sup.t_txt.focus(); return;}
		sup.method="post";
		sup.action="Game?t_gubun=sup_submit";
		sup.submit();
	}
      function goAlert() {
			alert("please Login!");
			game.method="post";
  		game.action="Game?t_gubun=goSignin";
  		game.submit();	
		}
      </script>
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
    <c:if test="${sessionId eq null}"><h2>If you want help, please log in and do so.</h2></c:if>
    
    <div class="menu22">
        <button id="gameButton">Games, Software, etc.</button>
        <div id="gamesButtons" class="hidden">
            <button class="gameAnswer" data-answer="If you would like to check out any games that have not been added to your library, please contact our support team.">The game has not been added to the library!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="gameAnswer" data-answer="If you have a game in your library that you haven't purchased, check your account settings.">There is a game in the library that I did not purchase!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
        </div>
        <button id="purgameButton">Purchases</button>
        <div id="purButtons" class="hidden">
            <button class="purchaseAnswer" data-answer="If the purchase does not proceed, please check the payment information.">Purchase is not proceeding!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="purchaseAnswer" data-answer="For wallet charging issues, please contact customer support.">My wallet won't charge!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="purchaseAnswer" data-answer="If there is a problem with the purchase, please check the error message and contact us.">I have enough money in my wallet, but I can't buy it!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
        </div>
        <button id="userButton">My Account</button>
        <div id="userButtons" class="hidden">
            <button class="userAnswer" data-answer="Please check the error message and contact us.">Your account information will not be updated!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="userAnswer" data-answer="Please contact us with your account information.">I think your account was hacked!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
            <button class="userAnswer" data-answer="Please enter your password confirmation and press the Leave Account button.">Please tell me the process of withdrawing from the account!</button>
            <textarea class="answerText hidden" rows="2" cols="50" readonly="readonly"></textarea>
        </div>
        <button id="questionButton">If you have any questions you would like to ask yourself, please click here</button>
        <div id="questionForm" class="hidden">
    <h3>Ask Your Question</h3>
    <form name="sup">
    <input type="hidden" name="t_gubun">
    <input type="hidden" name="t_id">
    <input type="text" id="questionTitle" placeholder="Title"  name="t_title"/>
    <select id="questionType" name="t_type">
        <option value="">Select Type</option>
        <option value="game">Games, Software areas</option>
        <option value="purchase">Purchases areas</option>
        <option value="user">Account areas</option>
    </select>
    <textarea id="userQuestion" placeholder="Type your question here..." rows="4" name="t_txt"></textarea>
    </form>
    <button id="submitQuestion" onclick="goSubmit('${sessionId}')">Submit</button>
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