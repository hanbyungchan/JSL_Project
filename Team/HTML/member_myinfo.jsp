<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Settings</title>
    <link rel="stylesheet" href="../css/myinfo.css">
</head>
<body>
  <div class="header">
        <div class="logo">
            <img src="이미지칸이야 넣기만하면돼" alt="이미지칸이야 넣기만하면돼">
        </div>
        <div class="nav">
            <ul>
                <li><a href="#">STORE</a></li>
                <li><a href="#">COMUNITY</a></li>
                <li><a href="#">HOME</a></li>
                <li><a href="#">SUPPORT</a></li>
            </ul>
            <div class="login-area">
                <button>회원가입</button>
              <button>  <a href="#">로그인</a></button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="id-set" style="text-align: center;">
            <h1>계정 설정</h1>
            <p>계정 상세 정보를 관리합니다.</p>
        </div>
        <section class="account-info">
            <h2 style="text-align: center; padding: 20px;">계정 정보</h2>
            <div class="info-group">
                <label for="user-id">ID</label>
                <span id="user-id"></span>
            </div>
            <div class="info-group">
                <label for="username">닉네임</label>
                <input type="text" id="username" value="ex" disabled>
                <button class="edit-button">✎</button>
            </div>
            <div class="info-group">
                <label for="email">이메일 주소</label>
                <input type="email" id="email" value="ex@naver.com" disabled>
                <button class="edit-button">✎</button>
            </div>
        </section>

        <section class="personal-info">
            <h2 style="text-align: center; padding: 20px;">개인 세부 정보</h2>
            <div class="info-group">
                <label for="name">성명</label>
                <input type="text" id="name" value="S***G" disabled>
            </div>
        </section>

        <section class="address-info">
            <div class="info-group">
                <label for="postal-code">우편 번호</label>
                <input type="text" id="postal-code">
            </div>
            <div class="info-group">
                <label for="region">지역</label>
                <input type="text" id="region">
            </div>
            <div class="info-group">
                <label for="address1">주소</label>
                <input type="text" id="address1">
            </div>
            <div class="info-group">
                <label for="address2">상세 주소</label>
                <input type="text" id="address2">
            </div>
            <div class="info-group">
                <label for="country">국가/지역</label>
                <input type="text" id="country" value="Korea, Republic of" disabled>
            </div>
        </section>

        <div class="button-container" style="text-align: center;">
            <button class="save-button">변경사항 저장</button>
            <button class="reset">취소</button>
        </div>
    </div>
</body>
</html>