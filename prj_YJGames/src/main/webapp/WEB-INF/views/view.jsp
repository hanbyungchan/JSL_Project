<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게임 상세 페이지</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <!-- CSS 연동 -->
    <link rel="stylesheet" href="css/styles.css">
     <link rel="stylesheet" href="css/view.css">
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
    </script>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
    <header class="header" id="header">
        <div class="header-content">
        <div class="logo">
            <img src="img/logo.png">
        </div>
	<nav class="menu" id="menu">
    <ul>
        <li><a href="Game">STORE</a></li>
        <li><a href="#">COMMUNITY</a></li>
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

    <!-- 메인 컨테이너 -->
<div class="main-container">
    <!-- 왼쪽 섹션 -->
    <div class="left-section">
        <h2 class="media-title">${dto.getS_game_name()}</h2>

        <!-- 메인 미디어 영역 -->
        <div class="main-media" id="main-media">
            <video id="main-video" src="video/intro.mp4" width="100%" height="100%" controls autoplay muted></video>
        </div>
		
        <!-- 썸네일 갤러리 -->
        <div class="media-gallery-wrapper">
            <button class="gallery-nav prev" id="prev-btn">&lt;</button>
            <div class="media-gallery" id="media-gallery">
                <img src="img/intro.gif" alt="video 1 썸네일" data-video-src="video/intro.mp4">
                <img src="img/intro.gif" alt="video 2 썸네일" data-video-src="video/intro.mp4">
                <img src="img/${dto.getS_page_no()}/2.jpg" alt="img 1">
                <img src="img/${dto.getS_page_no()}/3.jpg" alt="img 2">
                <img src="img/${dto.getS_page_no()}/4.jpg" alt="img 3">
            </div>
            <button class="gallery-nav next" id="next-btn">&gt;</button>
        </div>

        <!-- 상세 정보 섹션 -->
        <div class="details-section">
            <h3>About This Game</h3>
            <div class="details-content" id="details-content">
                <p>${dto.getS_info_txt()}</p>
            </div>
            <button class="toggle-btn" id="toggle-btn" onclick="toggleContent()">READ MORE</button>
        </div>
    </div>

    <!-- 오른쪽 섹션 (백그라운드를 게임 상세정보와 함께 감싸기) -->
    <div class="right-section-container">
        <div class="info-section">
            <div class="game-logo">
                <img src="img/${dto.getS_page_no()}/icon.png" alt="게임 로고" width="100%">
            </div>
            <!-- 전체 이용가 표시 -->
            <div class="rating-section">
            <c:if test="${dto.getG_grade() eq 'EVERYONE'}"><img src="img/ESRB_E_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'EVERYONE 10+'}"><img src="img/ESRB_E10_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'TEEN'}"><img src="img/ESRB_T_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'MATURE 17+'}"><img src="img/ESRB_M_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'ADULTS ONLY 18+'}"><img src="img/ESRB_AO_68.png"width="68" height="68"></c:if>
                <h3>${dto.getG_grade()}</h3>
            </div>
            <div class="price-section">
            <c:if test="${dto.getG_price() eq'0'}"><div class="discounted-price" style="color: #00e676;">Free!</div></c:if>
            
            <c:if test="${dto.getG_price() ne '0'}">
            	<c:if test="${dto.getS_sale() ne '0'}">
                	<div class="original-price" style="color: gray; text-decoration: line-through;">$${dto.getG_price()}</div>
                	<div class="discounted-price" style="color: #00e676;">$${dto.getG_sale_price()}</div>
                	<div class="discount-rate" style="color: red;">-${dto.getS_sale()}%</div>
            	</c:if>
            	<c:if test="${dto.getS_sale() eq '0'}"><div class="discounted-price" style="color: #00e676;">$${dto.getG_price()}</div>
            	</c:if>
            </c:if>
            </div>
            <button class="btn buy-btn">Now Buy</button>
            <button class="btn cart-btn">Add to Cart</button>
            <div class="system-requirements">
                <h4>System Requirements</h4>
                <ul>
                    <li>OS: ${dto.getS_spec_1() }</li>
                    <li>Processor: ${dto.getS_spec_2() }</li>
                    <li>Memory: ${dto.getS_spec_3() }</li>
                    <li>Graphics: ${dto.getS_spec_4() }</li>
                    <li>Storage: ${dto.getS_spec_5() }</li>
                </ul>
            </div>
            <div class="release-date">
                <h4>Release Date</h4>
                <p>${dto.getS_date()}</p>
            </div>
        </div>
    </div>
</div>

    <!-- JS 연동 -->
    <script src="js/main.js"></script> 
    <script src="js/view.js"></script>

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

</body>
</html>
    