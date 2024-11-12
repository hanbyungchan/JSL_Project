<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
function goSave() {
	if(game.t_title.value == ""){alert("Please enter Title!");game.t_title.focus();return;}
	if(game.n_content.value == ""){alert("Please enter Content!");game.n_content.focus();return;}
	var fileName = game.t_g_file.value;
	if(fileName != "") {
		var pathFileName = fileName.lastIndexOf(".")+1;
		var extension = (fileName.substr(pathFileName)).toLowerCase();
		if(extension != "jpg" && extension != "txt" && extension != "png") {
			alert(extension + "Format files are not uploaded. Only available in JPG, TXT, PNG, and files!");
			return;
		}
	}
	var file = game.t_g_file;
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
	game.method="post";
	game.action="Game?t_gubun=news_update";
	game.submit();
}
function goBack() {
    window.history.back();
}
</script>
<html>
<head>
    <title>JSL Games</title>
          <link rel="stylesheet" href="css/styles.css" />
          <link rel="stylesheet" href="css/NewsWrite.css" />
            <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> <!-- Google Fonts -->
<!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	    <!-- 서머노트
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/summernote-lite.js"></script>
<script src="js/getsummernote.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
<link href="css/summernote-lite.css" rel="stylesheet" >
서머노트-->
	<%@ include file = "../scripts.jsp"%>
<script>
<!--
$(document).ready(function() {
    $('#summernote').summernote({
      width:800,	
      height: 500,
      minHeight: null,
      maxHeight: null,
      focus: true,
      callbacks: {
        onImageUpload: function(files, editor, welEditable) {
          for (var i = files.length - 1; i >= 0; i--) {
            sendFile(files[i], this);
          }
        }
      }
    });
  function sendFile(file, el) {
    var form_data = new FormData();
    form_data.append('file', file);
 //   console.log(' file : ',file.name);
    $.ajax({
      data: form_data,
      type: "POST",
      url: "SummerNote",
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
		$(el).summernote('editor.insertImage', "img/summernote/"+url);
      }
    });
  }
}); 
function goSave() {
	if(game.t_title.value == ""){alert("Please enter Title!");game.t_title.focus();return;}
	var summerContent = $('#summernote').summernote('code');
	game.n_content.value = summerContent;
	game.method="post";
	game.action="Game?t_gubun=news_save";
	game.submit();
}

<div id="summernote" class="summernote"></div>
-->
</script>

</head>
<body>
 <%@ include file = "../header.jsp"%>
    <div class="container">
        <h1>News Write</h1>
        <form name= "game" enctype="multipart/form-data">
        <input type="hidden" name="t_gubun">
		<input type="hidden" name="t_pageNo">
		<input type="hidden" name="t_id">
        <input type="hidden" name="g_code" value="${dto.getG_code()}">
        <input type="hidden" name="n_no" value="${dto.getN_no()}">
        <input type="hidden" name="ori_attach" value="${dto.getN_attach()}">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="t_title" value="${dto.getN_title()}" required placeholder="Please enter the news title">
            </div>
            <div class="form-group">
            
                <label for="content">Content:</label>
                <textarea id="content" name="n_content" rows="10" required placeholder="Please enter the news content">${dto.getN_content()}</textarea>
            </div>
            <div class="formgroup">
                    <label for="game download file">News attach File</label><br>
                        <input id="file-upload" type="file" name="t_g_file" style="display: none;" onchange="updateFileName(this)">
                        
    					<input type="text" id="file-name" placeholder="<c:if test="${dto.getN_attach() eq null}">No file chosen</c:if>
    					 <c:if test="${dto.getN_attach() ne null}">${dto.getN_attach()}</c:if>" readonly>
    					<button type="button" onclick="document.getElementById('file-upload').click();">Choose File</button>
		<script>
		function updateFileName(input) {
    		const fileName = input.files.length > 0 ? input.files[0].name : "No file chosen";
    		document.getElementById("file-name").value = fileName;
		}
		</script>
                </div>
			<div class="form-group" style="text-align: center; margin: auto;">
			    <button type="button" class="btn" onclick="goSave()">Registration</button>
			    <button type="button" class="btn cancel-btn" onclick="goBack()">Cancel</button>
			</div>
        </form>
        <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
    </div>
    <script src="js/main.js"></script>
</body>
<%@ include file = "../footer.jsp"%>
</html>