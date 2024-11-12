<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>
        <link rel="stylesheet" href="css/tdingDetail.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet"/>
        <%@ include file = "../scripts.jsp"%>
        <script type="text/javascript">
        	function goUpdate() {
        		game.method="post";
        		game.action="Game?t_gubun=news_updateForm";
        		game.submit();
			}
        	function goDelete() {
        		if(confirm("Are you sure you want to delete it?")){
        			game.method="post";
            		game.action="Game?t_gubun=news_delete";
            		game.submit();
        		}
        		
			}
        </script>
    </head>
    <body>
    <form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	<input type="hidden" name="n_no" value="${dto.getN_no()}">
	</form>
        <%@ include file = "../header.jsp"%>
        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>
        <div class="container">
            <h1>${dto.getN_title()}</h1>
            <c:if test="${dto.getN_update_date() eq null }">
            <div class="author-date">${dto.getN_upload_date()} | Uploader: ${dto.getN_uploader()}</div>
            </c:if>
            <c:if test="${dto.getN_update_date() ne null }">
            <div class="author-date">${dto.getN_update_date()} | Uploader: ${dto.getN_uploader()}</div>
            </c:if>
            <div class="image-container">
                <img
                    src="img/summernote/${dto.getN_attach()}"
                    alt="섀도우 이미지 1"
                />
            </div>

            <p class="content">
                ${dto.getN_content()}
            </p>
            <c:if test="${sessionLevel eq '1' || sessionName eq dto.getN_uploader() }">
            <input type="button" class="styled-button" value="update" onclick="goUpdate()">
            <input type="button" class="styled-button" value="delete" onclick="goDelete()">
            </c:if>
        </div>
        <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
        </div>
        <script src="js/main.js"></script>
        <script src="js/main.js"></script>
        <%@ include file = "../footer.jsp"%>
    </body>
</html>