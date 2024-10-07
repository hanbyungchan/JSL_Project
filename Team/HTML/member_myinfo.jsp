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
                <button>JOIN</button>
              <button>  <a href="#">LOGIN</a></button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="id-set" style="text-align: center;">
            <h1>Account Settings</h1>
            <p>Manage account details.</p>
        </div>
        <section class="account-info">
            <h2 style="text-align: center; padding: 20px;">Account Information</h2>
            <div class="info-group">
                <label for="user-id">ID</label>
                <span id="user-id"></span>
            </div>
            <div class="info-group">
                <label for="username">NAME</label>
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
            <h2 style="text-align: center; padding: 20px;">Personal details</h2>
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
            <button class="save-button">Save Changes</button>
            <button class="reset">Cancel</button>
        </div>
         <section class="personal-info">
            <h2 style="text-align: center; padding: 40px;">Delete Account</h2>
           <div class="info-group">
           <p>
           	Click Request to delete your account to begin the process of permanently deleting Epic Games accounts, including all personal information, purchase details, game progress, in-game content, Unreal Project, and Epic Games wallet accounts. Once your Epic Games account is deleted, your wallet balance will also be permanently deleted.

			If you request to delete your account, it will be deleted after 14 days. During this period, you can log in to your account and reactivate it, which will cancel your request for deletion. After 14 days, you will not be able to recover your deleted account.
			</p>
    		
		   </div>
		   <button class="save-button2">Request to delete account</button>
        </section>
    </div>
</body>
</html>