<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript">
	function goRegi() {
		if(checkValueLength(store_regi.t_s_info_txt,3,2500,"Please enter Info", "Info is more than 3 and less than 2500")) return;
		if(checkValue(store_regi.t_s_date,"Please enter release date")) return;
		if(checkValue(store_regi.t_s_sale,"Enter 0 if you don't give a discount")) return;
		if(checkValue(store_regi.t_s_spec_1,"Enter required OS specifications")) return;
		if(checkValue(store_regi.t_s_spec_2,"Enter required CPU specifications")) return;
		if(checkValue(store_regi.t_s_spec_3,"Enter required RAM specifications")) return;
		if(checkValue(store_regi.t_s_spec_4,"Enter required GPU specifications")) return;
		if(checkValue(store_regi.t_s_spec_5,"Enter required Storage specifications")) return;
		
		var RamValue = store_regi.t_s_spec_3.value;
		if (RamValue) {
		       store_regi.t_s_spec_3.value = ramValue + " GB RAM"; // " GB RAM" 추가
		   }
		var StorageValue = store_regi.t_s_spec_5;
		if (StorageValue) {
		       store_regi.t_s_spec_5.value = StorageValue + " GB available space"; // " GB RAM" 추가
		   }		
		 var fileElements = [
             store_regi.t_s_img_main,
             store_regi.t_s_img_1,
             store_regi.t_s_img_2,
             store_regi.t_s_img_3,
             store_regi.t_s_icon
         ];

         // 각 파일에 대해 유효성 검사 실행
         for (var i = 0; i < fileElements.length; i++) {
             var file = fileElements[i];
             if (!validateFile(file, 100)) {
                 return; // 유효성 검사 실패 시 함수 종료
             }
         }

         // 폼 제출 로직
         store_regi.method = "post";
         store_regi.action = "Game?t_gubun=storeRegist";
         store_regi.submit();
     }

     function validateFile(file, maxFileSizeMB) {
         if (file.files.length > 0) { // 파일이 선택되었는지 확인
             var fileName = file.files[0].name; // 선택된 파일의 이름 가져오기
             var extension = fileName.split('.').pop().toLowerCase(); // 확장자 추출

             console.log("Validating file: ", fileName);
             console.log("File extension: ", extension);

             if (extension != "jpg") {
                 alert(extension + " Format files are not uploaded. Only available in JPG");
                 return false;
             }

             var maxSize = 1024 * 1024 * maxFileSizeMB; // 최대 사이즈 계산
             var fileSize = file.files[0].size; // 파일 크기 가져오기
             console.log("File size: ", fileSize);

             if (fileSize > maxSize) {
                 alert("File size exceeds " + maxFileSizeMB + "MB limit.");
                 return false;
             }
         } else {
             alert("No file selected for " + file.name); // 파일이 선택되지 않은 경우
             return false;
         }
         return true;
     }


	function goBack() {
		store_regi.t_gubun.value = "list";
		store_regi.method = "post";
		store_regi.action = "Game";
		store_regi.submit();
	}
	
	
