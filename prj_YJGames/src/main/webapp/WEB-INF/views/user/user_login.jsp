<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- sub contents -->
	  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="css/login.css" rel="stylesheet">
  	
  	 <script src="js/common.js"></script>
  	
	
    <title>LoginPage</title>
     <script>
        function goLogin(){ 
         	 if(checkValue(loginform.t_u_id,"Please enter ID!")) return;
			if(checkValue(loginform.t_u_password,"Please enter password")) return;
			loginform.method="post";
			loginform.action="Game?t_gubun=userlogin";
			loginform.submit();
        }
       function goJoinCustomer() {
    	   user.method = "post";
    	   user.action = "Game?t_gubun=userjoin_cus";
    	   user.submit();
       }
       function goJoinCompany() {
    	   user.method = "post";
    	   user.action = "Game?t_gubun=userjoin_com";
    	   user.submit();
       }
       function goEnter() {
			if(event.keyCode ==13){goLogin();}
		}
       function goHome() {
    	   user.method = "post";
    	   user.action = "Game?t_gubun=list";
    	   user.submit();
       }
      
    </script>
    <form name="user">
		<input type="hidden" name="t_gubun">
	</form>
   <body>
    <div class ="bigdiv">
		<div class="login-container">
    <h2>Sign In</h2>
    	<form name="loginform">
    	<input type = "hidden" name = "t_gubun">
        <label for="t_id">ID</label>
        <input type="text" name="t_u_id" id="t_id" placeholder="Enter ID" required>

        <label for="t_password">PASSWORD</label>
        <input type="password" name="t_u_password" id="t_password" onkeypress="goEnter()" placeholder="Enter Password" required>

        <input type="button" value="Login" onclick="goLogin()">

        <div class="footer">
            <p>don't have account?</p>
           <a href="javascript:goJoinCompany()">for Company </a>&nbsp;&nbsp;<a href="javascript:goJoinCustomer()">for Customer </a><br><br>
               <a href="javascript:goHome()" class="btn-home"><i class="fas fa-home"></i> Home</a>
        </div>
   		 </form>
		</div>

    

    </div>

   
   	<script>
		$(function() {
			$(".location  .dropdown > a").on("click",function(e) {
				e.preventDefault();
				if($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>
</body>
</html>