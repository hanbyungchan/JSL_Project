<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Settings</title>
    <link rel="stylesheet" href="css/myinfo.css">
    <link rel="stylesheet" href="css/styles.css" />
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="js/common.js"></script>
    <script type="text/javascript">
    function goUpdate(){
     if(checkValueLength(user.t_u_name,2,20, "Please enter Name",'Name is more than 2 less than 20')) return;
     if(checkValueLength(user.t_u_password,3,20, "Please enter password", 'Password is more than 3 less than 20')) return;
   	 if(checkValue(user.t_u_password_check, 'Please enter password confirm')) return;
   	 if(checkValueLength(user.t_u_birth, 8, 'Please enter your Birth','Birth is 8')) return;//4 최소 15최대
   	 if(checkValue(user.t_u_gender,'select Gender')) return;
   	 if(checkValueLength(user.t_u_email_1 ,1,20, "Please enter Email", 'Email is more than 1 less than 20'))
   	 if(checkValue(user.t_u_email_2,  'Please select Email')) return;
   		user.method = "post";
   		user.action = "Game?t_gubun=userupdate";
   		user.submit();
     }
    function goDelete(){
    	if(confirm("Are you sure you want to delete it?")){
    		 if(checkValue(user.t_u_password_check, 'Please enter your current password')) return;
       		user.method = "post";
       		user.action = "Game?t_gubun=userdelete";
       		user.submit();
    	}
    }
    function goBack() {
		user.method = "post";
		user.action = "Game?t_gubun=list";
		user.submit();
	}
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
    	function goView(s_no) {
    		game.method="post";
    		game.action="Game?t_gubun=view&t_pageNo="+s_no;
    		game.submit();
		}
    	function goReview() {
    		game.method="post";
    		game.action="Game?t_gubun=myreview";
    		game.submit();
		}
    	function goGameRegi() {
    		game.method = "post";
    		game.action = "Game?t_gubun=gameRegistForm";
    		game.submit();
    	}
    </script>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	<input type="hidden" name="t_id">
	</form>
	<header class="header" id="header">
    <div class="header-content">
        <div class="logo">
            <img src="img/logo.png" alt="사이트 로고" href="">
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
        <c:if test="${sessionId ne null}"><li><a href="javascript:goGameRegi()">Game Regist</a></li></c:if>
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
    <div class="container">
        <div class="id-set" style="text-align: center;">
            <h1>Account Settings</h1>
            <p>Manage account details.</p>
        </div>
        <form name="user">
    <input type="hidden" name="t_gubun">
    <input type="hidden" name="t_u_level" value="${t_dto.getU_level()}">
        <section class="account-info">
            <h2 style="text-align: center; padding: 20px;">Account Information</h2>
            <div class="info-group">
                <label for="user-id">ID</label>
                <input type="text" name="t_u_id" value="${t_dto.getU_id()}" readonly="readonly">
            </div>
            <div class="info-group">
                <label for="username">NAME</label>
                <input type="text" name="t_u_name" value="${t_dto.getU_name()}" >
            </div>
            <div class="info-group">
                <label for="email">E-MAIL</label>
                <input type="email" name="t_u_email_1" value="${t_dto.getU_email_1()}">@<input type="email" name="t_u_email_2" value="${t_dto.getU_email_2()}" >
            </div>
            <div class="info-group">
                <label for="postal-code">BIRTH</label>
                <input type="text" name="t_u_birth" value="${t_dto.getU_birth()}">
            </div>
            <div class="info-group">
                <label for="region">GENDER</label>
                <input type="text" name="t_u_gender" value="${t_dto.getU_gender()}">
            </div>
            <div class="info-group">
                <label for="user-mileage">MONEY</label>
                <input type="text" name="t_u_money" value="${t_dto.getU_money()}" readonly="readonly">
            </div>
			<div class="info-group">
                <label for="region">CHANGE PASSWORD</label>
                <input type="password" name="t_u_password">
            </div>
            <div class="info-group">
                <label for="region">PASSWORD CONFIRM</label>
                <input type="password" name="t_u_password_check">
            </div>
        </section>
		</form>

        <div class="button-container" style="text-align: center;">
            <button class="save-button" onclick="goUpdate()">Save Changes</button>
            <button class="save-button" onclick="goBack()">Home</button>
        </div>
         <section class="personal-info">
            <h2 style="text-align: center; padding: 40px;">Delete Account</h2>
           <div class="info-group">
           <p>
           	Click Request to delete your account to begin the process of permanently deleting Epic Games accounts, including all personal information, purchase details, game progress, in-game content, Unreal Project, and Epic Games wallet accounts. Once your Epic Games account is deleted, your wallet balance will also be permanently deleted.

			If you request to delete your account, it will be deleted after 14 days. During this period, you can log in to your account and reactivate it, which will cancel your request for deletion. After 14 days, you will not be able to recover your deleted account.
			</p>
    		
		   </div>
		   <button class="save-button2" onclick="goDelete()" >Request to delete account</button>
        </section>
    </div>
    <script src="js/main.js"></script>
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