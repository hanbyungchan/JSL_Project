<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- sub contents -->
	  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="css/login.css" rel="stylesheet">
  	
  	 <script src="js/common.js"></script>
  	
	
    <title>로그인 페이지</title>
     <script>
     function goEnter() {
			if(event.keyCode ==13){logincheck();}
		}
        function logincheck(){
         	if(checkValue(user.t_id,"ID 입력!")) return;
			if(checkValue(user.t_password,"비밀번호 입력!")) return;
			user.t_gubun.value ="loginCheck";
			user.method="post";
			user.action="Game";
			user.submit();
       }
       function goJoin() {
    	   user.t_gubun.value = "userjoin";
    	   user.method = "post";
    	   user.action = "Game";
    	   user.submit();
       }
       function goHome() {
    	   user.t_gubun.value = "list";
    	   user.method = "post";
    	   user.action = "Game";
    	   user.submit();
       }
    </script>
   <body>
    <form name="user">
		<input type="hidden" name="t_gubun">
    <div class ="bigdiv">
		<div class="login-container">
    <h2>로그인</h2>
        <label for="t_id">아이디</label>
        <input type="text" name="t_id" id="t_id" placeholder="아이디 입력" required>

        <label for="t_password">비밀번호</label>
        <input type="password" name="t_password" id="t_password" placeholder="비밀번호 입력" required onkeypress="goEnter()">

        <input type="button" value="로그인" onclick="logincheck()">

        <div class="footer">
            <p>계정이 없으신가요? <a href="javascript:goJoin()"> 회원가입 </a></p>
               <a href="javascript:goHome()" class="btn-home"><i class="fas fa-home"></i> 홈으로</a>
        </div>
		</div>
    </div>
   </form>
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









    