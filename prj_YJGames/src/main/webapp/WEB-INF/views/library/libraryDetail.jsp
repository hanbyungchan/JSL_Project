<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게임 라이브러리</title>
    <link rel="stylesheet" href="css/Library.css">
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/gamesearch.css" />
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<script type="text/javascript">
function performSearch() {
	//걍 만들어봄 헷갈리면 지워 검색버튼 누르면 진행되는건데  빈칸이면 alert뜨게함
    const query = document.getElementById('search-input').value;
    if (query) {
        // 여기에 실제 검색 기능을 구현하면 됩니다.
        console.log("검색어:", query);
        // 예: location.href = "/search?query=" + query; (검색 페이지로 이동)
    } else {
        alert("검색어를 입력하세요.");
    }
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
    <a href="#" id="search-icon"><i class="fas fa-search"></i></a>
    <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
</div>
</nav>
</div>
</header>
    <div class="container">
        <!-- 사이드바 (게임 리스트) -->
        <div class="sidebar">
           <div class="search">
			    <input type="text" placeholder="검색..." id="search-input">
			    <button class="search-icon" onclick="performSearch()">🔍</button> 
			</div>
            <div class="recent">
                <h2>All Game</h2>
                <ul>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                    <li>GUNBIRD</li>
                    <li>The Last Spell</li>
                    <li>Surviving Mars</li>
                </ul>
                </div>
        </div>
			 <div class="main-content">
            <!-- Game Header Section -->
            <div class="game-header">
                <div class="game-header-left">
                    <img src=https://cdn.akamai.steamstatic.com/apps/dota2/images/dota2_social.jpg
                     alt="Dota 2" class="game-logo">
                     <button class="stream-button">DOWNLOAD</button>
                   
     <div class="game-info">
  
    <div class="more-friends" style="display: none;">
        <ul>
            <li><strong>Serena</strong> (45 hrs played recently)</li>
            <li><strong>Maverick</strong> (25 hrs played recently)</li>
            <li><strong>Neo</strong> (40 hrs played recently)</li>
            <li><strong>Trinity</strong> (10 hrs played recently)</li>
        </ul>
    </div>
    <div class="battle-pass">
        <h2>The International 2019 Battle Pass</h2>
        <p>The International 2019 Battle Pass has arrived. Prepare to cut a path into the final months of the DPC season...</p>
    </div>
    <div class="activity">
        <p>Say something about this game to your friends...</p>
    </div>
    <div class="friends">
        <h3>Friends who play:</h3>
        <ul>
            <li><strong>Genrich</strong> (63 hrs played recently)</li>
            <li><strong>The Lego Dark Knight</strong> (36 hrs played recently)</li>
            <li><strong>Alax</strong> (20 hrs played recently)</li>
            <li><strong>Janobi</strong> (33 hrs played recently)</li>
        </ul>
     

    <div class="more-friends" style="display: none;">
        <ul>
            <li><strong>Serena</strong> (45 hrs played recently)</li>
            <li><strong>Maverick</strong> (25 hrs played recently)</li>
            <li><strong>Neo</strong> (40 hrs played recently)</li>
            <li><strong>Trinity</strong> (10 hrs played recently)</li>
        </ul>
    </div>
    </div>
    
</div>

      
</div>          
</div>

         
			
         <div class="game-banner">
		    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbPkgP0J6lK9wmJJlRe9fGIPR_HeCkQlNM4Q&s"
		         alt="The International 2019 Battle Pass" class="banner-img">
		    <img src="https://www.newstap.co.kr/news/photo/201312/6086_10943_1542.jpg"
		         alt="The International 2019 Battle Pass" class="banner-img">
		    <img src="https://cdn.gamemeca.com/gmdata/0000/385/430/glass_20131025-11_id.jpg"
		         alt="The International 2019 Battle Pass" class="banner-img">
		    <img src="https://cdn.akamai.steamstatic.com/apps/dota2/images/dota_react/heroes/social/abyssal_underlord.jpg"
		         alt="The International 2019 Battle Pass" class="banner-img">
		    <img src="https://cdn.gamemeca.com/gmdata/0000/279/830/130503_ksjj_026.jpg"
		         alt="The International 2019 Battle Pass" class="banner-img">
		</div>
           <div class="info-container">
    <div class="achievements trendy-box">
     <h2>Achievements</h2>
<ul>
    <li>Achievement 1: First Victory</li>
    <li>Achievement 2: Reach 1000 Points</li>
    <li>Achievement 3: 10 Consecutive Wins</li>
    <li>Achievement 4: Get 50 Kills with a Specific Character</li>
    <li>Achievement 5: Achieve Rank 10</li>
</ul>
<button class="more-button" onclick="toggleAchievements()">See More</button>
<div class="more-achievements" style="display: none;">
    <ul>
        <li>Achievement 6: Discover a Secret Achievement</li>
        <li>Achievement 7: Play for 100 Hours</li>
        <li>Achievement 8: Unlock All Characters</li>
    </ul>
</div>
</div>

<div class="reviews trendy-box">
    <h2>Reviews</h2>
    <div class="review">
        <p><strong>User 1:</strong> This game is really fun! <span class="rating">⭐⭐⭐⭐⭐</span></p>
    </div>
    <div class="review">
        <p><strong>User 2:</strong> The graphics are fantastic! <span class="rating">⭐⭐⭐⭐</span></p>
    </div>
    <div class="review">
        <p><strong>User 3:</strong> The combat system is engaging! <span class="rating">⭐⭐⭐⭐⭐</span></p>
    </div>
    <button class="more-button" onclick="toggleReviews()">See More</button>
    <div class="more-reviews" style="display: none;">
        <div class="review">
            <p><strong>User 4:</strong> The story of this game is really great! <span class="rating">⭐⭐⭐⭐⭐</span></p>
        </div>
        <div class="review">
            <p><strong>User 5:</strong> The variety of characters is appealing! <span class="rating">⭐⭐⭐⭐</span></p>
        </div>
    </div>
</div>

</div>
            <div class="game-description">
                <p>The International 2019 Battle Pass has arrived. Prepare to cut a path into the final months of the DPC season...</p>
            </div>

            <!-- Activity Section -->
            <div class="activity">
                <h3>Activity</h3>
                <p>Say something about this game to your friends...</p>
            </div>

          
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


