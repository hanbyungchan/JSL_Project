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

                <c:if test="${sessionId eq null}">
                    <li><a href="Game?t_gubun=goSignin">SIGN IN</a></li>
                    
                </c:if>

                <c:if test="${sessionId ne null}">
                    <li><a href="javascript:goInfo()">MyInfo</a></li>
                    <li><a href="javascript:goLogout()">Logout</a></li>
                    <li><a href="javascript:goLibrary()">Library</a></li>

                    <c:if test="${sessionLevel ne '3'}">
                        <li><a href="javascript:goGameRegi()">Game Regist</a></li>
                        <li><a href="javascript:goStoreRegi()">Store Regist</a></li>
                        <li><a href="Game?t_gubun=GameConfirmList">Game Confirm</a></li>
                    </c:if>
                </c:if>
            </ul>
        </nav>

        <nav>
            <div class="icons">
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