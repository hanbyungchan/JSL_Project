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
    <%@ include file = "../scripts.jsp"%>
    </head>
    <body>
    <form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
        <%@ include file = "../header.jsp"%>

        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>



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
                        <div class="game-title">${dto.getG_name()} Evaluation of the product</div>
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
                                <button class="button-delete" type="button" onclick="goDelete('${dto.getG_code()}')">Delete Review</button>
                                <button class="button-update" type="button" onclick="goUpdate('${dto.getG_code()}')">Update Review</button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <c:if test="${empty t_dtos}">
                <div class="empty-message"><span>nothing</span></div>
                </c:if>
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
