<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/tdings.css" />
        <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script type="text/javascript">
	function goNewsView(no){
		news.n_no.value=no;
		news.method="post";
		news.action="NewsView";
		news.submit();
	}
</script>
<%@ include file = "../scripts.jsp"%>
    </head>
    <body>
    <form name="news">
    	<input type="hidden" name="n_no">
    </form>
    <form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
	<%@ include file = "../header.jsp"%>
        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>
        <div class="container">
            <h1>EX game news</h1>
            <section class="first-section">
                <div class="large-image">
                    <a href="" target="_blank">
                        <img src="img/category1.jpg" alt="Final Fantasy XVI" />
                    </a>
                    <div class="image-text">
                        <h2>Final Fantasy XVI</h2>
                        <p>Final Fantasy XVI Continues The Series' Long History on PC</p>
                        <p>Final Fantasy 16th piece brings action and Eikon to PC</p>
                    </div>
                </div>

                <div class="small-image">
                    <a href="" target="_blank">
                        <img src="img/category1.jpg" alt="" />
                        <img src="img/category1.jpg" alt="" />
                        <div class="button-text">
                            <p>Start the game after signing up for membership</p>
                        </div>
                    </a>
                </div>
            </section>

            <section class="second-section">
                <ul style="te">
                    <c:forEach items="${dtos}" var = "dto">
                    <li>
                        <a href="javascript:goNewsView('dto.getN_no')">
                            <h3>${dto.getN_title()}</h3>
                            <p>${dto.getN_content()}</p>
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
        <script src="js/main.js"></script>
    </body>
    <%@ include file = "../footer.jsp"%>
</html>