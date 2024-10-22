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

    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

    <header class="header" id="header">
        <div class="header-content">
            <div class="logo">
                <img src="img/logo.png" alt="사이트 로고">
            </div>
            <nav class="menu" id="menu">
                <ul>
                    <li><a href="#">STORE</a></li>
                    <li><a href="#">COMMUNITY</a></li>
                    <li><a href="#">SUPPORT</a></li>
                    <li><a href="#">Ex</a></li>
                    <li><a href="#">SIGN IN</a></li>
                </ul>
            </nav>
            <div class="icons">
                <a href="#"><i class="fas fa-search"></i></a>
                <a href="#"><i class="fas fa-shopping-cart"></i></a>
            </div>
            <div class="hamburger" id="hamburger">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>

    <!-- 메인 컨테이너 -->
<div class="main-container">
    <!-- 왼쪽 섹션 -->
    <div class="left-section">
        <h2 class="media-title">게임 플레이 트레일러</h2>

        <!-- 메인 미디어 영역 -->
        <div class="main-media" id="main-media">
            <video id="main-video" src="./video/${dto.getS_page_no()}/${dto.getS_video_1()}" width="100%" height="100%" controls autoplay></video>
        </div>
		
        <!-- 썸네일 갤러리 -->
        <div class="media-gallery-wrapper">
            <button class="gallery-nav prev" id="prev-btn">&lt;</button>
            <div class="media-gallery" id="media-gallery">
                <img src="./img/${dto.getS_page_no()}/${dto.getS_video_1()}" alt="동영상 1 썸네일" data-video-src="./video/intro.mp4">
                <img src="./img/${dto.getS_page_no()}/${dto.getS_video_2()}" alt="동영상 2 썸네일" data-video-src="./video/intro.mp4">
                <img src="./img/${dto.getS_page_no()}/${dto.getS_img_1()}" alt="이미지 1">
                <img src="./img/${dto.getS_page_no()}/${dto.getS_img_2()}" alt="이미지 2">
            </div>
            <button class="gallery-nav next" id="next-btn">&gt;</button>
        </div>

        <!-- 상세 정보 섹션 -->
        <div class="details-section">
            <h3>게임 상세 정보</h3>
            <div class="details-content" id="details-content">
                <p>${dto.getS_info_txt()}</p>
            </div>
            <button class="toggle-btn" id="toggle-btn" onclick="toggleContent()">펼치기</button>
        </div>
    </div>

    <!-- 오른쪽 섹션 (백그라운드를 게임 상세정보와 함께 감싸기) -->
    <div class="right-section-container">
        <div class="info-section">
            <div class="game-logo">
                <img src="./img/game-logo.png" alt="게임 로고" width="100%">
            </div>
            <!-- 전체 이용가 표시 -->
            <div class="rating-section">
                <img src="./img/GRAC_all_68.png" alt="전체 이용가 아이콘" width="68" height="68">
                <h3>${dto.getG_grade()}</h3>
            </div>

            <div class="price-section">
                <div class="original-price" style="color: gray; text-decoration: line-through;">$${dto.getG_price() }</div>
                <div class="discount-rate" style="color: red;">-${dto.getS_sale() }%</div>
                <div class="discounted-price" style="color: #00e676;">$${dto.getG_sale_price() }</div>
            </div>
            <button class="btn buy-btn">지금 구매</button>
            <button class="btn cart-btn">장바구니에 담기</button>
            <div class="system-requirements">
                <h4>시스템 요구 사항</h4>
                <ul>
                    <li>운영체제: ${dto.getS_spec_1() }</li>
                    <li>프로세서: ${dto.getS_spec_2() }</li>
                    <li>메모리: ${dto.getS_spec_3() }</li>
                    <li>그래픽: ${dto.getS_spec_4() }</li>
                    <li>저장 공간: ${dto.getS_spec_5() }</li>
                </ul>
            </div>
            <div class="release-date">
                <h4>출시일</h4>
                <p>${dto.getS_date() }</p>
            </div>
        </div>
    </div>
</div>





    </div>

    <!-- JS 연동 -->
    <script src="js/main.js"></script> <!-- 헤더 기능이 들어있는 main.js -->
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
    