<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>JSL Games</title>
        <link rel="icon" type="image/png" href="img/logo.png" />

        <!-- CSS linking -->
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/payment.css" />
        <script src="js/main.js"></script>
        <!-- Font Awesome icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
        function goRecharge(a) {
            game.t_recharge.value = a;
            game.t_my_money.value = "${t_dto.getU_money()}";
            $.ajax({
                type:"post",
                url:"Payment",
                data: {
                    t_id: ${sessionId},
                    t_u_money: game.t_recharge.value,
                    t_my_money: game.t_my_money.value
                },
                dataType:"text",
                error:function(){
                    alert("Error occurred.");
                },
                success:function(data){ 
                    var result = $.trim(data); 
                    game.result.value = result;
                    if(result == "1"){alert("Charged.");}
                    else{alert("Charge failed.");}
                } 
            });
        }
        function Game_money_purchase(a) {
            game.t_recharge.value = a;
            game.t_my_money.value = "${t_dto.getU_money()}";
            $.ajax({
                type:"post",
                url:"Game_money_purchase",
                data: {
                    t_id: ${sessionId},
                    t_u_money: game.t_recharge.value,
                    t_my_money: game.t_my_money.value
                },
                dataType:"text",
                error:function(){
                    alert("Error occurred.");
                },
                success:function(data){ 
                    var result = $.trim(data); 
                    game.result.value = result;
                    if(result == "1"){alert("Payment has been made");}
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
                    alert("Error occurred.");
                },
                success:function(data){ 
                    var result = $.trim(data); 
                    game.result.value = result;
                    if(result == "0"){alert("Payment failed.");}
                    else{alert("Payment has been made.");}
                } 
            });
        }
        </script>
        <%@ include file = "scripts.jsp"%>
    </head>
    <body>
    <form name="game">
        <input type="hidden" name="t_gubun">
        <input type="hidden" name="t_id">
        <input type="hidden" name="t_recharge">
        <input type="hidden" name="t_my_money">
        <input type="hidden" name="result">
    </form>
    <%@ include file = "header.jsp"%>
        <div class="main-image">
            <img src="img/main-image.jpg" alt="Main Image" />
        </div>

        <div class="container">
            <div class="back">
                <a href="javascript:history.back()">← Back</a>
            </div>
            <h1>Payment Page</h1>
            <label for="paymentMethod">Select Payment Method:</label>
            <select id="paymentMethod" onchange="changePaymentMethod()">
                <option value="">Please select</option>
                <option value="wallet">Site Wallet</option>
                <option value="card">Card</option>
                <option value="recharge">Recharge Wallet with Card</option>
            </select>
            
            <!-- Payment Information Section (Dynamic Change) -->
            <div id="walletSection" class="hidden">
                <h2>Site Wallet Payment</h2>
                <p>Current Wallet Balance: <span id="walletBalance">$${t_dto.getU_money()}</span></p>
                <label for="paymentAmount">Payment Amount:</label>
                <input type="number" id="paymentAmount" readonly="readonly" placeholder="Payment Amount" value="${t_money}"/>
                <button class="button" onclick="processWalletPayment()">Continue</button>
            </div>

            <!-- Card Payment Section -->
            <div id="cardSection" class="hidden">
                <h2>Card Payment</h2>
                <label for="paymentAmount">Payment Amount:</label>
                <input type="number" id="paymentAmount" placeholder="Payment Amount" readonly="readonly" value="${t_money}" />
                <label for="cardNumber">Card Number:</label>
                <input
                    type="number"
                    maxlength="16"
                    oninput="maxLengthChk(this)"
                    id="cardNumber"
                    placeholder="Enter 16-digit card number"
                />
                <label for="cardExpiry">Expiry Date:</label>
                <input type="number" maxlength="4" oninput="maxLengthChk(this)" id="cardExpiry" placeholder="MMYY" />
                <label for="cardCVC">CVC:</label>
                <input type="number" maxlength="3" oninput="maxLengthChk(this)" id="cardCVC" placeholder="CVC" />
                <p id="partialPaymentMessage" class="hidden">Insufficient Amount: $<span id="remainingAmount"></span></p>
                <button class="button" onclick="processCardPayment()">Continue</button>
            </div>

            <!-- Wallet Recharge Section -->
            <div id="rechargeSection" class="hidden">
                <h2>Wallet Recharge</h2>
                <label for="rechargeAmount">Recharge Amount:</label>
                <input type="number" id="rechargeAmount" placeholder="Enter the amount to recharge"/>
                <label for="rechargeCardNumber">Card Number:</label>
                <input
                    type="text"
                    id="rechargeCardNumber"
                    maxlength="16"
                    oninput="maxLengthChk(this)"
                    placeholder="Enter 16-digit card number"
                />
                <label for="rechargeCardExpiry">Expiry Date:</label>
                <input
                    type="text"
                    id="rechargeCardExpiry"
                    maxlength="4"
                    oninput="maxLengthChk(this)"
                    placeholder="MMYY"
                />
                <label for="rechargeCardCVC">CVC:</label>
                <input type="text" id="rechargeCardCVC" maxlength="3" oninput="maxLengthChk(this)" placeholder="CVC" />
                <button class="button" onclick="processRecharge()">Recharge</button>
            </div>
            <!-- Payment Result -->
            <div id="paymentResult" class="hidden">
                <h2 id="resultMessage"></h2>
                <button id="resultButton" class="button"></button>
            </div>
        </div>

        <script>
            let walletBalance = ${t_dto.getU_money()}; // Wallet balance
            let totalPaymentAmount = 0; // Game price
            let remainingAmount = 0; // Insufficient game price
            let rechargeMode = false; // Recharge mode check

            // Input number character limit
            function maxLengthChk(object) {
                if (object.value.length > object.maxLength) {
                    object.value = object.value.slice(0, object.maxLength);
                }
            }

            function changePaymentMethod() {
                // Check method
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
                // Wallet payment
                totalPaymentAmount = parseFloat(document.getElementById('paymentAmount').value);
                if (totalPaymentAmount > walletBalance) {
                    remainingAmount = totalPaymentAmount - walletBalance;
                    document.getElementById('walletSection').classList.add('hidden');
                    switchToCardPayment(remainingAmount);
                } else {
                    walletBalance -= totalPaymentAmount;
                    Game_money_purchase('${t_money}');
                    completePayment(true, false); // Wallet payment success
                }
            }

            function switchToCardPayment(remainingAmount) {
                // Change payment method to card and move to card payment page
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
            // Check filled values
            function processCardPayment() {
                if (!validateCardFields('cardNumber', 'cardExpiry', 'cardCVC')) {
                    return;
                }
                game_pay();
                // Card payment processing
                completePayment(true, false);
            }
            // Card to recharge wallet
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
                completePayment(true, true); // Move to cart after recharge
            }
            // Payment complete page
            function completePayment(success, isRecharge) {
                document.getElementById('walletSection').classList.add('hidden');
                document.getElementById('cardSection').classList.add('hidden');
                document.getElementById('rechargeSection').classList.add('hidden');
                document.getElementById('paymentResult').classList.remove('hidden');

                // Hide payment method selection label and select
                document.querySelector('label[for="paymentMethod"]').classList.add('hidden');
                document.getElementById('paymentMethod').classList.add('hidden');

                if (success) {
                    document.getElementById('resultMessage').innerText = isRecharge ? 'Recharge Successful!' : 'Payment Successful!';
                    document.getElementById('resultButton').innerText = isRecharge
                        ? 'Return to Cart'
                        : 'Return to Library';
                    document.getElementById('resultButton').onclick = function () {
                        window.location.href = isRecharge ? 'Game?t_gubun=cart' : 'Game?t_gubun=library';
                    };
                } else {
                    document.getElementById('resultMessage').innerText = 'Payment Failed!';
                    document.getElementById('resultButton').innerText = 'Return to Cart';
                    document.getElementById('resultButton').onclick = function () {
                        window.location.href = 'Game?t_gubun=cart';
                    };
                }
            }
        </script>
    </body>
</html>
<%@ include file = "footer.jsp"%>
