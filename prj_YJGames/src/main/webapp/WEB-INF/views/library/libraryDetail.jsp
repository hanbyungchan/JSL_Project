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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
    function performSearch() {
            game.method = "post";
            game.action = "Game?t_gubun=library_detail&t_pageNo=${t_dto.getS_page_no()}";
            game.submit();
    }
        function goDetail(a) {
        	game.t_pageNo.value=a;
    		game.method="post";
    		game.action="Game?t_gubun=library_detail";
    		game.submit();
		}
    	function checkEnter(event) {
    	    if (event.key === 'Enter') {
    	        event.preventDefault(); // 기본 폼 제출 방지
    	        performSearch(); // 검색 함수 호출
    	    }
    	}
    	function toggleReviews(a) {
    		game.t_pageNo.value=a;
    		game.method = "post";
    		game.action = "Game?t_gubun=review";
    		game.submit();
		}
    	function goToMoreNews() {
    	 
    	}
    	function Exe_game(a) {
    		game.t_pageNo.value = a;
			$.ajax({
				 type:"post",
			  	 url:"exe",
			  	 data: {
			  		t_pageNo: game.t_pageNo.value
			        },
			  	 dataType:"text",
			  	 error:function(){
			  		alert("a");
			  	 },
				 success:function(data){ 
				 	var result = $.trim(data); 
				 	game.result.value = result;
					 if(result =="1"){}
					 else{alert("The game has failed.");}
				 } 
			  });
	  	}
    </script>
    <%@ include file = "../scripts.jsp"%>
</head>
<body>
<form name="game">
<input type="hidden" name="t_gubun">
<input type="hidden" name="t_pageNo">
<input type="hidden" name="t_id">
<%@ include file = "../header.jsp"%>
    <div class="container">
        <!-- 사이드바 (게임 리스트) -->
        <div class="sidebar">
           <div class="search">
			    <input type="text" placeholder="검색..." id="search-input" name="t_search" value="${t_search}">
			    <button class="search-icon" onclick="performSearch()">🔍</button> 
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
			 <div class="main-content">
            <!-- Game Header Section -->
            <div class="game-header">
                <div class="game-header-left">
                    <img src="img/${t_dto.getS_page_no()}/${t_dto.getS_img_main()}"
                     alt="${t_dto.getS_game_name()}" class="game-logo">
                     <button class="stream-button" type="button" onclick="Exe_game('Leva')">DOWNLOAD</button>
                   
     <div class="game-info"> 
    <div class="battle-pass"> 
        <h2>News</h2> 
    </div>
    <div class="news-container">
        <div class="news-item">
            <img src="https://shared.fastly.steamstatic.com/store_item_assets/steam/spotlights/25177dc1c7d27988647ffa97/spotlight_image_english.jpg?t=1728932963" alt="News 1" class="news-image">
            <div class="news-details">
                <h3>News Title 1</h3>
                <p>a brief explanation 1</p>
            </div>
        </div>
        <div class="news-item">
            <img src="https://shared.fastly.steamstatic.com/store_item_assets/steam/spotlights/25177dc1c7d27988647ffa97/spotlight_image_english.jpg?t=1728932963" alt="News 2" class="news-image">
            <div class="news-details">
                <h3>News Title 2</h3>
                <p>a brief explanation 2</p>
            </div>
        </div>
        <div class="news-item">
            <img src="https://shared.fastly.steamstatic.com/store_item_assets/steam/spotlights/25177dc1c7d27988647ffa97/spotlight_image_english.jpg?t=1728932963" alt="News 3" class="news-image">
            <div class="news-details">
                <h3>News Title 3</h3>
                <p>a brief explanation 3</p>
                 <div class="more-news-link" onclick="goToMoreNews()">
       			 <a href="#" class="read-more">Read more news</a>
    		</div>
            </div>
        </div>
         
     
    </div>
</div> 
</div>          
</div>	
         <div class="game-banner">
		    <img src="img/${t_dto.getS_page_no()}/${t_dto.getS_img_1()}"
                     alt="${t_dto.getS_game_name()}" class="banner-img">
		    <img src="img/${t_dto.getS_page_no()}/${t_dto.getS_img_2()}"
                     alt="${t_dto.getS_game_name()}" class="banner-img">
		    <img src="img/${t_dto.getS_page_no()}/${t_dto.getS_img_3()}"
                     alt="${t_dto.getS_game_name()}" class="banner-img">
		</div>
           <div class="info-container">
    <div class="achievements trendy-box">
        <h2>Achievements</h2>
        <ul id="achievement-list" onmouseover="showAllAchievements()" onmouseout="hideAchievements()">
            <li>Achievement 1: First Victory</li>
            <li>Achievement 2: Reach 1000 Points</li>
            <li>Achievement 3: 10 Consecutive Wins</li>
            <li>Achievement 4: Get 50 Kills with a Specific Character</li>
            <li>Achievement 5: Achieve Rank 10</li>
            <li style="display:none;">Achievement 6: Discover a Secret Achievement</li>
            <li style="display:none;">Achievement 7: Play for 100 Hours</li>
            <li style="display:none;">Achievement 8: Unlock All Characters</li>
        </ul>
    </div>
</div>

<div class="reviews trendy-box">
    <h2>Reviews</h2>
    <c:forEach items="${t_dtos2}" var ="dto2" varStatus="status">
    <c:if test="${status.index < 5}">
    <div class="review">
        <p><strong>${dto2.getU_name()} :</strong> ${dto2.getR_txt()} <span class="rating">⭐⭐⭐⭐⭐</span></p>
    </div>
    </c:if>
    </c:forEach>
    <button class="more-button" onclick="toggleReviews('${t_dto.getS_game_code()}')">See More</button>
</div>
</div>  
        </div>
        </div>
        <script src="js/main.js"></script>
        <script src="js/library.js"></script>
</body>
</html>
<%@ include file = "../footer.jsp"%>


