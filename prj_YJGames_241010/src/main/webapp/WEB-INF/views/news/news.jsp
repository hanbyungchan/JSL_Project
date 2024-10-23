<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<script type="text/javascript">
	function goNewsView(no){
		news.n_no.value=no;
		news.method="post";
		news.action="NewsView";
		news.submit();
	}
	

</script>
<html lang="ko">
    <head>
    <form name="news">
    	<input type="hidden" name="n_no">
    </form>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>에픽게임즈 레이아웃</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/tdings.css" />
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
            <h1>EX game news</h1>
            <section class="first-section">
                <div class="large-image">
                    <a href="" target="_blank">
                        <img src="img/game_test.jpg" alt="Final Fantasy XVI" />
                    </a>
                    <div class="image-text">
                        <h2>Final Fantasy XVI</h2>
                        <p>Final Fantasy XVI Continues The Series' Long History on PC</p>
                        <p>Final Fantasy 16th piece brings action and Eikon to PC</p>
                    </div>
                </div>

                <div class="small-image">
                    <a href="" target="_blank">
                        <img src="img/game4.jpg" alt="" />
                        <img src="img/game_test.jpg" alt="" />
                        <p>Start the game after signing up for membership</p>
                    </a>
                </div>
            </section>

            <section class="second-section">
                <ul style="te">
                    <c:forEach items="${dtos}" var = "dto">
                    <li>
                        <a href="javascript:goNewsView('${dto.getN_no()}')">
                            <h3>${dto.getN_title()}</h3>
                            <p>
							    <c:choose>
							        <c:when test="${fn:length(dto.getN_content()) > 100}">
							            ${fn:substring(dto.getN_content(), 0, 100)}...
							        </c:when>
							        <c:otherwise>
							            ${dto.getN_content()}
							        </c:otherwise>
							    </c:choose>
							</p>
                        </a>
                    </li>
                    </c:forEach>
                    
                    <!-- <li>
                        <a href="">
                            <h3>Gamescom 2024 Best: A guide to schedules, new games, trailers and more</h3>
                            <p>Check out Geoff Keighley's Opening Night Live to interviews.</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <h3>Borderlands: From a crazy idea to a video game smash hit and a movie</h3>
                            <p>Franchise producer Randy Pitchford talks about filmmaking.</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <h3>Evo 2024, a fancy, hot, and hot fighting game festival</h3>
                            <p>Fatal Fury: City of the Wolves Experience</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <h3>Kingdom Come: Deliverance How II Furthers the Medieval RPG Series</h3>
                            <p>
                                90 / 3000발음듣기복사하기필기인식기번역하기 영어열기/닫기 아이콘 Medieval Bohemia has no
                                potatoes, but plenty of watermelons. Talk to Warhorse Studios developers about how the
                                upcoming Medieval RPG has expanded over its predecessor.
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <h3>
                                Four months ago, Empire of the Ants reinterpreted the RTS genre in a new, microscopic
                                way
                            </h3>
                            <p>
                                Genre innovation technology that brings realistic ants to life like the picture, and why
                                we can't guarantee that no insects are harmed during game production. Tower
                            </p>
                        </a>
                    </li> -->
                </ul>
            </section>
        </div>
    </body>
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
</html>




<%-- 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<c:forEach items="${dtos}" var = "dtos">
	<br>
	-----------------------------
	${dtos.getN_no()}
	${dtos.getN_title()}
	${dtos.getN_content()}
	${dtos.getN_attach()}
	${dtos.getN_uploader()}
	${dtos.getN_upload_date()}
	${dtos.getN_update_date()}
	${dtos.getG_code()}
	-----------------------------
	<br>
</c:forEach>


</body>
</html> --%>