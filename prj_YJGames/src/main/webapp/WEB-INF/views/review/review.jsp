<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>게임 리뷰 페이지</title>

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/gamereview.css" />

        <!-- Font Awesome 아이콘 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    	<script type="text/javascript">
    	function goSignIn() {
    		game.method="post";
    		game.action="Game?t_gubun=goSignin";
    		game.submit();
		}
    	function goInfo() {
    		game.t_id.value="${sessionId}";
    		game.method="post";
    		game.action="Game?t_gubun=userinfo";
    		game.submit();
		}
    	function goLogout() {
    		game.method="post";
    		game.action="Game?t_gubun=userlogout";
    		game.submit();
		}
    	function goLibrary() {
    		game.method="post";
    		game.action="Game?t_gubun=library";
    		game.submit();
		}
    	function goReview() {
    		game.method="post";
    		game.action="Game?t_gubun=review";
    		game.submit();
		}
    	function goSearch() {
    		game.method="post";
    		game.action="Game?t_gubun=review";
    		game.submit();
		}
    	function goWrite() {
    		game.method="post";
    		game.action="Game?t_gubun=review_write";
    		game.submit();
		}
    </script>
    </head>
    <body>
        <header class="header" id="header">
            <div class="header-content">
                <div class="logo">
                    <img src="img/logo.png" alt="사이트 로고" />
                </div>
                <nav class="menu" id="menu">
                    <ul>
            	<li><a href="Game">STORE</a></li>
                <li><a href="javascript:goReview()">COMMUNITY</a></li>
                <li><a href="Game?t_gubun=support">SUPPORT</a></li>
                <c:if test="${sessionId eq null}"><li><a href="javascript:goSignIn()">SIGN IN</a></li></c:if>
                <c:if test="${sessionId ne null}"><li><a href="javascript:goInfo()">MyInfo</a></li></c:if>
                <c:if test="${sessionId ne null}"><li><a href="javascript:goLogout()">Logout</a></li></c:if>
                <c:if test="${sessionId ne null}"><li><a href="javascript:goLibrary()">Library</a></li></c:if>
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

        <script src="js/main.js"></script>

        <!-- ================================================================== -->
        <div class="slider-container">
            <!-- 슬라이더 제목과 밑줄 -->
        </div>
			<form name="game">
			<input type="hidden" name="t_gubun">
			<input type="hidden" name="t_id">
			<input type="hidden" name="t_g_code" value ="${t_dto.getS_page_no()}">
        <div class="review-container">
            <h1>${t_dto.getS_game_name()}</h1>
            <div class="review-section">
                <label for="review">리뷰 평가를 선택하세요:</label>
                <select id="review" name="t_review_option">
                	<option value="recent" <c:if test="${t_review_option eq 'recent'}">selected</c:if>>recent</option>
                    <option value="old" <c:if test="${t_review_option eq 'old'}">selected</c:if>>old</option>
                    <option value="good" <c:if test="${t_review_option eq 'good'}">selected</c:if>>good</option>
                    <option value="bad" <c:if test="${t_review_option eq 'bad'}">selected</c:if>>bad</option>
                </select>
            </div>
            <button class="submit-btn" onclick="goSearch()">리뷰 검색</button>
            <button class="submit-btn" onclick="goWrite()">리뷰 작성</button>

            <!-- 예시 리뷰 -->
            <div class="review-list">
            <c:forEach items="${t_dtos}" var = "dto">
                <div class="review-item">
                    <div class="icon positive">${dto.getR_recommand()}</div>
                    <!-- 긍정적 평가 아이콘 -->
                    <p>
                        ${dto.getR_txt()}
                    </p>
                    <div class="divider"></div>
                    <!-- 구분선 -->
                    <div class="user-name"><a href="#">${dto.getU_name()}</a></div>
                    <!-- 유저 이름 -->
                </div>
			</c:forEach>
            </div>
        </div>
                </form>
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
    </body>
</html>

