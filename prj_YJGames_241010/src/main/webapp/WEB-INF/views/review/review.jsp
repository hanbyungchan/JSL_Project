<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/review.css" />
		
        <!-- Font Awesome 아이콘 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    	<script type="text/javascript">
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
    	function goUpdate() {
    		game.method="post";
    		game.action="Game?t_gubun=review_updateform";
    		game.submit();
		}
    	function goDelete() {
    		if(confirm("Are you sure you want to delete it?")){
    			game.t_gubun.value="review_delete";
    			game.method="post";
        		game.action="Game";
        		game.submit();
    		}
		}
    </script>
    <%@ include file = "../scripts.jsp"%>
    </head>
    <body>
        <%@ include file = "../header.jsp"%>
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
			<input type="hidden" name="t_pageNo" value ="${t_dto.getS_page_no()}">
        <div class="review-container">
            <h1>${t_dto.getS_game_name()}</h1>
            <div class="review-section">
                <label for="review">Select Review Evaluation:</label>
                <select id="review" name="t_review_option">
                	<option value="recent" <c:if test="${t_review_option eq 'recent'}">selected</c:if>>recent</option>
                    <option value="old" <c:if test="${t_review_option eq 'old'}">selected</c:if>>old</option>
                    <option value="good" <c:if test="${t_review_option eq 'good'}">selected</c:if>>good</option>
                    <option value="bad" <c:if test="${t_review_option eq 'bad'}">selected</c:if>>bad</option>
                </select>
            </div>
            <button class="submit-btn" onclick="goSearch()">Search for Reviews</button>
             <c:if test="${t_dto2 eq null}">
            <button class="submit-btn" onclick="goWrite()">Wrtie Review</button>
			</c:if>
            <!-- 예시 리뷰 -->
            <div class="review-list">
            <c:if test="${t_dto2 ne null}">
            <div class="review-item">
                <div class="rating-container">
                <c:if test="${t_dto2.getR_recommand() eq 'g'}"><img src="img/good.png" alt="Positive Review" id="positive" /></c:if>
                <c:if test="${t_dto2.getR_recommand() eq 'b'}"><img src="img/bad.png" alt="Negative Review" id="negative" /></c:if>  
                 </div>   
                    <p>
                        ${t_dto2.getR_txt()}
                    </p>
                    <div class="divider"></div>
                    <!-- 구분선 -->
                    <div class="user-name"><a href="#">-Me</a></div>
                    <div>
                    	<button class="button-delete" type="button" onclick="goDelete()">Delete Review</button>
                    	<button class="button-update" type="button" onclick="goUpdate()">Update Review</button>
                    </div>
                    <!-- 유저 이름 -->
                </div>
                </c:if>
            <c:forEach items="${t_dtos}" var = "dto">
                <div class="review-item">
                <div class="rating-container">
                <c:if test="${dto.getR_recommand() eq 'g'}"><img src="img/good.png" alt="Positive Review" id="positive" /></c:if>
                <c:if test="${dto.getR_recommand() eq 'b'}"><img src="img/bad.png" alt="Negative Review" id="negative" /></c:if>  
                 </div>   
                    <p>
                        ${dto.getR_txt()}
                    </p>
                    <div class="divider"></div>
                    <!-- 구분선 -->
                    <div class="user-name"><a href="#">-${dto.getU_name()}</a></div>
                    <!-- 유저 이름 -->
                </div>
			</c:forEach>
            </div>
        </div>
                </form>
                <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
    </body>
</html>
<%@ include file = "../footer.jsp"%>
