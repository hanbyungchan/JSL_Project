<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList" %>
<c:set var="total" value="0"/>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="css/jangbaguni.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    	function RemoveCart(a,b) {
    		cart.t_u_id.value = a;
    		cart.t_g_code.value = b;
    		   $.ajax({
    				 type:"post",
    			  	 url:"RemoveCart",
    			  	 data: {
    			            t_u_id: cart.t_u_id.value,
    			            t_g_code: cart.t_g_code.value
    			        },
    			  	 dataType:"text",
    			  	 error:function(){
    			  		alert("a");
    			  	 },
    				 success:function(data){ 
    				 	var result = $.trim(data); 
    					 cart.t_u_id_result.value = result;
    					 if(result =="1"){location.reload();}
    					 else{alert("b");}
    				 } 
    			  });
    	  	} 
    	function goPay(a) {
    		game.method="post";
    		game.t_money.value = a;
    		game.action="Game?t_gubun=payment";
    		game.submit();
		}
    </script>
</head>
<body>
<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	<input type="hidden" name="t_id">
	<input type="hidden" name="t_money">
	</form>
    <form name="cart">
    <input type="hidden" name="t_u_id">
    <input type="hidden" name="t_g_code">
    <input type="hidden" name="t_u_id_result">
    </form>
<div class="header">
        <div class="logo">
            <img src="" alt="imgbasic">
        </div>
        <div class="nav">
            <ul>
                <li><a href="Game">STORE</a></li>
                <li><a href="#">COMMUNITY</a></li>
                <li><a href="Game?t_gubun=support">SUPPORT</a></li>
                <c:if test="${sessionId eq null}"><li><a href="javascript:goSignIn()">SIGN IN</a></li></c:if>
                <c:if test="${sessionId ne null}"><li><a href="javascript:goInfo()">MyInfo</a></li></c:if>
                <c:if test="${sessionId ne null}"><li><a href="javascript:goLogout()">Logout</a></li></c:if>
            </ul>
            <div class="login-area">
                <button>JOIN</button>
              <button>  <a href="#">LOGIN</a></button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="header2">
            <h1>My shopping cart</h1>
        </div>

        <div class="content">
            <div class="cart">
            <c:forEach items="${t_dtos}" var = "dto">
                <div class="item">
                    <img src="img/${dto.getG_code()}/icon.png" class="game-image" onclick="">
                    <div class="game-info">
                        <h2 onclick="">${dto.getG_name()}</h2>
                        <c:if test="${dto.getG_price() ne '0'}">
                        <c:if test="${dto.getS_sale() ne '0'}"><p class="price">-${dto.getS_sale()}% l  $${dto.getG_price()} -> $${dto.getG_price2()}</p></c:if>
                    	<c:if test="${dto.getS_sale() eq '0'}"><p class="price">$${dto.getG_price()}</p></c:if>
                        </c:if>
                        <c:set var="total" value="${total + dto.getG_price2()}" />
                    	<c:if test="${dto.getG_price() eq '0'}"><p class="price">Free!</p></c:if>
                        <div class="options">
                            <button class="remove-btn" onclick="RemoveCart('${dto.getU_id()}','${dto.getG_code()}')">Remove</button>	
                        </div>
                    </div>
                </div>
			</c:forEach>
			<c:if test="${empty t_dtos}">
			<span>nothing</span>
            </c:if>
            </div>
            <div class="summary">
                <h2 class="summary-title">Games and apps total</h2>
                <div class="details">
                    <div class="detail-item">
                        <span>Price</span>
                        <span>$${total}</span>
                    </div>
                    <div class="detail-item">
                        <span>Tax</span>
                        <span>Settled upon payment</span>
                    </div>
                    <hr class="divider">
                    <div class="detail-total">
                        <span>Sum</span>
                        <span>$${total}</span>
                    </div>
                </div>
                <button class="checkout-btn" onclick="goPay('${total}')">Buying</button>
            </div>
        </div>
    </div>

   
</body>
</html>
