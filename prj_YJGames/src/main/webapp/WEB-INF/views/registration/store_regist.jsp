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
<%@ include file = "../scripts.jsp"%>
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
  	 	<!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <form name="game">
            <input type="hidden" name="t_gubun">
            <input type="hidden" name="t_s_pageNo">
            <input type="hidden" name="t_id">
            </form>
           <%@ include file = "../header.jsp"%>
            <div class="main-image">
                <img src="img/main-image.jpg" alt="메인 이미지">
            </div>
        
        <!-- ================================================================== -->	
        
        <form name = "store_regi" enctype="multipart/form-data">
        <input type = "hidden" name = "t_gubun">
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
				    <input type="file" name="t_s_img_main" id="file-upload-main" style="display: none;" onchange="updateFileName(this, 'file-name-main')">
				    <input type="text" id="file-name-main" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-main').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_img_1">Game IMG 1</label><br>
				    <input type="file" name="t_s_img_1" id="file-upload-1" style="display: none;" onchange="updateFileName(this, 'file-name-1')">
				    <input type="text" id="file-name-1" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-1').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_img_2">Game IMG 2</label><br>
				    <input type="file" name="t_s_img_2" id="file-upload-2" style="display: none;" onchange="updateFileName(this, 'file-name-2')">
				    <input type="text" id="file-name-2" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-2').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_img_3">Game IMG 3</label><br>
				    <input type="file" name="t_s_img_3" id="file-upload-3" style="display: none;" onchange="updateFileName(this, 'file-name-3')">
				    <input type="text" id="file-name-3" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-3').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_icon">Game Icon</label><br>
				    <input type="file" name="t_s_icon" id="file-upload-icon" style="display: none;" onchange="updateFileName(this, 'file-name-icon')">
				    <input type="text" id="file-name-icon" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-icon').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_video_1">Game Video 1</label><br>
				    <input type="file" name="t_s_video_1" id="file-upload-video-1" style="display: none;" onchange="updateFileName(this, 'file-name-video-1')">
				    <input type="text" id="file-name-video-1" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-video-1').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_video_2">Game Video 2</label><br>
				    <input type="file" name="t_s_video_2" id="file-upload-video-2" style="display: none;" onchange="updateFileName(this, 'file-name-video-2')">
				    <input type="text" id="file-name-video-2" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-video-2').click();">Choose File</button>
				</div>
				
				<div class="formgroup">
				    <label for="game_video_3">Game Video 3</label><br>
				    <input type="file" name="t_s_video_3" id="file-upload-video-3" style="display: none;" onchange="updateFileName(this, 'file-name-video-3')">
				    <input type="text" id="file-name-video-3" placeholder="No file chosen" readonly>
				    <button type="button" onclick="document.getElementById('file-upload-video-3').click();">Choose File</button>
				</div>

<script>
function updateFileName(input, fileNameId) {
    const fileName = input.files.length > 0 ? input.files[0].name : "No file chosen";
    document.getElementById(fileNameId).value = fileName;
}
</script>
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