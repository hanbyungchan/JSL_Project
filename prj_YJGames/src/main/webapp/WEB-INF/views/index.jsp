<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSL Games</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="icon" type="image/png" href="img/logo.png">
	
    <!-- CSS 연동 -->
    <link rel="stylesheet" href="css/styles.css">

    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <img src="img/logo.png" alt="사이트 로고">
        </div>
        <nav class="menu" id="menu">
            <ul>
            	<li><a href="Game">STORE</a></li>
                <li><a href="#">COMMUNITY</a></li>
                <li><a href="Game?t_gubun=support">SUPPORT</a></li>
                <c:if test="${sessionId eq null}"><li><a href="javascript:goSignIn()">SIGN IN</a></li></c:if>
                <c:if test="${sessionId ne null}"><li><a href="javascript:goInfo()">MyInfo</a></li></c:if>
            </ul>
        </nav>
        <div class="icons">
            <a href="#"><i class="fas fa-search"></i></a>
            <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
        </div>
        <div class="hamburger" id="hamburger">
            <i class="fas fa-bars"></i>
        </div>
    </div>
	</header>

    <div class="main-image">
        <img src="img/main-image.jpg" alt="메인 이미지">
    </div>

<!-- ================================================================== -->	
	<div class="slider-container">
    <!-- 슬라이더 제목과 밑줄 -->
    <div class="slider-header">
        <h3>Highlights</h3>
        <div class="underline"></div>
    </div>
	
    <div class="slider">
        <div class="slide-nav prev-slide" id="prev-slide">
            <i class="fas fa-chevron-left"></i>
        </div>
        <div class="slider-wrapper" id="slider-wrapper">
        <c:forEach items="${t_dtos1}" var = "dto1">
            <div class="slide active">
                <img src="img/${dto1.getS_page_no()}/1.jpg" alt="게임 1">
                <div class="slide-content">
                    <h2>${dto1.getG_name()}</h2>
                    <p>Now available</p>
                    <c:if test="${dto1.getG_price() ne '0'}">
                    <c:if test="${dto1.getS_sale() ne '0'}"><span class="price">-${dto1.getS_sale()}% l  $${dto1.getG_price()} -> $	${dto1.getG_price2()}</span></c:if>
                    <c:if test="${dto1.getS_sale() eq '0'}"><span class="price">$${dto1.getG_price()}</span></c:if>
                    </c:if>
                    <c:if test="${dto1.getG_price() eq '0'}"><span class="price">Free!</span></c:if>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
         </c:forEach>
            
        </div>

        <div class="slide-nav next-slide" id="next-slide">
            <i class="fas fa-chevron-right"></i>
        </div>

        
    </div>
		<div class="slide-indicator">
			<span class="dot active"></span>
			<span class="dot"></span>
			<span class="dot"></span>
			<span class="dot"></span>
			<span class="dot"></span>
			<span class="dot"></span>
			<span class="dot"></span>
		</div>
	</div>


<!-- 뉴스 섹션 제목과 밑줄 -->
<div class="news-header">
    <h3>Latest News</h3>
    <div class="underline"></div>
</div>
   <div class="news-box">
        <!-- 큰 뉴스 3개 -->
        <div class="big-news-row">
        <c:forEach items="${t_dtos2}" var = "dto2">
            <div class="news-big">
                <a href="#">
                    <span class="img">
                        <img src="img/${dto2.getS_page_no()}/1.jpg" alt="큰 뉴스 이미지">
                    </span>
                    <p>${dto2.getG_name()}</p>
                    <p>${dto2.getG_price()}</p>
                </a>
            </div>
          </c:forEach>  
            
            
        </div>

        <!-- 작은 뉴스 4개 -->
        <div class="small-news-row">
        <c:forEach items="${t_dtos3}" var = "dto3">
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/${dto3.getS_page_no()}/1.jpg" alt="작은 뉴스 이미지">
                    </span>
                    <p>${dto3.getG_name()}</p>
                     <p>${dto3.getG_price()}</p>
                </a>
            </div>
        </c:forEach>
            
        </div>
    </div>
	
	<!-- 카테고리 섹션 제목과 밑줄 -->
<div class="category-header">
    <h3>Popularity Categories</h3>
    <div class="underline"></div>
</div>

<!-- 카테고리 섹션 -->
<div class="category-box">
    <div class="category-item">
        <a href="#">
            <span class="img">
                <img src="img/category1.jpg" alt="카테고리 이미지 1">
            </span>
            <p>FPS</p>
        </a>
    </div>
    <div class="category-item">
        <a href="#">
            <span class="img">
                <img src="img/category2.jpg" alt="카테고리 이미지 2">
            </span>
            <p>RPG</p>
        </a>
    </div>
    <div class="category-item">
        <a href="#">
            <span class="img">
                <img src="img/category3.jpg" alt="카테고리 이미지 3">
            </span>
            <p>Fight</p>
        </a>
    </div>
    <div class="category-item">
        <a href="#">
            <span class="img">
                <img src="img/category4.jpg" alt="카테고리 이미지 4">
            </span>
            <p>Sports</p>
        </a>
    </div>
</div>

<!-- 최신 게임 섹션 제목과 밑줄 -->
<div class="latest-games-header">
    <h3>Latest Games</h3>
    <div class="underline"></div>
</div>
<!-- 최신 게임 섹션 -->
<div class="latest-games-container">
    <div class="latest-games">
        <!-- 왼쪽 게임 목록 -->
        <div class="game-list">
        <c:forEach items="${t_dtos1}" var = "dto1">
            <div class="game-item" data-game="1" id ="test">
                <div class="game-info">
                    <h4>${dto1.getG_name()}</h4>
                    <p>a, b, c</p>
                    <span class="price"><c:if test="${dto1.getG_price() eq '0'}">Free</c:if><c:if test="${dto1.getG_price() ne '0'}">$${dto1.getG_price2()}</c:if></span>
                    <span class="discount"><c:if test="${dto1.getS_sale() ne '0'}">-${dto1.getS_sale()}%</c:if></span>
                </div>
            </div>
        </c:forEach>
            
            <!-- ... 동일한 형식으로 5개의 추가 게임 목록 -->
        </div>
        <!-- 오른쪽 이미지 및 설명 -->
        <div class="game-preview">
            <img id="preview-image" src="">
            <div class="game-description">
                <h4 id="preview-title"></h4>
                <p id="preview-text"></p>
            </div>
        </div>
    </div>
</div>


<!-- ============================================================================= -->	
<script src="js/main.js"></script>
	
</body>
</html>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/logo.png" alt="사이트 로고">
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
