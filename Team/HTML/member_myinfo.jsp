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
                <label for="username">성명</label>
                <input type="text" id="username" value="ex" disabled>
                <button class="edit-button">✎</button>
            </div>
            <div class="info-group">
                <label for="email">E-MAIL</label>
                <input type="email" id="email" value="ex@naver.com" disabled>
                <button class="edit-button">✎</button>
            </div>
        </section>

        <section class="personal-info">
            <h2 style="text-align: center; padding: 20px;">개인 세부 정보</h2>
            <div class="info-group">
                <label for="name">PASSWORD</label>
                <input type="text" id="password" value="" >
            </div>
        </section>

        <section class="address-info">
            <div class="info-group">
                <label for="postal-code">BIRTH</label>
                <input type="text" id="postal-code">
            </div>
            <div class="info-group">
                <label for="region">GENDER</label>
                <input type="text" id="gender">
            </div>
            <div class="info-group">
                <label for="address1">LEVEL</label>
                <input type="text" id="level">
            </div>
            <div class="info-group">
                <label for="address2">EXIT_DATE</label>
                <input type="text" id="exit_date">
            </div>
            
        </section>

        <div class="button-container" style="text-align: center;">
            <button class="save-button">변경사항 저장</button>
            <button class="reset">취소</button>
        </div>
         <section class="personal-info">
            <h2 style="text-align: center; padding: 40px;">계정 삭제</h2>
           <div class="info-group">
           <p>
           	계정 삭제 요청을 클릭하여 모든 개인 정보, 구매 내역, 게임 진행 상황, 인게임 콘텐츠, 언리얼 프로젝트 및 에픽게임즈 지갑 계정을 포함한 에픽게임즈 계정을 영구 삭제하는 절차를 시작합니다. 에픽게임즈 계정이 삭제되고 나면 지갑 잔액도 영구 삭제됩니다.

			계정 삭제를 요청하면 14일 후에 계정이 삭제됩니다. 이 기간 동안 계정에 로그인하여 재활성화할 수 있으며, 이렇게 하면 삭제 요청은 취소됩니다. 14일이 지나면 삭제된 계정을 복구할 수 없습니다.
			</p>
    		
		   </div>
		   <button class="save-button2">계정 삭제 요청</button>
        </section>
    </div>
</body>
</html>