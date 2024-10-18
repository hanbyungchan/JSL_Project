<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>결제 페이지</title>
        <link rel="icon" type="image/png" href="img/logo.png" />

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/payment.css" />
        <script src="js/main.js"></script>
        <!-- Font Awesome 아이콘 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<script type="text/javascript">
    	function goSignIn() {
    		game.t_gubun.value ="goSignin";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goInfo() {
    		game.t_gubun.value ="userinfo";
    		game.t_id.value="${sessionId}";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goLogout() {
    		game.t_gubun.value ="userlogout";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goLibrary() {
    		game.t_gubun.value ="library";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goReview() {
    		game.method="post";
    		game.action="Game?t_gubun=myreview";
    		game.submit();
		}
    	function goCart() {
    		game.method="post";
    		game.action="Game?t_gubun=cart";
    		game.submit();
		}
    	function goLibrary() {
    		game.method="post";
    		game.action="Game?t_gubun=library";
    		game.submit();
		}
    	function goRecharge(a) {
    		game.t_recharge.value = a;
    		$.ajax({
  				 type:"post",
  			  	 url:"Payment",
  			  	 data: {
  			  			t_id: ${sessionId},
  			  			t_u_money: game.t_recharge.value
  			        },
  			  	 dataType:"text",
  			  	 error:function(){
  			  		alert("a");
  			  	 },
  				 success:function(data){ 
  				 	var result = $.trim(data); 
  				 	game.result.value = result;
  					 if(result =="1"){alert("Charged.");}
  					 else{alert("Charge failed.");}
  				 } 
  			  });
		}
    	function Game_money_purchase(a) {
    		game.t_recharge.value = a;
    		$.ajax({
  				 type:"post",
  			  	 url:"Game_money_purchase",
  			  	 data: {
  			  			t_id: ${sessionId},
  			  			t_u_money: game.t_recharge.value
  			        },
  			  	 dataType:"text",
  			  	 error:function(){
  			  		alert("a");
  			  	 },
  				 success:function(data){ 
  				 	var result = $.trim(data); 
  				 	game.result.value = result;
  					 if(result =="1"){alert("Payment has been made");}
  					 else{alert("Payment failed.");}
  				 } 
  			  });
		}
    	function game_pay() {
    		$.ajax({
  				 type:"post",
  			  	 url:"Card_recharge",
  			  	data: {t_id: ${sessionId}},
  			  	 dataType:"text",
  			  	 error:function(){
  			  		alert("a");
  			  	 },
  				 success:function(data){ 
  				 	var result = $.trim(data); 
  				 	game.result.value = result;
  					 if(result =="0"){alert("Payment failed.");}
  					 else{alert("Payment has been made");}
  				 } 
  			  });
		}
    </script>
    </head>
    <body>
    <form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_id">
	<input type="hidden" name="t_recharge">
	<input type="hidden" name="result">
	</form>
	<header class="header" id="header">
    <div class="header-content">
        <div class="logo">
            <img src="img/logo.png" alt="사이트 로고">
        </div>
        
<nav class="menu" id="menu">
    <ul>
        <li><a href="Game">STORE</a></li>
		<li class="community-menu">
            <a href="#">COMMUNITY</a>
            <ul class="category-dropdown">
                <li><a href="javascript:goReview()">Review</a></li>
                <li><a href="#">News</a></li>
            </ul>
        </li>
        <li><a href="Game?t_gubun=support">SUPPORT</a></li>
        <c:if test="${sessionId eq null}">
            <li><a href="javascript:goSignIn()">SIGN IN</a></li>
        </c:if>
        <c:if test="${sessionId ne null}">
            <li><a href="javascript:goInfo()">MyInfo</a></li>
        </c:if>
        <c:if test="${sessionId ne null}">
            <li><a href="javascript:goLogout()">Logout</a></li>
        </c:if>
        <c:if test="${sessionId ne null}">
            <li><a href="javascript:goLibrary()">Library</a></li>
        </c:if>
    </ul>
	</nav>
	<nav>
        <div class="icons">
            <div class="search-box" id="search-box">
                <input type="text" placeholder="Search...">
            </div>
            <a href="#" id="search-icon"><i class="fas fa-search"></i></a>
            <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
        </div>
    </nav>
    </div>
	</header>
        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>

        <div class="container">
            <div class="back">
                <a href="#">←</a>
            </div>
            <h1>결제 페이지</h1>
            <label for="paymentMethod">결제수단 선택:</label>
            <select id="paymentMethod" onchange="changePaymentMethod()">
                <option value="">선택하세요</option>
                <option value="wallet">사이트 지갑</option>
                <option value="card">카드</option>
                <option value="recharge">카드로 지갑 충전</option>
            </select>
			
            <!-- 결제 정보창 (동적 변경) -->
            <div id="walletSection" class="hidden">
                <h2>사이트 지갑 결제</h2>
                <p>현재 지갑 잔액: <span id="walletBalance">$${sessionMoney}</span></p>
                <label for="paymentAmount">결제 금액:</label>
                <input type="number" id="paymentAmount" readonly="readonly" placeholder="결제 금액" value="${t_money}"/>
                <button class="button" onclick="processWalletPayment()">계속</button>
            </div>

            <!-- 카드 결제 섹션 -->
            <div id="cardSection" class="hidden">
                <h2>카드 결제</h2>
                <label for="paymentAmount">결제 금액:</label>
                <input type="number" id="paymentAmount" placeholder="결제 금액"readonly="readonly"value="${t_money}" />
                <label for="cardNumber">카드 번호:</label>
                <input
                    type="number"
                    maxlength="16"
                    oninput="maxLengthChk(this)"
                    id="cardNumber"
                    placeholder="카드 번호 16자리를 입력하세요"
                />
                <label for="cardExpiry">유효기간:</label>
                <input type="number" maxlength="4" oninput="maxLengthChk(this)" id="cardExpiry" placeholder="MMYY" />
                <label for="cardCVC">CVC:</label>
                <input type="number" maxlength="3" oninput="maxLengthChk(this)" id="cardCVC" placeholder="CVC" />
                <p id="partialPaymentMessage" class="hidden">부족한 금액: $<span id="remainingAmount"></span></p>
                <button class="button" onclick="processCardPayment()">계속</button>
            </div>

            <!-- 지갑 충전 창 -->
            <div id="rechargeSection" class="hidden">
                <h2>지갑 충전</h2>
                <label for="rechargeAmount">충전할 금액:</label>
                <input type="number" id="rechargeAmount" placeholder="충전할 금액을 입력하세요"/>
                <label for="rechargeCardNumber">카드 번호:</label>
                <input
                    type="text"
                    id="rechargeCardNumber"
                    maxlength="16"
                    oninput="maxLengthChk(this)"
                    placeholder="카드 번호 16자리를 입력하세요"
                />
                <label for="rechargeCardExpiry">유효기간:</label>
                <input
                    type="text"
                    id="rechargeCardExpiry"
                    maxlength="4"
                    oninput="maxLengthChk(this)"
                    placeholder="MMYY"
                />
                <label for="rechargeCardCVC">CVC:</label>
                <input type="text" id="rechargeCardCVC" maxlength="3" oninput="maxLengthChk(this)" placeholder="CVC" />
                <button class="button" onclick="processRecharge()">충전하기</button>
            </div>
            <!-- 결제 결과 -->
            <div id="paymentResult" class="hidden">
                <h2 id="resultMessage"></h2>
                <button id="resultButton" class="button"></button>
            </div>
        </div>

        <script>
            let walletBalance = ${sessionMoney}; // 지갑잔액
            let totalPaymentAmount = 0; //게임 가격
            let remainingAmount = 0; //부족한 게임값
            let rechargeMode = false; // 충전 모드 확인

            // input number 글자수 제한
            function maxLengthChk(object) {
                if (object.value.length > object.maxLength) {
                    object.value = object.value.slice(0, object.maxLength);
                }
            }

            function changePaymentMethod() {
                //체크박스 메서드
                const paymentMethod = document.getElementById('paymentMethod').value;
                document.getElementById('walletSection').classList.add('hidden');
                document.getElementById('cardSection').classList.add('hidden');
                document.getElementById('rechargeSection').classList.add('hidden');
                document.getElementById('paymentResult').classList.add('hidden');
                rechargeMode = false;

                if (paymentMethod === 'wallet') {
                    document.getElementById('walletSection').classList.remove('hidden');
                } else if (paymentMethod === 'card') {
                    document.getElementById('cardSection').classList.remove('hidden');
                    document.getElementById('partialPaymentMessage').classList.add('hidden');
                } else if (paymentMethod === 'recharge') {
                    document.getElementById('rechargeSection').classList.remove('hidden');
                    rechargeMode = true;
                }
            }

            function processWalletPayment() {
                //지갑결제
                totalPaymentAmount = parseFloat(document.getElementById('paymentAmount').value);
                if (totalPaymentAmount > walletBalance) {
                    remainingAmount = totalPaymentAmount - walletBalance;
                    document.getElementById('walletSection').classList.add('hidden');
                    switchToCardPayment(remainingAmount);
                } else {
                    walletBalance -= totalPaymentAmount;
                    Game_money_purchase('${t_money}');
                    completePayment(true, false); // 지갑 결제 성공
                }
            }

            function switchToCardPayment(remainingAmount) {
                // 결제수단을 카드로 변경 및 카드 결제 페이지로 이동
                document.getElementById('paymentMethod').value = 'card';
                changePaymentMethod();
                document.getElementById('remainingAmount').innerText = remainingAmount;
                document.getElementById('partialPaymentMessage').classList.remove('hidden');
            }

            function validateCardFields(cardNumberId, cardExpiryId, cardCVCId) {
                const cardNumber = document.getElementById(cardNumberId).value.length;
                const cardExpiry = document.getElementById(cardExpiryId).value.length;
                const cardCVC = document.getElementById(cardCVCId).value.length;

                if (cardNumber < 16) {
                    document.getElementById(cardNumberId).focus();
                    return false;
                }
                if (cardExpiry < 4) {
                    document.getElementById(cardExpiryId).focus();
                    return false;
                }
                if (cardCVC < 3) {
                    document.getElementById(cardCVCId).focus();
                    return false;
                }
                return true;
            }
            // 체워진 값 체크
            function processCardPayment() {
                if (!validateCardFields('cardNumber', 'cardExpiry', 'cardCVC')) {
                    return;
                }
                game_pay();
                // 카드 결제 처리
                completePayment(true, false);
            }
            // 카드로 지갑 충전
            function processRecharge() {
                const rechargeAmount = parseInt(document.getElementById('rechargeAmount').value);
                if (!rechargeAmount) {
                    document.getElementById('rechargeAmount').focus();
                    return;
                }
                if (!validateCardFields('rechargeCardNumber', 'rechargeCardExpiry', 'rechargeCardCVC')) {
                    return;
                }
                goRecharge(rechargeAmount);
                completePayment(true, true); // 충전 후 장바구니로 이동
            }
            // 결제완료 페이지
            function completePayment(success, isRecharge) {
                document.getElementById('walletSection').classList.add('hidden');
                document.getElementById('cardSection').classList.add('hidden');
                document.getElementById('rechargeSection').classList.add('hidden');
                document.getElementById('paymentResult').classList.remove('hidden');

                // 결제 수단 선택 label과 select 숨기기
                document.querySelector('label[for="paymentMethod"]').classList.add('hidden');
                document.getElementById('paymentMethod').classList.add('hidden');

                if (success) {
                    document.getElementById('resultMessage').innerText = isRecharge ? '충전 성공!' : '결제 성공!';
                    document.getElementById('resultButton').innerText = isRecharge
                        ? '장바구니로 돌아가기'
                        : '라이브러리로 돌아가기';
                    document.getElementById('resultButton').onclick = function () {
                        window.location.href = isRecharge ? 'javascript:goCart()' : 'javascript:goLibrary()';
                    };
                } else {
                    document.getElementById('resultMessage').innerText = '결제 실패!';
                    document.getElementById('resultButton').innerText = '장바구니로 돌아가기';
                    document.getElementById('resultButton').onclick = function () {
                        window.location.href = 'javascript:goCart()';
                    };
                }
            }
        </script>
    </body>
</html>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/logo.png" alt="사이트 로고" />
        </div>
        <div class="footer-links">
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
            </ul>
        </div>
        <div class="footer-social">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
        <div class="footer-copyright">
            <p>&copy; 2024 Futuristic Gaming Platform. All rights reserved.</p>
        </div>
    </div>
</footer>