</script>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Store_registration</title>

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/game_regist.css">
        <script src="js/common.js"></script>
  	 	<script src="js/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <form name="game">
            <input type="hidden" name="t_gubun">
            <input type="hidden" name="t_s_pageNo">
            <input type="hidden" name="t_id">
            </form>
            <header class="header" id="header">
            <div class="header-content">
                <div class="logo">
                    <img src="img/logo.png" alt="사이트 로고" href="">
                </div>
                
        <nav class="menu" id="menu">
            <ul>
                <li class="store-menu">
                    <a href="Game">STORE</a>
                    <ul class="category-dropdown">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">RPG</a></li>
                        <li><a href="#">Sports</a></li>
                        <li><a href="#">Adventure</a></li>
                    </ul>
                </li>
                <li><a href="#">COMMUNITY</a></li>
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
                    <a href="#" id="search-icon"><i class="fas fa-search"></i></a>
                    <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
                </div>
            </nav>
                
                
            </div>
            </header>
        
            <div class="main-image">
                <img src="img/main-image.jpg" alt="메인 이미지">
            </div>
        
        <!-- ================================================================== -->	
        
        <form name = "store_regi" enctype="multipart/form-data">
            <section class="g_regist">
                <h2>Store Registration</h2>
                <input type = "hidden" name = "t_s_page_no" value = "${s_page_no}">
                <div class="formgroup">
                    <label for="game name">Game Name</label>
      				<div class="input-wrapper">
       					<select name="t_s_game_name">
            				<c:choose>
                				<c:when test="${not empty dtos}">
                    				<c:forEach items="${dtos}" var="dto">
                        				<option value="${dto.g_code},${dto.g_name}">${dto.g_name}</option>
                    				</c:forEach>
               					</c:when>
                				<c:otherwise>
                    				<option value="">There are no games to register</option>
                				</c:otherwise>
            				</c:choose>
        				</select>
    				</div>
                </div>
                <div class="formgroup">
                    <label for="info">Info</label>
                    <div class="input-wrapper">
                        <textarea name = "t_s_info_txt" class="textarea"></textarea>
                    </div>
                </div>
                <div class="formgroup">
                    <label for="release date">Release Date</<label>
                    <div class="input-wrapper">
                        <input type = "text" name = "t_s_date" placeholder="20230325">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="sale">Sale</<label>
                    <div class="input-wrapper">
                        <input type = "text" name = "t_s_sale">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="os">Requirment OS</label>
                    <div class="input-wrapper">
                    	<select name = "t_s_spec_1">
                    		<option value = "Window xp/vista">Window xp/vista</option>
                    		<option value = "Window 7/vista">Window 7/vista</option>
                    		<option value = "Window 10/8/7">Window 10/8/7</option>
                    		<option value = "Window 10 64 bit">Window 10 64 bit</option>
                    		<option value = "Window 11/10">Window 11/10</option>
                    		<option value = "Window 11/10 64 bit">Window 11/10 64 bit</option>
                    	</select>
                    </div>
                </div>
                <div class="formgroup">
                    <label for="cpu">Requirment CPU</label>
                    <div class="input-wrapper">
                        <input type = "text" name = "t_s_spec_2">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="ram">Requirment RAM</label>
                    <div class="input-wrapper">
                        <input type = "text" name = "t_s_spec_3"> GB RAM
                    </div>
                </div>
                <div class="formgroup">
                    <label for="gpu">Requirment GPU</label>
                    <div class="input-wrapper">
                        <input type = "text" name = "t_s_spec_4">
                    </div>
                </div>
                <div class="formgroup">
                    <label for="storage">Requirment Storage</label>
                    <div class="input-wrapper">
                        <input type = "text" name = "t_s_spec_5"> available space
                    </div>
                </div>
                <div class="formgroup">
                    <label for="game_img_main">Game IMG Main</label><br>
                    <input type = "file" name = "t_s_img_main" id="file-upload" style="display: none;" onchange="updateFileName(this)">
                    <input type="text" id="file-name" placeholder="No file chosen" readonly>
    				<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_img_1">Game IMG 1</label><br>
                    <input type = "file" name = "t_s_img_1" id="file-upload" style="display: none;" onchange="updateFileName(this)">
                    <input type="text" id="file-name" placeholder="No file chosen" readonly>
                    <button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_img_2">Game IMG 2</label><br>
                    <input type = "file" name = "t_s_img_2" id="file-upload" style="display: none;" onchange="updateFileName(this)">
                    <input type="text" id="file-name" placeholder="No file chosen" readonly>
                    <button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_img_3">Game IMG 3</label><br>
                    <input type = "file" name = "t_s_img_3" id="file-upload" style="display: none;" onchange="updateFileName(this)">
                    <input type="text" id="file-name" placeholder="No file chosen" readonly>
    				<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_icon">Game Icon</label><br>
                    <input type = "file" name = "t_s_icon" id="file-upload" style="display: none;" onchange="updateFileName(this)">
					<input type="text" id="file-name" placeholder="No file chosen" readonly>
    				<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_video_1">Game Video 1</label><br>
					<input type = "file" name = "t_s_video_1" id="file-upload" style="display: none;" onchange="updateFileName(this)">
					<input type="text" id="file-name" placeholder="No file chosen" readonly>
    				<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_video_2">Game Video 2</label><br>
					<input type = "file" name = "t_s_video_2" id="file-upload" style="display: none;" onchange="updateFileName(this)">
					<input type="text" id="file-name" placeholder="No file chosen" readonly>
    				<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
                <div class="formgroup">
                    <label for="game_video_3">Game Video 3</label><br>
                    <input type = "file" name = "t_s_video_3" id="file-upload" style="display: none;" onchange="updateFileName(this)">
                    <input type="text" id="file-name" placeholder="No file chosen" readonly>
    				<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
                </div>
<script>
function updateFileName(input) {
    const fileName = input.files.length > 0 ? input.files[0].name : "No file chosen";
    document.getElementById("file-name").value = fileName;
}
</script>                
                <div class="button-container">
                <input type = "button" onclick="goRegi()" value = "Registration" class="buttons">
                <input type = "button" onclick="goBack()" value = "Cancel" class="buttons">
                </div>
            </section>
        </form>



    </body>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-logo">
                <img src="img/logo.png" alt="사이트 로고">
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
    
</html>