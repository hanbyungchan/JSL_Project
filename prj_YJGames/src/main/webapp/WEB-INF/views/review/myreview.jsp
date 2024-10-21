<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>

        <link rel="icon" type="image/png" href="img/logo.png" />

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/myreview.css" />

        <!-- Font Awesome 아이콘 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
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
    	function goUpdate(a) {
    		game.t_pageNo.value = a;
    		game.method="post";
    		game.action="Game?t_gubun=review_updateform";
    		game.submit();
		}
    	function goDelete(a) {
    		if(confirm("Are you sure you want to delete it?")){
    			game.t_pageNo.value = a;
    			game.method="post";
    			game.action="Game?t_gubun=review_delete";
    			game.submit();
    		}
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
                    <img src="img/logo.png" alt="사이트 로고" />
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

        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>

        <script src="js/main.js"></script>

        <div class="review_content">
            <div class="review_result slider-header">
                <h3>My review</h3>

                <div class="underline"></div>
			<c:forEach items="${t_dtos}" var = "dto">
                <div class="review-container-top">
                    <div class="review-img">
                        <span class="img">
                            <img src="img/${dto.getG_code()}/1.jpg" alt="게임 이미지" />
                        </span>
                    </div>
                    <div class="review-container">
                        <div class="game-title">${dto.getG_name()} 제품에 대한 평가</div>
                        <textarea disabled placeholder="리뷰를 작성하세요...">${dto.getR_txt()}</textarea>
                        <div class="submit-container">
                            <div class="rating-container">
                                <c:if test = "${dto.getR_recommand() eq 'g'}">
                                <img src="img/good.png" alt="Positive Review" id="positive" />
                                </c:if>
                                <c:if test = "${dto.getR_recommand() eq 'b'}">
                                <img src="img/bad.png" alt="Negative Review" id="negative" />
                                </c:if>
                            </div>
                            <div>
                                <button class="button-delete" type="button" onclick="goDelete('${dto.getG_code()}')">리뷰 삭제</button>
                                <button class="button-update" type="button" onclick="goUpdate('${dto.getG_code()}')">리뷰 수정</button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <c:if test="${empty t_dtos}">
                <div class="nothing"><span>nothing</span></div>
                </c:if>
            </div>
        </div>
    </body>
</html>

<!-- 푸터 -->
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
