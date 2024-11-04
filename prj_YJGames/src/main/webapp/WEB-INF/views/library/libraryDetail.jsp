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
    	function Exe_game(a, event) {
    	    event.preventDefault(); // 기본 동작 방지
    		game.t_fileName.value = a;
			$.ajax({
				 type:"post",
			  	 url:"exe",
			  	 data: {
			  		t_fileName: game.t_fileName.value
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
    	function Download(a, event) {
    	    event.preventDefault(); // 기본 동작 방지
    		game.t_fileName.value = a;
    		$.ajax({
    		    url: "Download",
    		    type: "POST",
    		    data: {t_fileName: game.t_fileName.value},
    		    xhrFields: {
    		        responseType: 'blob' // 서버 응답을 blob 형태로 설정
    		    },
    		    success: function(data) {
    		        // Blob을 URL로 변환
    		        var blob = new Blob([data]);
    		        var link = document.createElement('a');
    		        link.href = window.URL.createObjectURL(blob);
    		        link.download = "Leva.exe"; // 다운로드할 파일명
    		        link.click();
    		        window.URL.revokeObjectURL(link.href); // URL 해제
    		    },
    		    error: function(xhr, status, error) {
    		        console.error("다운로드 오류: ", error);
    		    }
    		});
	  	}
    	function goGameNews(no) {
    		game.g_code.value = no;
    		game.method = "post";
    		game.action = "News";
    		game.submit();
		}
    	function goNewsView(no) {
    		game.n_no.value = no;
    		game.method = "post";
    		game.action = "NewsView";
    		game.submit();
		}
    </script>
    <%@ include file = "../scripts.jsp"%>
</head>
<body>
<%@ include file = "../header.jsp"%>
<form name="game">
<input type="hidden" name="t_gubun">
<input type="hidden" name="t_pageNo">
<input type="hidden" name="g_code">
<input type="hidden" name="t_fileName">
<input type="hidden" name="t_id">
<input type="hidden" name="n_no">

    <div class="container">
        <!-- 사이드바 (게임 리스트) -->
        <div class="sidebar">
           <div class="search">
			    <input type="text" placeholder="검색..." id="search-input" name="t_search" value="${t_search}">
			    <button class="search-icon" onclick="performSearch()">🔍</button> 
			</div>
			</form>
            <div class="recent">
            	<div class="lib_result">
                <c:if test="${t_search eq ''}"><h2>My Game</h2> </c:if>
                <c:if test="${t_search ne ''}"><h2>games found</h2></c:if>
                <a href="Game?t_gubun=library" class="move-right"><i class="fa-solid fa-rotate-left"></i></a>
                </div>
                
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
                     <button class="stream-button" onclick="Download('${t_dto.getG_file()}', event)">DOWNLOAD</button>                 
                                        
     <div class="game-info"> 
    <div class="battle-pass"> 
        <h2>News</h2> 
    </div>
    <div class="achievements trendy-box">
    <c:forEach items="${t_dtos3}" var="dto">
        <div class="news-item">
            <img src="img/summernote/${dto.getN_attach()}" alt="News 1" class="news-image">
            <a href="javascript:goNewsView('${dto.getN_no()}')" class="custom-link">
            <div class="news-details">
                <h3>${dto.getN_title()}</h3>
                <p class="clamped">${dto.getN_content()}</p>
            </div>
            </a>
        </div>
    </c:forEach>
         <button class="more-button" onclick="goGameNews('${t_dto.getS_game_code()}')">Read more News</button>
    </div>
</div> 
</div>          
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
        <p><strong>${dto2.getU_name()} :</strong> ${dto2.getR_txt()}</p>
    </div>
    </c:if>
    </c:forEach>
    <button class="more-button" onclick="toggleReviews('${t_dto.getS_game_code()}')">See More</button>
</div>
</div>  
        </div>
        </div>
        <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
        <script src="js/main.js"></script>
        <script src="js/library.js"></script>
</body>
</html>
<%@ include file = "../footer.jsp"%>

