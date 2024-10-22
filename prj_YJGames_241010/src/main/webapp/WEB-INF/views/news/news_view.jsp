<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>소식 상세페이지</title>
        <link rel="stylesheet" href="css/tdingDetail.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
            rel="stylesheet"
        />
    </head>
    <body>
        <header class="header" id="header">
            <div class="header-content">
                <div class="logo">
                    <img src="img/logo.png" alt="사이트 로고" />
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
            </div>
        </header>
        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>
        <div class="container">
            <h1>Sonic x Shadow Generations, which celebrates iconic antiheroes in the coolest way</h1>
            <div class="author-date">2024. 10. 14 | 작성자: Paul Cecchini</div>

            <div class="image-container">
                <img
                    src="https://cdn2.unrealengine.com/sonic-x-shadow-generations-header-3840x2160-8744f72c87c5.jpeg"
                    alt="섀도우 이미지 1"
                />
            </div>

            <p class="content">
                During the conceptual stage of the late 90s, Shadow was named Terios, a black hedgehog with sharp scars
                on his eyes and a nice scarf. With the name provisionally intended to play Sonic's dark counterpart,
                Therios was inspired by American heroes like Spawn.
            </p>

            <div class="image-container">
                <img
                    src="https://cdn2.unrealengine.com/sonic-x-shadow-generations-7-1920x1080-fe6861be1ef6.jpg"
                    alt="섀도우 이미지 2"
                />
            </div>

            <p class="content">
                Over time, Terrios has become the shadow that fans know and love today. But this original look has also
                become a fun reflection, and Sonic fans will have a chance to bring back memories like this one.
            </p>

            <p class="content highlight">
                "Those who pre-purchase the digital deluxe edition will receive a specially redesigned new Terrios skin
                through the game." - Izuka
            </p>

            <p class="content">
                In-game, Professor Gerald Robotnik created Shadow to create life that would culminate in the world. His
                granddaughter Maria's sacrificial move has led Shadow to embark on a journey as a hero and anti-hero,
                and this complex narrative is still receiving great attention from many fans.
            </p>

            <div class="image-container">
                <img
                    src="https://cdn2.unrealengine.com/sonic-x-shadow-generations-4-1920x1080-5dd301f34ac2.jpg"
                    alt="섀도우 이미지 2"
                />
            </div>
            <p class="content">
                Over time, Terrios has become the shadow that fans know and love today. But this original look has also
                become a fun reflection, and Sonic fans will have a chance to bring back memories like this one.
            </p>

            <p class="content highlight">
                "Those who pre-purchase the digital deluxe edition will receive a specially redesigned new Terrios skin
                through the game." - Izuka
            </p>

            <p class="content">
                In-game, Professor Gerald Robotnik created Shadow to create life that would culminate in the world. His
                granddaughter Maria's sacrificial move has led Shadow to embark on a journey as a hero and anti-hero,
                and this complex narrative is still receiving great attention from many fans.
            </p>
           	<!-- 뭐 어디 dto 변수명 잘못 건드렸나 오류남 -->
            ${dto.getN_title()}
            
        </div>
        <div class="btns">
            <div class="moveTopBtn">맨 위로</div>
            <div class="moveBottomBtn">맨 아래로</div>
        </div>
        <script src="js/main.js"></script>
        <script>
            const $topBtn = document.querySelector('.btns .moveTopBtn');

            // 버튼 클릭 시 맨 위로 이동
            $topBtn.onclick = () => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            };

            const $bottomBtn = document.querySelector('.moveBottomBtn');

            // 버튼 클릭 시 페이지 하단으로 이동
            $bottomBtn.onclick = () => {
                window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
            };
        </script>
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
    </body>
</html>
