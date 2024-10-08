<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Settings</title>
    <link rel="stylesheet" href="css/myinfo.css">
    <script src="js/common.js"></script>
    <script type="text/javascript">
    function goUpdate(){
   	 if(checkValueLength(user.t_u_name,2,10,'Please enter your Name', '성명은 2자이상 10자 이내입니다.')) return;//4 최소 15최대
   	 if(checkValueLength(user.t_u_password,3,20, 'Please enter your password','비밀번호은 3자이상 자 20자이내입니다.')) return;//4 최소 15최대
   	 if(checkValue(user.t_u_password_check, 'Please enter your current password')) return;
   	 if(checkValueLength(user.t_u_birth, 8, 'Please enter your Birth','Birth is 8')) return;//4 최소 15최대
   	 if(checkValue(user.t_u_gender,'select Gender')) return;
   	 if(checkValueLength(user.t_u_email_1 ,1,20, 'Please enter your Email','이메일은 1자리 이상 20자리 이내입니다.')) return;//
   	 if(checkValue(user.t_u_email_2, 'email 선택')) return;
   		user.t_gubun.value = "userupdate";
   		user.method = "post";
   		user.action = "Game";
   		user.submit();
     }
    function goDelete(){
    	if(confirm("Are you sure you want to delete it?")){
    		 if(checkValue(user.t_u_password_check, 'Please enter your current password')) return;
       		user.t_gubun.value = "userdelete";
       		user.method = "post";
       		user.action = "Game";
       		user.submit();
    	}
    }
    function goBack() {
    	user.t_gubun.value = "list";
		user.method = "post";
		user.action = "Game";
		user.submit();
	}
    </script>
</head>
<body>
  <div class="header">
        <div class="logo">
            <img src="" alt=" ">
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
    <form name="user">
    <input type="hidden" name="t_gubun">
    <div class="container">
        <div class="id-set" style="text-align: center;">
            <h1>Account Settings</h1>
            <p>Manage account details.</p>
        </div>
        <section class="account-info">
            <h2 style="text-align: center; padding: 20px;">Account Information</h2>
            <div class="info-group">
                <label for="user-id">ID</label>
                <input type="text" name="t_u_id" value="${t_dto.getU_id()}" readonly="readonly">
            </div>
            <div class="info-group">
                <label for="username">NAME</label>
                <input type="text" name="t_u_name" value="${t_dto.getU_name()}" >
            </div>
            <div class="info-group">
                <label for="email">E-MAIL</label>
                <input type="email" name="t_u_email_1" value="${t_dto.getU_email_1()}">@<input type="email" name="t_u_email_2" value="${t_dto.getU_email_2()}" >
            </div>
            <div class="info-group">
                <label for="postal-code">BIRTH</label>
                <input type="text" name="t_u_birth" value="${t_dto.getU_birth()}">
            </div>
            <div class="info-group">
                <label for="region">GENDER</label>
                <input type="text" name="t_u_gender" value="${t_dto.getU_gender()}">
            </div>
            <div class="info-group">
                <label for="user-mileage">MONEY</label>
                <input type="text" name="t_u_money" value="${t_dto.getU_money()}" readonly="readonly">
            </div>
			<div class="info-group">
                <label for="region">CHANGE PASSWORD</label>
                <input type="password" name="t_u_password">
            </div>
            <div class="info-group">
                <label for="region">CURRENT PASSWORD</label>
                <input type="password" name="t_u_password_check">
            </div>
        </section>
		</form>

        <div class="button-container" style="text-align: center;">
            <button class="save-button" onclick="goUpdate()">Save Changes</button>
            <button class="save-button" onclick="goBack()">Home</button>
        </div>
         <section class="personal-info">
            <h2 style="text-align: center; padding: 40px;">Delete Account</h2>
           <div class="info-group">
           <p>
           	Click Request to delete your account to begin the process of permanently deleting Epic Games accounts, including all personal information, purchase details, game progress, in-game content, Unreal Project, and Epic Games wallet accounts. Once your Epic Games account is deleted, your wallet balance will also be permanently deleted.

			If you request to delete your account, it will be deleted after 14 days. During this period, you can log in to your account and reactivate it, which will cancel your request for deletion. After 14 days, you will not be able to recover your deleted account.
			</p>
    		
		   </div>
		   <button class="save-button2" onclick="goDelete()" >Request to delete account</button>
        </section>
    </div>
</body>
</html>