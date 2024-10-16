<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>게임 라이브러리</title>
        <link rel="stylesheet" href="css/Library.css" />
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/gamesearch.css" />
        <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        function performSearch() {
            //걍 만들어봄 헷갈리면 지워 검색버튼 누르면 진행되는건데  빈칸이면 alert뜨게함
            const query = document.getElementById('search-input').value;
            if (query) {
                // 여기에 실제 검색 기능을 구현하면 됩니다.
                console.log('검색어:', query);
                // 예: location.href = "/search?query=" + query; (검색 페이지로 이동)
            } else {
                alert('검색어를 입력하세요.');
            }
        }
        function goDetail() {
    		game.method="post";
    		game.action="Game?t_gubun=library_detail";
    		game.submit();
		}
        function goSignIn() {
    		game.t_gubun.value ="goSignin";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goInfo() {
    		game.t_gubun.value ="userinfo";
    		game.t_id.value="${sessionId}";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goLogout() {
    		game.t_gubun.value ="userlogout";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goLibrary() {
    		game.t_gubun.value ="library";
    		game.method="post";
    		game.action="Game";
    		game.submit();
		}
    	function goView(s_no) {
    		game.method="post";
    		game.action="Game?t_gubun=view&t_pageNo="+s_no;
    		game.submit();
		}
    	function goReview() {
    		game.method="post";
    		game.action="Game?t_gubun=myreview";
    		game.submit();
		}
    	function goGameRegi() {
    		game.method = "post";
    		game.action = "Game?t_gubun=gameRegistForm";
    		game.submit();
    	}
    </script>
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
        <li><a href="Game">STORE</a></li>
		<li class="community-menu">
            <a href="#">COMMUNITY</a>
            <ul class="category-dropdown">
                <li><a href="javascript:goReview()">Review</a></li>
                <li><a href="#">News</a></li>
            </ul>
        </li>
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
        <c:if test="${sessionId ne null}"><li><a href="javascript:goGameRegi()">Game Regist</a></li></c:if>
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
        <div class="container">
            <!-- 사이드바 (게임 리스트) -->
            <div class="sidebar">
                <div class="search">
                    <input type="text" placeholder="검색..." id="search-input" />
                    <button class="search-icon" onclick="performSearch()">🔍</button>
                </div>
                <div class="recent">
                    <h2>All Game</h2>
                    <ul>
                        <li>GUNBIRD</li>
                        <li>The Last Spell</li>
                        <li>Surviving Mars</li>
                        <li><a href="javascript:goDetail()">GUNBIRD</a></li>
                        <li>The Last Spell</li>
                        <li>Surviving Mars</li>
                        <li>GUNBIRD</li>
                        <li>The Last Spell</li>
                        <li>Surviving Mars</li>
                    </ul>
                </div>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="main-content">
                <!-- 많이 한 플레이 섹션 -->
                <hr class="divider" />
                <div class="game-thumbnails-slider">
                    <div class="game">
                        <img
                            src="https://cdn.akamai.steamstatic.com/store/home/store_home_share.jpg"
                            alt="Mass Effect"
                        />
                        <p>Mass Effect</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Skyrim"
                        />
                        <p>Skyrim</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Company of Heroes"
                        />
                        <p>Company of Heroes</p>
                    </div>

                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Bioshock Infinite"
                        />
                        <p>Bioshock Infinite</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Bioshock Infinite"
                        />
                        <p>Bioshock Infinite</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Bioshock Infinite"
                        />
                        <p>Bioshock Infinite</p>
                    </div>
                </div>

                <!-- 모든 게임 섹션 -->
                <hr class="divider" />
                <h2>All games</h2>
                <div class="game-thumbnails-slider">
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Bioshock Infinite"
                        />
                        <p>Bioshock Infinite</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Divinity Original Sin 2"
                        />
                        <p>Divinity Original Sin 2</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Skyrim"
                        />
                        <p>Skyrim</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Skyrim"
                        />
                        <p>Skyrim</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Skyrim"
                        />
                        <p>Skyrim</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Skyrim"
                        />
                        <p>Skyrim</p>
                    </div>
                    <div class="game">
                        <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuH3nuQ8g3bFzLJr-qiMBc1sDjylre6U0vw&s"
                            alt="Skyrim"
                        />
                        <p>Skyrim</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/main.js"></script>
    </body>
</html>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-logo">
            <img src="img/logo.png" alt="사이트 로고" />
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