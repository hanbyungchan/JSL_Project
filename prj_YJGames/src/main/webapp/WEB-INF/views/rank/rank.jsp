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
    <title>JSL Games</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <!-- CSS 연동 -->
    <link rel="stylesheet" href="css/styles.css">
     <link rel="stylesheet" href="css/ranking.css">
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- 구글 Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    function goView(s_no) {
		game.method="post";
		game.action="Game?t_gubun=view&t_pageNo="+s_no;
		game.submit();
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
    
<div class="ranking-container">
    <table>
    	 <colgroup>
            <col style="width: 20%;">
            <col style="width: 60%;">
            <col style="width: 20%;">
        </colgroup>
        <thead>
            <tr>
                <th>ICON</th>
                <th>TITLE</th>
                <th>PURCHASE</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${dtos}" var = "dto">
        	
        		<tr>
        		
                    <td><img src="img/${dto.getG_code()}/${dto.getG_img()}" alt="게임 로고"></td>
                    <td><a href="javascript:goView('${dto.getG_code()}')" class="no-link" >${dto.getG_name()}</a></td>
                    <td>${dto.getG_downloaded()}</td>
                    
                </tr>
                
        	</c:forEach>
             <style>
  .no-link {
    text-decoration: none;
    color: white;  /* 원하는 색상으로 변경 가능 */
  }
</style>
                <!-- 
                <tr>
                    <td><img src="img/2/1.jpg" alt="게임 로고"></td>
                    <td>아시아정보시스템</td>
                    <td>11</td>
                </tr>
                <tr>
                    <td><img src="img/3/1.jpg" alt="게임 로고"></td>
                    <td>캬루주식회사</td>
                    <td>31</td>
                </tr>
                 -->
        </tbody>
    </table>
</div>


<div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
    <script src="js/main.js"></script> 
    <script src="js/ranking.js"></script>

</body>
</html>
<%@ include file = "../footer.jsp"%>
    