<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Store_registration</title>

        <!-- CSS 연동 -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/game_regist.css">
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
        
        <form name = "game_regi" enctype="multipart/form-data">
            <div class="g_regist">
                <h2>Store Registration</h2>
                        <input type = "hidden" name = "t_s_page_no">
                <tr>
                    <th>Game Name</th>
                    <td>
                        <select name="t_s_game_name" id="">
                            <option>Monster Hunter</option>
                        </select>
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Info</th>
                    <td>
                        <textarea name = "s_info_txt">textarea</textarea>
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Release Date</th>
                    <td>
                        <input type = "text" name = "t_s_date">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Sale</th>
                    <td>
                        <input type = "text" name = "t_s_sale">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Requirment OS</th>
                    <td>
                        <input type = "text" name = "t_s_spec_1">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Requirment CPU</th>
                    <td>
                        <input type = "text" name = "t_s_spec_2">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Requirment RAM</th>
                    <td>
                        <input type = "text" name = "t_s_spec_3">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Requirment GPU</th>
                    <td>
                        <input type = "text" name = "t_s_spec_4">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Requirment Storage</th>
                    <td>
                        <input type = "text" name = "t_s_spec_5">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game IMG Main</th>
                    <td>
                        <input type = "file" name = "t_s_img_main">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game IMG 1</th>
                    <td>
                        <input type = "file" name = "t_img_1">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game IMG 2</th>
                    <td>
                        <input type = "file" name = "t_img_2">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game IMG 3</th>
                    <td>
                        <input type = "file" name = "t_img_3">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Icon</th>
                    <td>
                        <input type = "file" name = "t_icon">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Video 1</th>
                    <td>
                        <input type = "file" name = "t_s_video_1">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Video 2</th>
                    <td>
                        <input type = "file" name = "t_s_video_2">
                    </td>
                </tr>
                <br>
                <tr>
                    <th>Game Video 3</th>
                    <td>
                        <input type = "file" name = "t_s_video_3">
                    </td>
                </tr>
                <br>
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