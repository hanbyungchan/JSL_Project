<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>리뷰 작성</title>

        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/review_write.css" />
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
    		game.action="Game?t_gubun=myreview";
    		game.submit();
		}
    	function goUpdate() {
    		if(game.t_r_recommand.value== ""){alert("Please select"); return;}
    		game.method="post";
    		game.action="Game?t_gubun=review_update";
    		game.submit();
		}
    </script>
    </head>
    <body>
    	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo" value="${t_dto.getS_page_no()}">
	<input type="hidden" name="t_u_id" value="${sessionId}">
	<input type="hidden" name="t_r_recommand" >
	<input type="hidden" name="t_id">
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
        <div class="review-container-top">
            <div class="review-img">
                <span class="img">
                    <img src="img/${t_dto.getS_page_no()}/1.jpg" alt="게임 이미지" />
                </span>
            </div>
            <div class="review-container">
                <div class="game-title">${t_dto.getS_game_name()} Write a review of the Game</div>
                <div class="author-name">Reviewer: ${sessionName}</div>
                <textarea name="t_r_txt" placeholder="리뷰를 작성하세요..." >${t_dto2.getR_txt()}</textarea>
                <div class="submit-container">
                    <div class="rating-container">
                        <!-- 밑에 테스트 스크립트 있음-->
                        <!-- 긍정평가 이미지 (value: good) -->
                        <img src="img/good.png" alt="Positive Review" id="positive" data-value="g" />
                        <!-- 부정평가 이미지 (value: bad) -->
                        <img src="img/bad.png" alt="Negative Review" id="negative" data-value="b" />
                    </div>
                    <button type="button" onclick="goUpdate()">리뷰 수정</button>
                    <button type="button" onclick="goReview()">go Back</button>
                </div>
            </div>
        </div>
			</form>
        <script>
            // 이미지 클릭 시 선택 처리 및 선택된 값 저장
            const positiveImg = document.getElementById('positive');
            const negativeImg = document.getElementById('negative');
            let selectedValue = '';

            positiveImg.addEventListener('click', function () {
                positiveImg.classList.add('selected');
                negativeImg.classList.remove('selected');
                selectedValue = positiveImg.getAttribute('data-value'); // "good" 값 저장
                game.t_r_recommand.value = selectedValue;
            });

            negativeImg.addEventListener('click', function () {
                negativeImg.classList.add('selected');
                positiveImg.classList.remove('selected');
                selectedValue = negativeImg.getAttribute('data-value'); // "bad" 값 저장
                game.t_r_recommand.value = selectedValue;
            });

            // 리뷰 제출 시 선택된 평가 값 확인 테스트
            /*
            function submitReview() {
                if (selectedValue) {
                    alert('선택된 평가는: ' + selectedValue);
                } else {
                    alert('평가를 선택해주세요.');
                }
            }
            */
        </script>
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

