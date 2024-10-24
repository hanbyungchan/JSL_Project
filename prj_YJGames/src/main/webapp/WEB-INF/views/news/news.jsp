<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>


<html lang="ko">
    <head>
    
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>JSL Games</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/tdings.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    	<script type="text/javascript">
		function goNewsView(no){
			news.n_no.value=no;
			news.method="post";
			news.action="NewsView";
			news.submit();
		}
</script>
<%@ include file = "../scripts.jsp"%>
    </head>
    <body>
    <form name="news">
    	<input type="hidden" name="n_no">
    </form>
    <form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
        <%@ include file = "../header.jsp"%>
        <div class="main-image">
            <img src="img/main-image.jpg" alt="메인 이미지" />
        </div>
        <div class="container">
            <h1>JSL Games news</h1>
            <section class="first-section">
             <c:forEach items="${dtos}" var = "dto" varStatus="status">
             <c:if test="${status.index < 1}">
                <div class="large-image">
                        <img src="img/${dto.getN_no()}/${dto.getN_attach()}" alt="" />
                        <a href="javascript:goNewsView('${dto.getN_no()}')">
                    <div class="image-text">
                        <h2>${dto.getN_title()}</h2>
                        <p class="clamped">${dto.getN_content()}</p>
                    </div>
                    </a>
                </div>
                </c:if>
             </c:forEach>
            </section>

            <section class="second-section">
                <ul style="te">
                    <c:forEach items="${dtos}" var = "dto">
                    <li>
                        <a href="javascript:goNewsView('${dto.getN_no()}')">
                            <h3>${dto.getN_title()}</h3>
                            <p>
							    <c:choose>
							        <c:when test="${fn:length(dto.getN_content()) > 100}">
							            ${fn:substring(dto.getN_content(), 0, 100)}...
							        </c:when>
							        <c:otherwise>
							            ${dto.getN_content()}
							        </c:otherwise>
							    </c:choose>
							</p>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </section>
        </div>
        <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
        <script src="js/main.js"></script>
    </body>
    <%@ include file = "../footer.jsp"%>
</html>