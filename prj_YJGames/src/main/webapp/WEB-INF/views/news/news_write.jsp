<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>뉴스등록</title>
          <link rel="stylesheet" href="css/styles.css" />
          <link rel="stylesheet" href="css/NewsWrite.css" />
            <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스 등록</title>
    <!-- 서머노트-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/summernote-lite.js"></script>
<script src="js/getsummernote.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
<link href="css/summernote-lite.css" rel="stylesheet" >
<!-- 서머노트-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> <!-- Google Fonts -->
<script>
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
      url: "SummerNote?t_noteGubun=news",
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
//		console.log("====console.log url============="+url);
		$(el).summernote('editor.insertImage', "../attach/summernote_notice/"+url);
      }
    });
  }
}); 
</script>
</head>
<body>
 <header class="header" id="header">
            <div class="header-content">
                <div class="logo">
                   <img src="img/main-image.jpg" alt="메인 이미지">
                </div>
                <nav class="menu" id="menu">
                    <ul>
                        <li><a href="#">STORE</a></li>
                        <li><a href="#">COMMUNITY</a></li>
                        <li><a href="#">SUPPORT</a></li>
                        <li><a href="#">Ex</a></li>
                        <li><a href="#">SIGN IN</a></li>
                    </ul>
                </nav>
                <div class="icons">
                    <a href="#"><i class="fas fa-search"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </div>
            </div>
       
     </header>
     



    <div class="container">
        <h1>News Write</h1>
        <form action="NewsRegisterServlet" method="post">
        

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required placeholder="Please enter the news title">
            </div>

            <div class="form-group">
                <label for="content">Content:</label>
                <div id="summernote" class="summernote"></div>
            </div>
			<div class="form-group" style="text-align: center; margin: auto;">
			    <button type="submit" class="btn">Registration</button>
			    <button type="button" class="btn cancel-btn" onclick="">Cancel</button>
			</div>
			
            
        </form>
    </div>
</body>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/main-image.jpg" alt="메인 이미지">
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