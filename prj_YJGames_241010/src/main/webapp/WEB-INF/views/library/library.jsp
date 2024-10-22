<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>게임 라이브러리</title>
        <link rel="stylesheet" href="css/Library.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/gamesearch.css" />
        <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <script src="js/main.js"></script>
    <script type="text/javascript">
    function performSearch() {
            game.method = "post";
            game.action = "Game?t_gubun=library";
            game.submit();
    }
        function goDetail(a) {
        	game.t_pageNo.value=a;
    		game.method="post";
    		game.action="Game?t_gubun=library_detail";
    		game.submit();
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
    	function checkEnter(event) {
    	    if (event.key === 'Enter') {
    	        event.preventDefault(); // 기본 폼 제출 방지
    	        performSearch(); // 검색 함수 호출
    	    }
    	}
    </script>
</head>
<body>
<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	<input type="hidden" name="t_id">
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
            <a href="Search"><i class="fas fa-search"></i></a>
            <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
        </div>
    </nav>
    </div>
	</header>
        <div class="container">
            <!-- 사이드바 (게임 리스트) -->
            <div class="sidebar">
                <div class="search">
                    <input type="text" placeholder="검색..." id="search-input" name="t_search" value="${t_search}" onkeypress="checkEnter(event)"/>
                    <button type="button" class="search-icon" onclick="performSearch()">🔍</button>
                </div>
                	</form>
                <div class="recent">
                <c:if test="${t_search eq ''}"><h2>All Game</h2></c:if>
                <c:if test="${t_search ne ''}"><h2>games found</h2></c:if>
                    <ul>
                    <c:forEach items="${t_dtos}" var="dto">
                    <li><a href="javascript:goDetail('${dto.getG_code()}')">${dto.getG_name()}</a></li>
                   	</c:forEach>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="main-content">
                <hr class="divider" />
                <div class="game-thumbnails-slider">
                    <div class="game">
                        <img
                            src="https://cdn.akamai.steamstatic.com/store/home/store_home_share.jpg"
                            alt="Mass Effect"
                        />
                    </div>
                    <c:forEach items="${t_dtos}" var="dto">
                    <div class="game">
                    <a href="javascript:goDetail('${dto.getG_code()}')">
                        <img class="small" src="img/${dto.getG_code()}/${dto.getS_img_main()}"
                            alt="${dto.getG_name()}"
                        />
                        <p>${dto.getG_name()}</p>
                        </a>
                    </div>
                    </c:forEach>
                    
                   
                </div>

            </div>
        </div>
        <script src="js/main.js"></script>
    </body>
</html>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/logo.png" alt="사이트 로고"/>
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