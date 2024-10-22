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
    <title>게임 상세 페이지</title>
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
    		game.method="post";
    		game.action="Game?t_gubun=library";
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
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_money" value="${dto.getG_sale_price()}">
	<input type="hidden" name="t_pageNo" value="${dto.getS_page_no()}">
	<input type="hidden" name="t_id">
	<input type="hidden" name="result">
	</form>
    <header class="header" id="header">
        <div class="header-content">
        <div class="logo">
            <img src="img/logo.png">
        </div>
	<nav class="menu" id="menu">
    <ul>
        <li><a href="Game">STORE</a></li>
        <li class="community-menu">
            <a href="#">COMMUNITY</a>
            <ul class="category-dropdown">
                <li><a href="Game?t_gubun=myreview">Review</a></li>
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
    </ul>
	</nav>
    <nav>
        <div class="icons">
            <div class="search-box" id="search-box">
                <input type="text" placeholder="Search...">
            </div>
            <a href="Search"><i class="fas fa-search"></i></a>
            <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
        </div>
    </nav>
        </div>
</header>

    <!-- 메인 컨테이너 -->
<div class="main-container">
    <!-- 왼쪽 섹션 -->
    <div class="left-section">
        <h2 class="media-title">${dto.getS_game_name()}</h2>

        <!-- 메인 미디어 영역 -->
        <div class="main-media" id="main-media">
            <video id="main-video" src="video/intro.mp4" width="100%" height="100%" controls autoplay muted></video>
        </div>
		
        <!-- 썸네일 갤러리 -->
        <div class="media-gallery-wrapper">
            <button class="gallery-nav prev" id="prev-btn">&lt;</button>
            <div class="media-gallery" id="media-gallery">
                <img src="img/intro.gif" alt="video 1 썸네일" data-video-src="video/intro.mp4">
                <img src="img/intro.gif" alt="video 2 썸네일" data-video-src="video/intro.mp4">
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
                <p>${dto.getS_info_txt()}</p>
            </div>
            <button class="toggle-btn" id="toggle-btn" onclick="toggleContent()">Read More</button>
        </div>
        
        <!-- 리뷰 섹션 -->
		<div class="review-section">
		    <h3>Game Reviews</h3>
		    <div class="review-container">
		        <!-- 좋은 리뷰 -->
		        <div class="good-review">
		            <p>"This game is fantastic! The graphics and gameplay are top-notch."</p>
		            <p>- User123</p>
		        </div>
		        <!-- 나쁜 리뷰 -->
		        <div class="bad-review">
		            <p>"I found the game too difficult and frustrating at times."</p>
		            <p>- GamerXYZ</p>
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
            </div>
        </div>
    </div>
</div>

    <!-- JS 연동 -->
    <script src="js/main.js"></script> 
    <script src="js/view.js"></script>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-logo">
                <img src="img/logo.png" alt="사이트 로고">
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
    