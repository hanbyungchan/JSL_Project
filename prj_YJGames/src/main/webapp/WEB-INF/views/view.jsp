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
    <title>JSL Games</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <!-- CSS 연동 -->
    <link rel="stylesheet" href="css/styles.css">
     <link rel="stylesheet" href="css/view.css">
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- 구글 Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
	<script type="text/javascript">
    	function goReview_de() {
    		game.method = "post";
    		game.action = "Game?t_gubun=review";
    		game.submit();
		}
    	function nowbuy(a) {
    		game.t_id.value = a;
    		if(game.t_id.value ==""){alert("Please Login!");game.method = "post";game.action = "Game?t_gubun=goSignin";game.submit(); return;}
    		game.method = "post";
    		game.action = "Game?t_gubun=payment";
    		game.submit();
		}
    	function Contain(a) {
    		game.t_id.value = a;
    		if(game.t_id.value ==""){alert("Please Login!");game.method = "post";game.action = "Game?t_gubun=goSignin";game.submit(); return;}
			$.ajax({
				 type:"post",
			  	 url:"Contain",
			  	 data: {
			  			t_u_id: game.t_id.value,
			            t_g_code: game.t_pageNo.value
			        },
			  	 dataType:"text",
			  	 error:function(){
			  		alert("a");
			  	 },
				 success:function(data){ 
				 	var result = $.trim(data); 
				 	game.result.value = result;
					 if(result =="1"){alert("You have added the game to your cart.");}
					 else if(result =="3"){alert("This game has already been purchased.");}
					 else if(result =="4"){alert("The game is already in your cart.");}
					 else{alert("The game is already in your cart or has failed.");}
				 } 
			  });
		}
    </script>
    <%@ include file = "scripts.jsp"%>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_money" value="${dto.getG_sale_price()}">
	<input type="hidden" name="t_pageNo" value="${dto.getS_page_no()}">
	<input type="hidden" name="t_id">
	<input type="hidden" name="result">
	</form>
    <%@ include file = "header.jsp"%>
    <!-- 메인 컨테이너 -->
<div class="main-container">
    <!-- 왼쪽 섹션 -->
    <div class="left-section">
        <h2 class="media-title">${dto.getS_game_name()}</h2>

        <!-- 메인 미디어 영역 -->
        <div class="main-media" id="main-media">
            <video id="main-video" src="video/${dto.getS_page_no()}/${dto.getS_video_1()}" width="100%" height="100%" controls autoplay muted></video>
        </div>
		
        <!-- 썸네일 갤러리 -->
        <div class="media-gallery-wrapper">
            <button class="gallery-nav prev" id="prev-btn">&lt;</button>
            <div class="media-gallery" id="media-gallery">
            	 <img src="img/${dto.getS_page_no()}/${dto.getS_img_main()}" alt="video 1 썸네일" data-video-src="video/${dto.getS_page_no()}/${dto.getS_video_1()}">
                <img src="img/${dto.getS_page_no()}/${dto.getS_img_main()}" alt="video 2 썸네일" data-video-src="video/${dto.getS_page_no()}/${dto.getS_video_2()}">
                <img src="img/${dto.getS_page_no()}/${dto.getS_img_1()}" alt="img 1">
                <img src="img/${dto.getS_page_no()}/${dto.getS_img_2()}" alt="img 2">
                <img src="img/${dto.getS_page_no()}/${dto.getS_img_3()}" alt="img 3">
               
            </div>
            <button class="gallery-nav next" id="next-btn">&gt;</button>
        </div>

        <!-- 상세 정보 섹션 -->
        <div class="details-section">
            <h3>About This Game</h3>
            <div class="details-content" id="details-content">
                <p id="text">${dto.getS_info_txt()}</p>
            </div>
            <button class="toggle-btn" id="toggle-btn">Read More</button>
        </div>
        
        <!-- 리뷰 섹션 -->
		<div class="review-section">
		    <h3>Game Reviews</h3>
		    <div class="review-container">
		        <!-- 좋은 리뷰 -->
		        <div class="good-review">
		            <p class="ellipsis">"${dto1.getR_txt()}"</p>
		            <p>- ${dto1.getU_name()}</p>
		        </div>
		        <!-- 나쁜 리뷰 -->
		        <div class="bad-review">
		            <p class="ellipsis">"${dto2.getR_txt()}"</p>
		            <p>- ${dto2.getU_name()}</p>
		        </div>
		    </div>
		    <button class="toggle-btn" id="toggle-btn" onclick="goReview_de()">Review More</button>
		</div>

        
    </div>

    <!-- 오른쪽 섹션 (백그라운드를 게임 상세정보와 함께 감싸기) -->
    <div class="right-section-container">
        <div class="info-section">
            <div class="game-logo">
                <img src="img/${dto.getS_page_no()}/${dto.getS_icon()}" alt="게임 로고" width="100%">
            </div>
            <!-- 전체 이용가 표시 -->
            <div class="rating-section">
            <c:if test="${dto.getG_grade() eq 'EVERYONE'}"><img src="img/ESRB_E_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'EVERYONE 10+'}"><img src="img/ESRB_E10_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'TEEN'}"><img src="img/ESRB_T_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'MATURE 17+'}"><img src="img/ESRB_M_68.png"width="68" height="68"></c:if>
            <c:if test="${dto.getG_grade() eq 'ADULTS ONLY 18+'}"><img src="img/ESRB_AO_68.png"width="68" height="68"></c:if>
                <h3>${dto.getG_grade()}</h3>
            </div>
            <div class="price-section">
			    <c:if test="${dto.getG_price() eq '0'}">
			        <div class="discounted-price">Free!</div>
			    </c:if>
			    
			    <c:if test="${dto.getG_price() ne '0'}">
			        <c:if test="${dto.getS_sale() ne '0'}">
			            <div class="price-wrapper">
			                <div class="original-price">
			                    $${dto.getG_price()}
			                </div>
			                <div class="discounted-price">
			                    $${dto.getG_sale_price()}
			                </div>
			            </div>
			            <div class="discount-rate">
			                -${dto.getS_sale()}%
			            </div>
			        </c:if>
			        
			        <c:if test="${dto.getS_sale() eq '0'}">
			            <div class="discounted-price">
			                $${dto.getG_price()}
			            </div>
			        </c:if>
			    </c:if>
			</div>

            <button class="btn buy-btn" onclick="nowbuy('${sessionId}')">Now Buy</button>
            <button class="btn cart-btn" onclick="Contain('${sessionId}')">Add to Cart</button>
            <div class="system-requirements">
                <h4>System Requirements</h4>
                <ul>
                    <li>OS: ${dto.getS_spec_1() }</li>
                    <li>Processor: ${dto.getS_spec_2() }</li>
                    <li>Memory: ${dto.getS_spec_3() }</li>
                    <li>Graphics: ${dto.getS_spec_4() }</li>
                    <li>Storage: ${dto.getS_spec_5() }</li>
                </ul>
            </div>
            <div class="release-date">
                <h4>Release Date</h4>
                <p>${dto.getS_date()}</p>
                <h4>Genres</h4>
                <c:forEach items="${dtos}" var="dto">
                <p>${dto.getGenre_name()}</p>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
    <script src="js/main.js"></script> 
    <script src="js/view.js"></script>

</body>
</html>
<%@ include file = "footer.jsp"%>
    