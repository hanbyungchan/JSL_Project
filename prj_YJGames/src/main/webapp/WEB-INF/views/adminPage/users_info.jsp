<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSL Games</title>
    <link rel="stylesheet" href="css/myinfo.css">
    <link rel="stylesheet" href="css/styles.css" />
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="js/common.js"></script>
    <script type="text/javascript">
    function goUpdate(){
     	if(checkValueLength(user.t_u_name,2,20, "Please enter Name",'Name is more than 2 less than 20')) return;
   	 	if(checkValueLength(user.t_u_email_1 ,1,20, "Please enter Email", 'Email is more than 1 less than 20')) return;
   	 	user.method = "post";
		user.action = "Game?t_gubun=userupdate2";
		user.submit();
     }
    function goDelete(){
    	if(confirm("Are you sure you want to delete it?")){
       		user.method = "post";
       		user.action = "Game?t_gubun=userdelete2";
       		user.submit();
    	}
    }
    function goActivate(){
    	if(confirm("Are you sure you want to activate it?")){
       		user.method = "post";
       		user.action = "Game?t_gubun=activate";
       		user.submit();
    	}
    }
    </script>
    <%@ include file = "../scripts.jsp"%>
</head>
<body>
	<form name="game">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_pageNo">
	</form>
	<%@ include file = "../header.jsp"%>
    <div class="container">
        <div class="id-set" style="text-align: center;">
            <h1>Account Settings</h1>
            <p>Manage account details.</p>
        </div>
    <form name="user">
    <input type="hidden" name="t_gubun">
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
                <input type="email" name="t_u_email_1" value="${t_dto.getU_email_1()}">@
                <select name="t_u_email_2">
                    <option value="naver.com" ${t_dto.getU_email_2() == 'naver.com' ? 'selected' : ''}>naver.com</option>
                    <option value="gmail.com" ${t_dto.getU_email_2() == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                    <option value="daum.net" ${t_dto.getU_email_2() == 'daum.net' ? 'selected' : ''}>daum.net</option>
                    <option value="yahoo.com" ${t_dto.getU_email_2() == 'yahoo.com' ? 'selected' : ''}>yahoo.com</option>
                    <option value="other" ${t_dto.getU_email_2() == 'other' ? 'selected' : ''}>Other</option>
                </select>
            </div>
            <c:if test="${t_dto.getU_level() eq '3'}">
            <div class="info-group">
                <label for="postal-code">BIRTH</label>
                <input type="text" name="t_u_birth" value="${t_dto.getU_birth()}">
            </div>
            <div class="info-group">
                <label for="region">GENDER</label>
                <label for="man">Man</label>
                <input type="radio" name="t_u_gender" value="M" id="man" ${t_dto.getU_gender() == 'M' ? 'checked' : ''}>
                
                <label for="woman">Woman</label>
                <input type="radio" name="t_u_gender" value="F" id="woman" ${t_dto.getU_gender() == 'F' ? 'checked' : ''}>
            </div>
            <div class="info-group">
                <label for="user-mileage">MONEY</label>
                <input type="text" name="t_u_money" value="${t_dto.getU_money()}">
            </div>
             </c:if>
        </section>
		</form>
        <div class="button-container" style="text-align: center;">
            <button class="save-button" onclick="goUpdate()">Save Changes</button>
            <c:if test="${t_dto.getU_exit_date() eq null}">
            <button class="save-button" onclick="goDelete()" >Delete account</button>
            </c:if>
            <c:if test="${t_dto.getU_exit_date() ne null}">
            <button class="save-button" onclick="goActivate()" >Activate account</button>
            </c:if>
            <button class="save-button" onclick="window.history.back();">Back</button>
        </div>
    </div>
    <div class="btns">
            <div class="moveTopBtn">Top</div>
            <div class="moveBottomBtn">Bottom</div>
</div>
    <script src="js/main.js"></script>
</body>
</html>
<%@ include file = "../footer.jsp"%>