<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EX 지원</title>
    <link rel="stylesheet" href="css/support.css">
     <link rel="stylesheet" href="css/styles.css" />
     <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <script type="text/javascript">
    	function goSignIn() {
    		
    		game.method="post";
    		game.action="Game?t_gubun=goSignin";
    		game.submit();	
		}
    	function goInfo() {
    		game.t_id.value="${sessionId}";
    		game.method="post";
    		game.action="Game?t_gubun=userinfo";
    		game.submit();
		}
    	function goLogout() {
    		game.method="post";
    		game.action="Game?t_gubun=userlogout";
    		game.submit();
		}
    	function goLibrary() {
    		game.t_gubun.value ="library";
    		game.method="post";
    		game.action="Game?t_gubun=library";
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
	<input type="hidden" name="result">
	</form>
	<header class="header" id="header">
    <div class="header-content">
        <div class="logo">
            <img src="img/logo.png" alt="사이트 로고" >
        </div>
        
<nav class="menu" id="menu">
    <ul>
        <li><a href="Game">STORE</a></li>
		<li class="community-menu">
            <a href="#">COMMUNITY</a>
            <ul class="category-dropdown">
                <li><a href="Game?t_gubun=myreview">Review</a></li>
                <li><a href="#">News</a></li>
            </ul>
        </li>
        <li><a href="Game?t_gubun=support">SUPPORT</a></li>
        <c:if test="${sessionId eq null}">
            <li><a href="Game?t_gubun=goSignin">SIGN IN</a></li>
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

    <div class="main-content">
        <h1>EX 지원</h1>
        <h2>무엇에 도움이 필요하신가요?</h2>
        <div class="login-box">
            <button class="login-button">EX에 로그인하세요</button>
            <button class="help-button">도와주세요, 로그인할 수 없습니다</button>
        </div>

      <div class="popular-products">
	    <h3>인기상품</h3>
	    	<div class="product-buttons">
		    <button>
		        <img src="../image/stu.jpg"  class="button-img"> 
		       	 카운터 스트라이크 2
		    </button>
		    <button>
		        <img src="dota2.jpg"  class="button-img"> 
		                도타 2
		    </button>
		   	 
		    <button>
		        <img src="pubg.jpg"  class="button-img"> 
		         PUBG : 배틀그라운드
		    </button>
		   
		    <button>
		        <img src="myth.jpg"  class="button-img"> 
		       	검은 신화: 오공
		    </button>
		</div>
	  </div>

        <div class="menu22">
            <button>게임, 소프트웨어 등</button>
            <button>구매</button>
            <button>내 계정</button>
            <button>거래, 선물, 시장 및 스팀 포인트</button>
            <button>스팀 클라이언트</button>
            <button>스팀 커뮤니티</button>
            <button>스팀 하드웨어</button>
        </div>
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