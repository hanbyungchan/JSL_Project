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
    
    <%@ include file = "../scripts.jsp"%>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
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
                <th>이미지</th>
                <th>제목</th>
                <th>히트수</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td><img src="img/${dto.getS_page_no()}/${dto.getS_icon()}" alt="게임 로고"></td>
                    <td>HeroLand</td>
                    <td>12</td>
                </tr>
                <tr>
                    <td><img src="img/${dto.getS_page_no()}/${dto.getS_icon()}" alt="게임 로고"></td>
                    <td>아시아정보시스템</td>
                    <td>11</td>
                </tr>
                <tr>
                    <td><img src="img/${dto.getS_page_no()}/${dto.getS_icon()}" alt="게임 로고"></td>
                    <td>캬루주식회사</td>
                    <td>31</td>
                </tr>
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
    