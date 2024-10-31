<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/review_write.css" />
        <script type="text/javascript">
    	function goUpdate() {
    		if(game.t_r_recommand.value== ""){alert("Please select"); return;}
    		game.method="post";
    		game.action="Game?t_gubun=review_update";
    		game.submit();
		}
    	</script>
    	<%@ include file = "../scripts.jsp"%>
    </head>
    <body>
    	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_r_recommand" >
	<input type="hidden" name="t_pageNo" value="${t_dto.getS_page_no()}">
        <%@ include file = "../header.jsp"%>

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
                <textarea name="t_r_txt" placeholder="Write Review..." >${t_dto2.getR_txt()}</textarea>
                <div class="submit-container">
                    <div class="rating-container">
                        <!-- 밑에 테스트 스크립트 있음-->
                        <!-- 긍정평가 이미지 (value: good) -->
                        <img src="img/good.png" alt="Positive Review" id="positive" data-value="g" />
                        <!-- 부정평가 이미지 (value: bad) -->
                        <img src="img/bad.png" alt="Negative Review" id="negative" data-value="b" />
                    </div>
                    <button type="button" onclick="goUpdate()">Update Review</button>
                    <button type="button" onclick="window.history.back()">go Back</button>
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
        </script>
        <script src="js/main.js"></script>
    </body>
</html>
<%@ include file = "../footer.jsp"%>