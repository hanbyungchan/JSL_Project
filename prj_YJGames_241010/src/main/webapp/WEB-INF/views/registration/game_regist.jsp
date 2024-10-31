<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript">
	function goRegi() {
		if(checkValueLength(regi.t_g_name,3,80,"Please enter Title", "Title is more than 3 and less than 80")) return;
		if(checkValue(regi.t_g_price,"Enter 0 if it's free")) return;
		if(checkValue(regi.t_g_developer,"Please enter Developer")) return;
		
		var fileName = regi.t_g_file.value;
		if(fileName != "") {
			var pathFileName = fileName.lastIndexOf(".")+1;
			var extension = (fileName.substr(pathFileName)).toLowerCase();
			if(extension != "jpg" && extension != "txt" && extension != "png") {
				alert(extension + "Format files are not uploaded. Only available in JPG, TXT, PNG, and files!");
				return;
			}
		}
		var file = regi.t_g_file;
		var fileMaxSize = 100;
		if(file.value != "") {
			var maxSize = 1024 * 1024 * fileMaxSize;
			var fileSize = 0;
			var browser = navigator.appName;
			if(browser == "Microsoft Internet Explorer") {
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			} else {
				fileSize = file.files[0].size;
			}

		}
		const checkboxes = document.querySelectorAll('input[name="t_genre_code"]');
        let isChecked = false;
        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                isChecked = true;
            }
        });
        if (!isChecked) {alert('체크박스 중 하나 이상 선택해야 합니다!'); return;}
		regi.method = "post";
		regi.action = "Game?t_gubun=gameRegist";
		regi.submit();
	}
	function goBack() {
		regi.t_gubun.value = "list";
		regi.method = "post";
		regi.action = "Game";
		regi.submit();
	}
</script>
<%@ include file = "../scripts.jsp"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Game_registration</title>

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
        
        <form name = "regi" enctype="multipart/form-data">
        <input type = "hidden" name = "t_gubun">
            <section class="g_regist">
                <h2>Game Registration</h2>
                <div class="formgroup">
                	<label for="game code">Game code(Auto)</label>
                	<div class="input-wrapper">
               	    	<input type = "text" name = "t_g_code"  value = "${g_code}"readonly>
               	    </div>
                 </div>
                 <div class="formgroup">
                    <label for="game title">Game Title</label>
                    <div class="input-wrapper">
                    	<input type = "text" name = "t_g_name">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="price">Price</label>
                    <div class="input-wrapper">
                    	<input type = "text" name = "t_g_price">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="developer">Developer</label>
                    <div class="input-wrapper">
                   		<input type = "text" name = "t_g_developer" value = "${sessionName}" readonly>
                    </div>
                </div>
                <div class="formgroup">
                    <label for="game grade">Game Grade</label>
                    <div class="input-wrapper">
	                    <select name = "t_g_grade">
	                    	<option value = "EVERYONE">EVERYONE</option>
	                    	<option value = "EVERYONE 10+">EVERYONE 10+</option>
	                    	<option value = "TEEN">TEEN</option>
	                    	<option value = "MATURE 17+">MATURE 17+</option>
	                    	<option value = "ADULTS ONLY 18+">ADULTS ONLY 18+</option>
	                    </select>
                    </div>
                </div>
                <div class="formgroup">
                    <label for="game download file">Game Download File</label><br>
                        <input id="file-upload" type="file" name="t_g_file" style="display: none;" onchange="updateFileName(this)">
    					<input type="text" id="file-name" placeholder="No file chosen" readonly>
    					<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
<script>
function updateFileName(input) {
    const fileName = input.files.length > 0 ? input.files[0].name : "No file chosen";
    document.getElementById("file-name").value = fileName;
}
</script>
                </div>
                <div class="formgroup">
                    <label for="game genre">Game Genre</label>
                    <div class="genre-options">
	                    <c:forEach items="${dtos}" var = "dto">
	                    	<label>
	                    		${dto.genre_name}<input type = "checkbox" name = "t_genre_code" value = "${dto.genre_code}">
	                    	</label>
	                    </c:forEach>
                    </div>
                </div>
                <br>
                <div class="button-container">
	                <input type = "button" onclick="goRegi()" value = "Registration" class="buttons">
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