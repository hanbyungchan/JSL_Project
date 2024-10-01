<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Futuristic Gaming Platform</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            background-color: #1c1c2e;
        }

        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 70px;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 20px;
            z-index: 1000;
            transition: background-color 0.3s ease;
        }

        .header.scrolled {
            background-color: rgba(0, 0, 0, 1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            max-width: 1200px;
        }

        .logo {
            flex: 1;
        }

        .logo img {
            width: 50px;
        }

        .menu {
            flex: 2;
            text-align: center;
        }

        .menu ul {
            list-style: none;
            display: inline-flex;
            gap: 20px;
        }

        .menu ul li a {
            color: #00e6e6;
            text-decoration: none;
            font-size: 1.2rem;
        }

        .menu ul li a:hover {
            color: #ff66cc;
        }

        .icons {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            gap: 20px;
        }

        .icons a {
            color: #00e6e6;
            font-size: 1.5rem;
            transition: color 0.3s;
        }

        .icons a:hover {
            color: #ff66cc;
        }

        .main-image {
            width: 100%;
            height: 300px;
            overflow: hidden;
        }

        .main-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slider {
            position: relative;
            width: 100%;
            height: 500px; /* ���̸� �÷��� �̹����� ������ �߸��� �ʵ��� ���� */
            margin: 50px auto;
            overflow: hidden;
            background-color: #3b1f12;
            border-radius: 10px;
            display: flex;
            align-items: center;
        }

        .slider-wrapper {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .slide {
            min-width: 100%;
            position: relative;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slide-content {
            position: absolute;
            bottom: 20px;
            left: 20px;
            color: white;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 10px 20px;
            border-radius: 5px;
            width: 40%; /* �˳��ϰ� ���� */
        }

        .slide-content h2 {
            font-size: 1.5rem;
            margin: 0 0 5px 0;
        }

        .slide-content p {
            font-size: 1rem;
            margin: 0 0 10px 0;
        }

        .price {
            font-size: 1.2rem;
            color: #00e676;
        }

        .add-to-cart {
            background-color: #00e676;
            border: none;
            color: white;
            padding: 5px 15px;
            font-size: 1rem;
            cursor: pointer;
            border-radius: 5px;
        }

        .add-to-cart:hover {
            background-color: #00c864;
        }

        .slide-nav {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            cursor: pointer;
            opacity: 0.5;
            transition: opacity 0.3s ease;
            color: #fff;
            font-size: 2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 50%;
            z-index: 1000;
        }

        .prev-slide {
            left: 10px;
        }

        .next-slide {
            right: 10px;
        }

        .slide-nav:hover {
            opacity: 1;
        }

        .slide-indicator {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
        }

        .dot {
            width: 10px;
            height: 10px;
            background-color: #fff;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .dot.active {
            background-color: #00e676;
        }

        .dot:hover {
            background-color: #00c864;
        }
		
		
       .news-box {
            max-width: 1200px;
            margin: 50px auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* ū ���� �ڽ� */
        .big-news-row {
            display: flex;
            gap: 20px;
        }

        .news-big {
            flex: 1; /* 3��� */
            height: 200px; /* ���̸� �ٿ����ϴ� */
            background-color: #2c2c3e;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* ���� ���� �ڽ� */
        .small-news-row {
            display: flex;
            gap: 20px;
        }

        .news-small {
            flex: 1;
            height: 150px; /* ���� ���� ���̵� �ٿ����ϴ� */
            background-color: #2c2c3e;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .news a {
            color: white;
            text-decoration: none;
            display: block;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .news .img {
            height: 70%; /* �̹��� ���� ���� */
            background-color: #3b3b4f; /* �ӽ� ��� �� */
        }

        .news .img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .news p {
            height: 30%; /* �ؽ�Ʈ ���� ���� */
            padding: 10px;
            color: white;
            font-size: 1rem;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* ������ ���� */
        @media (max-width: 768px) {
            .big-news-row, .small-news-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="header" id="header">
        <div class="header-content">
            <div class="logo">
                <img src="img/logo.png" alt="����Ʈ �ΰ�">
            </div>
            <nav class="menu">
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
    </div>

    <div class="main-image">
        <img src="img/main-image.jpg" alt="���� �̹���">
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
                        <img src="img/game1.jpg" alt="ū ���� �̹���">
                    </span>
                    <p>ū ���� 1</p>
                </a>
            </div>
            <div class="news-big">
                <a href="#">
                    <span class="img">
                        <img src="img/game2.jpg" alt="ū ���� �̹���">
                    </span>
                    <p>ū ���� 2</p>
                </a>
            </div>
            <div class="news-big">
                <a href="#">
                    <span class="img">
                        <img src="img/game3.jpg" alt="ū ���� �̹���">
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
                        <img src="img/game4.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 1</p>
                </a>
            </div>
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game5.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 2</p>
                </a>
            </div>
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game6.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 3</p>
                </a>
            </div>
            <div class="news-small">
                <a href="#">
                    <span class="img">
                        <img src="img/game7.jpg" alt="���� ���� �̹���">
                    </span>
                    <p>���� ���� 4</p>
                </a>
            </div>
        </div>
    </div>


	
    <script>
        window.addEventListener('scroll', function() {
            const header = document.getElementById('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        let currentIndex = 0;
        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.dot');
        const totalSlides = slides.length;

        function showSlide(index) {
            if (index < 0) {
                currentIndex = totalSlides - 1;
            } else if (index >= totalSlides) {
                currentIndex = 0;
            } else {
                currentIndex = index;
            }

            slides.forEach(slide => slide.classList.remove('active'));
            dots.forEach(dot => dot.classList.remove('active'));
            slides[currentIndex].classList.add('active');
            dots[currentIndex].classList.add('active');

            document.getElementById('slider-wrapper').style.transform = `translateX(-${currentIndex * 100}%)`;
        }

        document.getElementById('prev-slide').addEventListener('click', function() {
            showSlide(currentIndex - 1);
        });

        document.getElementById('next-slide').addEventListener('click', function() {
            showSlide(currentIndex + 1);
        });

        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => showSlide(index));
        });

        setInterval(() => {
            showSlide(currentIndex + 1);
        }, 5000);
    </script>
</body>
</html>