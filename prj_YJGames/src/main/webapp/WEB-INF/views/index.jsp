<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Futuristic Gaming Platforms</title>

    <!-- CSS ���� -->
    <link rel="stylesheet" href="css/styles.css">

    <!-- Font Awesome ������ -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<header class="header">
    <div class="header-content">
        <div class="logo">
            <img src="img/logo.png" alt="����Ʈ �ΰ�">
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

    <div class="main-image">
        <img src="img/main-image.jpg" alt="���� �̹���">
    </div>

<!-- ================================================================== -->	
	<div class="slider-container">
    <!-- �����̴� ����� ���� -->
    <div class="slider-header">
        <h3>Highlights</h3>
        <div class="underline"></div>
    </div>
	
    <div class="slider">
        <div class="slide-nav prev-slide" id="prev-slide">
            <i class="fas fa-chevron-left"></i>
        </div>

        <div class="slider-wrapper" id="slider-wrapper">
            <div class="slide active">
                <img src="img/game1.jpg" alt="���� 1">
                <div class="slide-content">
                    <h2>MULLET MADJACK</h2>
                    <p>Now available</p>
                    <span class="price">$19.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="slide">
                <img src="img/game2.jpg" alt="���� 2">
                <div class="slide-content">
                    <h2>Empire of the Ants</h2>
                    <p>Pre-order now</p>
                    <span class="price">$29.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
			<div class="slide">
                <img src="img/game3.jpg" alt="���� 3">
                <div class="slide-content">
                    <h2>Empire of the Ants</h2>
                    <p>Pre-order now</p>
                    <span class="price">$29.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
			<div class="slide">
                <img src="img/game4.jpg" alt="���� 4">
                <div class="slide-content">
                    <h2>Empire of the Ants</h2>
                    <p>Pre-order now</p>
                    <span class="price">$29.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
			<div class="slide">
                <img src="img/game5.jpg" alt="���� 5">
                <div class="slide-content">
                    <h2>Empire of the Ants</h2>
                    <p>Pre-order now</p>
                    <span class="price">$29.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
			<div class="slide">
                <img src="img/game6.jpg" alt="���� 6">
                <div class="slide-content">
                    <h2>Empire of the Ants</h2>
                    <p>Pre-order now</p>
                    <span class="price">$29.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
			<div class="slide">
                <img src="img/game7.jpg" alt="���� 7">
                <div class="slide-content">
                    <h2>Empire of the Ants</h2>
                    <p>Pre-order now</p>
                    <span class="price">$29.99</span>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
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



   <div class="news-box">
        <!-- ū ���� 3�� -->
        <div class="big-news-row">
            <div class="news-big">
                <a href="#">
                    <span class="img">
                        <img src="img/game9.jpg" alt="ū ���� �̹���">
                    </span>
                    <p>ū ���� 1</p>
                </a>
            </div>
            <div class="news-big">
                <a href="#">
                    <span class="img">
                        <img src="img/game8.jpg" alt="ū ���� �̹���">
                    </span>
                    <p>ū ���� 2</p>
                </a>
            </div>
            <div class="news-big">
                <a href="#">
                    <span class="img">
                        <img src="img/game9.jpg" alt="ū ���� �̹���">
                    </span>
                    <p>ū ���� 3</p>
                </a>
            </div>
        </div>

        <!-- ���� ���� 4�� -->
        <div class="small-news-row">
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game9.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 1</p>
                </a>
            </div>
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game8.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 2</p>
                </a>
            </div>
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game9.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 3</p>
                </a>
            </div>
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game10.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 4</p>
                </a>
            </div>
        </div>
    </div>
	
	<script src="js/main.js"></script>
	
</body>
</html>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/logo.png" alt="����Ʈ �ΰ�">
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