<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>
        <link rel="stylesheet" href="css/Library.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/gamesearch.css" />
        <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <script type="text/javascript">
    	function performSearch() {
            game.method = "post";
            game.action = "Game?t_gubun=library";
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
                    <input type="text" placeholder="검색..." id="search-input" name="t_search" value="${t_search}" onkeypress="checkEnter(event)"/>
                    <button type="button" class="search-icon" onclick="performSearch()">🔍</button>
                </div>
                	</form>
                <div class="recent">
                <c:if test="${t_search eq ''}"><h2>My Game</h2></c:if>
                <c:if test="${t_search ne ''}"><h2>games found</h2></c:if>
                    <ul>
                    <c:forEach items="${t_dtos}" var="dto">
                    <li><a href="javascript:goDetail('${dto.getG_code()}')">${dto.getG_name()}</a></li>
                   	</c:forEach>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="main-content">
                <hr class="divider" />
                <div class="game-thumbnails-slider">
                <div class="game2">
                        <img class="big" src="https://cdn.akamai.steamstatic.com/store/home/store_home_share.jpg" alt="Mass Effect"/>
                </div>
                <br>    
                    <c:forEach items="${t_dtos}" var="dto">
                    <div class="game">
                    <a href="javascript:goDetail('${dto.getG_code()}')">
                        <img class="small" src="img/${dto.getG_code()}/${dto.getS_img_main()}"
                            alt="${dto.getG_name()}"
                        />
                        <p>${dto.getG_name()}</p>
                        </a>
                    </div>
                    </c:forEach>
                </div>

            </div>
        </div>
        <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
        <script src="js/main.js"></script>
    </body>
</html>
<%@ include file = "../footer.jsp"%>