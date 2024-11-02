<%@ page pageEncoding="UTF-8"%>
<body class="${sessionId ne null ? (sessionLevel ne '3' ? 'session-level-not3' : 'session-level') : 'session-null'}">
<header class="header" id="header">
    <div class="header-content">
        <div class="logo">
            <a href="Game">
                <img src="img/logo.png" alt="사이트 로고">
            </a>
        </div>

        <div class="hamburger-menu" id="hamburger-menu">
            <i class="fas fa-bars"></i>
        </div>

        <nav class="menu" id="menu">
            <ul>
                <li><a href="Game">STORE</a></li>
                <li class="community-menu">
                    <a href="#">COMMUNITY</a>
                    <ul class="category-dropdown">
                        <li><a href="Game?t_gubun=myreview">Review</a></li>
                        <li><a href="News">News</a></li>
                    </ul>
                </li>
                <li><a href="Game?t_gubun=support">SUPPORT</a></li>
                
                <c:if test="${sessionId ne null}">
                    <c:if test="${sessionLevel ne '3'}">
                        <li class="admin-reg"><a href="javascript:goGameRegi()">GAME REGIST</a></li>
                        <li class="admin-reg"><a href="javascript:goStoreRegi()">STORE REGIST</a></li>
                    </c:if>
                </c:if>
                <li class="admin-reg"><a href="Game?t_gubun=news_write">News REGIST</a></li>
            </ul>
        </nav>

        <nav>
            <div class="icons">
            	<c:if test="${sessionId eq null}">
                    <a href="Game?t_gubun=goSignin"><i class="fa-solid fa-right-to-bracket"></i></a>
                </c:if>
	            <c:if test="${sessionId ne null}">
	            	<a href="javascript:goInfo()"><i class="fa-solid fa-user-astronaut"></i></a>
	            	<a href="javascript:goLogout()"><i class="fa-solid fa-right-from-bracket"></i></a>
	            	<a href="javascript:goLibrary()"><i class="fa-solid fa-book"></i></a>
	            </c:if>
                <div class="search-box" id="search-box">
                    <input type="text" placeholder="Search...">
                </div>
                <a href="Search"><i class="fas fa-search"></i></a>
                <a href="Game?t_gubun=cart"><i class="fas fa-shopping-cart"></i></a>
            </div>
        </nav>
    </div>
</header>
</body>