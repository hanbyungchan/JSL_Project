<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam Support</title>
    <link rel="stylesheet" href="../css/detail.css">
</head>
<body>
<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
    <div class="header">
        <div class="logo">
            <img src="이미지칸이야 넣기만하면돼" alt="이미지칸이야 넣기만하면돼">
        </div>
        <div class="nav">
            <ul>
                <li><a href="#">STORE</a></li>
                <li><a href="#">COMMUNITY</a></li>
                <li><a href="Game?t_gubun=support">SUPPORT</a></li>
                <li><a href="Game?t_gubun=userjoin">Exx</a></li>
                <li><a href="Game?t_gubun=goSignin">SIGN IN</a></li>
            </ul>
            <div class="login-area">
                <button><a href="#">회원가입</a></button>
              <button>  <a href="#">로그인</a></button>
            </div>
        </div>
    </div>

    <main class="main-content">
        <h1>EX 지원</h1>
        <div class="breadcrumb">
            홈 &gt; 게임 및 애플리케이션 &gt; PUBG: 배틀그라운드
        </div>

        <div class="login-section">
            <button class="steam-login">EX에 로그인하세요</button>
            <button class="help">도와주세요, 로그인할 수 없습니다</button>
        </div>

        <section class="product-section">
            <div class="product-info">
                <img src="../image/Battleground.jpg" alt="도타 2" class="product-image">
                <div class="product-details">
                    <h2>PUBG: 배틀그라운드</h2>
                    <p>PUBG: 배틀그라운드에 대한 도움을 받으려면 로그인하세요.</p>
                    <a href="#" class="view-store">STORE에서 구매</a>
                    <a href="#" class="view-library">내 라이브러리에서 보기</a>
                </div>
            </div>

          <div class="issue-section">
		    <h3>이 제품에 어떤 문제가 있나요?</h3>
		    <form action="#" method="POST" class="issue-form">
		        <textarea id="problem-description" name="problem-description" rows="4" placeholder="문제를 입력하세요"></textarea>
		        
		        <div class="form-buttons">
		            <button type="submit" class="submit-button">등록</button>
		            <button type="button" class="cancel-button">등록 취소</button>
		        </div>
		    </form>
		</div>
        </section>
    </main>
</body>
</html>
