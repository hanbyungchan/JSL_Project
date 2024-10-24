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
    <title>JSL Games</title>
    <link rel="stylesheet" href="css/jangbaguni.css">
    <link rel="stylesheet" href="css/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script type="text/javascript">
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
    		game.t_money.value=a;
    		if(game.t_money.value == "0"){alert("There are no games to buy!");return;}
    		game.method="post";
    		game.action="Game?t_gubun=payment";
    		game.submit();
		}
    </script>
    <%@ include file = "scripts.jsp"%>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	<input type="hidden" name="t_money">
	</form>
	<form name="cart">
    <input type="hidden" name="t_u_id">
    <input type="hidden" name="t_g_code">
    <input type="hidden" name="t_u_id_result">
    </form>
	<%@ include file = "header.jsp"%>
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
                        <h2 data-g-code="${dto.getG_code()}" onclick="">${dto.getG_name()}</h2>
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
			<c:if test="${empty t_dtos}"><span>nothing</span></c:if>
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
    <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
<script src="js/main.js"></script>
</body>
</html>
<%@ include file = "footer.jsp"%>