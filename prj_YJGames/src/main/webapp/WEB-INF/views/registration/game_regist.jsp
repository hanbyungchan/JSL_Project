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
		if(checkValue(regi.t_genre_code,"Please check genre at least 1")) return;
		
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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Game_registration</title>

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
            <input type="hidden" name="t_pageNo">
            <input type="hidden" name="t_id">
            </form>
            <header class="header" id="header">
            <div class="header-content">
                <div class="logo">
                    <img src="img/logo.png" alt="사이트 로고" href="Game">
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
        
        <form name = "regi" enctype="multipart/form-data">
        	<input type = "hidden" name = "t_gubun">
            <div class="g_regist">
                <h2>Game Registration</h2>
                <tr>
                	<th>Game code(Auto)</th>
                    <td>
               	    	<input type = "text" name = "t_g_code"  value = "${g_code}"readonly>
                    </td>
                 </tr>
                 <br>
                 <tr>
                    <th>Game Title</th>
                    <td>
                        <input type = "text" name = "t_g_name">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Price</th>
                    <td>
                        <input type = "text" name = "t_g_price">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Developer</th>
                    <td>
                        <input type = "text" name = "t_g_developer" value = "${sessionName}" readonly>
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Grade</th>
                    <td>
                    	<select name = "t_g_grade">
                    		<option value = "EVERYONE">EVERYONE</option>
                    		<option value = "EVERYONE 10+">EVERYONE 10+</option>
                    		<option value = "TEEN">TEEN</option>
                    		<option value = "MATURE 17+">MATURE 17+</option>
                    		<option value = "ADULTS ONLY 18+">ADULTS ONLY 18+</option>
                    	</select>
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Download File</th>
                    <td>
                        <input type = "file" name = "t_g_file">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Genre</th>
                    	<td>
                    <c:forEach items="${dtos}" var = "dto">
                    	<label>
                    		${dto.genre_name}<input type = "checkbox" name = "t_genre_code" value = "${dto.genre_code}">
                    	</label>
                    </c:forEach>
                    	</td>
                </tr>
                <br>
                <input type = "button" onclick="goRegi()" value = "Registration">
                <input type = "button" onclick="goBack()" value = "Cancel">
            </div>
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