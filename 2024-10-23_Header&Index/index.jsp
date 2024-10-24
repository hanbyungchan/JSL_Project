<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSL Games</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="icon" type="image/png" href="img/logo.png">
    <!-- CSS 연동 -->
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/index.css">
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <%@ include file = "scripts.jsp"%>
    <script type="text/javascript">
    	function goGenreSearch(no){
			game.t_genre.value=no;
			game.method="post";
			game.action="Search";
			game.submit();	
		}
    	function goView(s_no) {
    		game.method="post";
    		game.action="Game?t_gubun=view&t_pageNo="+s_no;
    		game.submit();
		}
    	function Contain_game(a,b) {
    		game.t_id.value = b;
			game.t_pageNo.value = a;
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
    	function goAlert() {
			alert("please Login!");
			game.method="post";
    		game.action="Game?t_gubun=goSignin";
    		game.submit();	
		}
    </script>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	<input type="hidden" name="t_id">
	<input type="hidden" name="result">
	<input type="hidden" name="t_genre">
	</form>

	<%@ include file = "header.jsp"%>

    <div class="main-image">
        <img src="img/main-image.jpg" alt="메인 이미지">
    </div>

<!-- ================================================================== -->	
	<div class="slider-container">
    <!-- 슬라이더 제목과 밑줄 -->
    <div class="slider-header">
        <h3>Highlights</h3>
        <div class="underline"></div>
    </div>
	
    <div class="slider">
        <div class="slide-nav prev-slide" id="prev-slide">
            <i class="fas fa-chevron-left"></i>
        </div>
        <div class="slider-wrapper" id="slider-wrapper">
        <c:forEach items="${t_dtos1}" var = "dto1">
            <div class="slide active">
                <img src="img/${dto1.getS_page_no()}/${dto1.getS_img_main()}" alt="게임 1">
                
<div class="slide-content">
    <h2>${dto1.getG_name()}</h2>
    <p>Now available</p>

    <div class="price-container">
        <div class="price-wrapper">
            <c:if test="${dto1.getG_price() ne '0'}">
                <c:if test="${dto1.getS_sale() ne '0'}">
                    <div class="original-price">$${dto1.getG_price()}</div>
                    <div class="discounted-price">$${dto1.getG_price2()}</div>
                </c:if>
                <c:if test="${dto1.getS_sale() eq '0'}">
                    <div class="discounted-price">$${dto1.getG_price()}</div>
                </c:if>
            </c:if>
            <c:if test="${dto1.getG_price() eq '0'}">
                <div class="discounted-price">Free!</div>
            </c:if>
        </div>
        <c:if test="${dto1.getG_price() ne '0' and dto1.getS_sale() ne '0'}">
            <div class="discount-rate">-${dto1.getS_sale()}%</div>
        </c:if>
        <c:if test="${sessionId eq null}"><button class="add-to-cart"  onclick="goAlert()">Add to Cart</button></c:if>
        <c:if test="${sessionId ne null}"><button class="add-to-cart"  onclick="Contain_game('${dto1.getS_page_no()}','${sessionId}')">Add to Cart</button></c:if>
    </div>
</div>

            </div>
         </c:forEach>
            
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


<!-- 뉴스 섹션 제목과 밑줄 -->
<div class="news-header">
    <h3>Latest News</h3>
    <div class="underline"></div>
</div>
   <div class="news-box">
        <div class="big-news-row">
        
         <c:forEach items="${t_dtos2}" var="dto2">
            <div class="news-big">
                <a href="javascript:goView('${dto2.getS_page_no()}')">
                    <span class="img">
                        <img src="img/${dto2.getS_page_no()}/${dto2.getS_img_main()}" alt="">
                    </span>
                </a>
                <p>${dto2.getG_name()}</p>
                
                <!-- 할인 있을 때 -->
                <c:if test="${dto2.getS_sale() ne '0'}">
                    <p class="news-price-box">
                  		<span class="news-discount-rate">-${dto2.getS_sale()}%</span>
                        <span class="news-discounted-price">$${dto2.getG_price2()}</span>
                        <span class="news-original-price">$${dto2.getG_price()}</span>
                    </p>
                </c:if>
                
                <!-- 할인 없을 때 -->
                <c:if test="${dto2.getS_sale() eq '0'}">
                    <p class="discounted-price">$${dto2.getG_price()}</p>
                </c:if>
            </div>
        </c:forEach>
            
            
        </div>
        
       

<div class="small-news-row">

    <c:forEach items="${t_dtos3}" var="dto3">
            <div class="news-small">
                <a href="javascript:goView('${dto3.getS_page_no()}')">
                    <span class="img">
                        <img src="img/${dto3.getS_page_no()}/${dto3.getS_img_main()}" alt="">
                    </span>
                </a>
                <p>${dto3.getG_name()}</p>
                
                <!-- 할인 있을 때 -->
                <c:if test="${dto3.getS_sale() ne '0'}">
                    <p class="news-price-box">
                	    <span class="news-discount-rate">-${dto3.getS_sale()}%</span>
                        <span class="news-discounted-price">$${dto3.getG_price2()}</span>
                        <span class="news-original-price">$${dto3.getG_price()}</span>
                    </p>
                </c:if>
                
                <!-- 할인 없을 때 -->
                <c:if test="${dto3.getS_sale() eq '0'}">
                    <p class="discounted-price">$${dto3.getG_price()}</p>
                </c:if>
            </div>
        </c:forEach>
</div>
        
        
    </div>
	
	<!-- 카테고리 섹션 제목과 밑줄 -->
<div class="category-header">
    <h3>Popularity Categories</h3>
    <div class="underline"></div>
</div>

	<!-- 카테고리 섹션 제목과 밑줄 -->
<div class="category-header">
    <h3>Popularity Categories</h3>
    <div class="underline"></div>
</div>

<!-- 카테고리 섹션 -->
<div class="category-box">
    <div class="category-item">
        <a class="category-a" href="javascript:goGenreSearch('3')">
            <div class="img-container">
                <img src="img/category1.jpg" alt="카테고리 이미지 1">
                <div class="category-gradient"></div>
                <p class="category-text">FPS</p>
            </div>
        </a>
    </div>
    <div class="category-item">
        <a class="category-a" href="javascript:goGenreSearch('1')">
            <div class="img-container">
                <img src="img/category2.jpg" alt="카테고리 이미지 2">
                <div class="category-gradient"></div>
                <p class="category-text">RPG</p>
            </div>
        </a>
    </div>
    <div class="category-item">
        <a class="category-a" href="javascript:goGenreSearch('4')">
            <div class="img-container">
                <img src="img/category3.jpg" alt="카테고리 이미지 3">
                <div class="category-gradient"></div>
                <p class="category-text">Action</p>
            </div>
        </a>
    </div>
    <div class="category-item">
        <a class="category-a" href="javascript:goGenreSearch('9')">
            <div class="img-container">
                <img src="img/category4.jpg" alt="카테고리 이미지 4">
                <div class="category-gradient"></div>
                <p class="category-text">Sports</p>
            </div>
        </a>
    </div>
</div>

<!-- 최신 게임 섹션 제목과 밑줄 -->
<div class="latest-games-header">
    <h3>Latest Games</h3>
    <div class="underline"></div>
</div>
<!-- 최신 게임 섹션 -->
<div class="latest-games-container">
    <div class="latest-games">
        <!-- 왼쪽 게임 목록 -->
        <div class="game-list">
        <c:forEach items="${t_dtos1}" var = "dto1">
        <a href="javascript:goView('${dto1.getS_page_no()}')">
            <div class="game-item" data-game="1" id ="test">
                <div class="game-info">
                    <h4>${dto1.getG_name()}</h4>
                    <p>a, b, c</p>
                    <span class="price"><c:if test="${dto1.getG_price() eq '0'}">Free</c:if><c:if test="${dto1.getG_price() ne '0'}">$${dto1.getG_price2()}</c:if></span>
                    <span class="discount"><c:if test="${dto1.getS_sale() ne '0'}">-${dto1.getS_sale()}%</c:if></span>
                </div>
            </div>
        </a>
        </c:forEach>
        </div>
        <div class="game-preview">
            <img class="preview-image1" src="">
		    <img class="preview-image2" src="">
		    <img class="preview-image3" src="">
		    <img class="preview-image4" src="">
        </div>
    </div>
</div>


<!-- ============================================================================= -->	
<script src="js/main.js"></script>
	
</body>
</html>
<%@ include file = "footer.jsp"%>
