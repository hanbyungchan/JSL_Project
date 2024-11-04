<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript">
	function goConfirm() {
		gameConfirm.method = "post";
		gameConfirm.action = "Game?t_gubun=gameConfirm";
		gameConfirm.submit();
	}
	function goBack() {
		gameConfirm.t_gubun.value = "list";
		gameConfirm.method = "post";
		gameConfirm.action = "Game";
		gameConfirm.submit();
	}
</script>
<%@ include file = "../scripts.jsp"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Game_registration_confirm</title>

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/game_regist.css">
        <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="js/common.js"></script>
  	 	<script src="js/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <form name="game">
            <input type="hidden" name="t_gubun">
            <input type="hidden" name="t_pageNo">
            <input type="hidden" name="t_id">
            </form>
            <%@ include file = "../header.jsp"%>
            <div class="main-image">
                <img src="img/main-image.jpg" alt="메인 이미지">
            </div>
        
        <!-- ================================================================== -->	
        
        <form name = "gameConfirm">
        <input type = "hidden" name = "t_gubun">
            <section class="g_regist">
                <h2>Game Confirm</h2>
                <div class="formgroup">
                	<label for="game code">Game code(Auto)</label>
                	<div class="input-wrapper">
               	    	<input type = "text" name = "t_g_code" value = "${dto.getG_code()}"readonly>
               	    </div>
                 </div>
                 <div class="formgroup">
                    <label for="game title">Game Title</label>
                    <div class="input-wrapper">
                    	<input type = "text" name = "t_g_name" value = "${dto.getG_name()}">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="price">Price</label>
                    <div class="input-wrapper">
                    	<input type = "text" name = "t_g_price" value = "${dto.getG_price()}">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="developer">Developer</label>
                    <div class="input-wrapper">
                   		<input type = "text" name = "t_g_developer" value = "${dto.getG_developer()}" readonly>
                    </div>
                </div>
                <div class="formgroup">
                    <label for="game grade">Game Grade</label>
                    <div class="input-wrapper">
						<select name="t_g_grade">
						    <option value="EVERYONE" <c:if test="${dto.getG_grade() eq 'EVERYONE'}">selected</c:if>>EVERYONE</option>
						    <option value="EVERYONE 10+" <c:if test="${dto.getG_grade() eq 'EVERYONE 10+'}">selected</c:if>>EVERYONE 10+</option>
						    <option value="TEEN" <c:if test="${dto.getG_grade() eq 'TEEN'}">selected</c:if>>TEEN</option>
						    <option value="MATURE 17+" <c:if test="${dto.getG_grade() eq 'MATURE 17+'}">selected</c:if>>MATURE 17+</option>
						    <option value="ADULTS ONLY 18+" <c:if test="${dto.getG_grade() eq 'ADULTS ONLY 18+'}">selected</c:if>>ADULTS ONLY 18+</option>
						</select>
                    </div>
                </div>
                <div class="formgroup">
                    <label for="game download file">Game Download File</label><br>
                        <input id="file-upload" type="file" name="t_g_file" style="display: none;" onchange="updateFileName(this)">
    					<input type="text" id="file-name" value = "${dto.getG_file()}" readonly>
                </div>
                <br>
                <div class="button-container">
	                <input type = "button" onclick="goConfirm()" value = "Confirm" class="buttons">
	                <input type = "button" onclick="goBack()" value = "Cancel" class="buttons">
                </div>
            </section>
        </form>
<div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
<script src="js/main.js"></script>
    </body>
<%@ include file = "../footer.jsp"%>
    
</html>