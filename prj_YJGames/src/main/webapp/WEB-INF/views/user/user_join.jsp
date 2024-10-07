<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
  <head> 

  	<link href="css/join.css" rel='stylesheet'>
  	 <script src="js/common.js"></script>
  	 <script src="js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">

  function goSave(){
	 if(checkValueLength(user.t_u_id,3,15, 'ID는 4자 이상 15자 이내 입니다')) return;//4 최소 15최대
	 
	 if(user.t_u_id_result.value == ""){
		 alert("ID 중복검사 하시오");
		 return;
	 }
	 if(user.t_u_id_result.value == "Unuseable ID"){
			alert(user.t_u_id.value+" Unuseable ID");
			user.t_u_id.focus();
			return;
		}
	 if(user.t_u_id.value != user.t_u_id_hidden.value){
		 alert("ID 중복검사 하세요");
		 user.t_u_id.focus();
			return;
	 }
	
	
	  if(checkValueLength(user.t_u_name,2,10, '성명은 2자이상 10자 이내입니다.')) return;//4 최소 15최대
	  
	  if(checkValueLength(user.t_u_password,3,20, '비밀번호은 3자이상 자 20자이내입니다.')) return;//4 최소 15최대
	  
	  if(checkValue(user.t_u_password_confirm,'비밀번호 확인 입력')) return;

	  if(user.t_u_password.value != user.t_u_password_confirm.value){
	  	alert("비밀번호 확인! ")
	  	user.t_u_password_confirm.focus();
	  	return;
	  }
	 if(checkValueLength(user.t_u_birth, 8, 'Birth is 8')) return;//4 최소 15최대
	 if(checkValue(user.t_u_gender,'select Gender')) return;
	if(checkValueLength(user.t_u_email_1 ,1,20, '이메일은 1자리 이상 20자리 이내입니다.')) return;//
	if(checkValue(user.t_u_email_2,  'email 선택')) return;
	
		user.t_gubun.value = "usersave";
		user.method = "post";
		user.action = "Game";
		user.submit();
		
  }
  
  function emailChange() {
		user.t_u_email_2.value = user.t_u_email_select.value;
	}

   function checkId() {
      
	   if(checkValueLength(user.t_u_id,3,15, 'ID는 4자 이상 15자 이내 입니다')) return;//4 최소 15최대
	  $.ajax({
		 type:"post",//넘기는 방식
	  	 url:"checkId", 
	  	 data:"t_u_id="+user.t_u_id.value, //member_checkid 에 aaa넘김
	  	 dataType:"text",
	  	 error:function(){
	  		alert("통신 실패");
	  	 },
		 success:function(data){//result에 사용가능 
		 var result = $.trim(data); 
			 alert("=="+result+"==");
			 user.t_u_id_result.value = result;
			 if(result =="Useable ID"){
				user.t_u_id_hidden.value = user.t_u_id.value;
			 }
			 else{
				 user.t_u_id_hidden.value = "";
			 }
		 } 
	  });
  	} 

function goLogin() {
	user.t_gubun.value = "userjoin";
	user.method = "post";
	user.action = "Game";
	user.submit();
}
  
  
  </script>

 </head>
 <body>
 <div class="joinbigdiv">
    <form  class="join" name="user">
		<input type="hidden" name="t_gubun">
		
    <div class="divcontainer">
        <div class="join_write col_989">
            <h2>회원가입</h2>
            <div class="list_con">
                <ul class="icon_type1">
                    <li>  회원정보는 안전하게 보호되며, 동의 없이 공개되지 않습니다.</li>
                </ul>
            </div>
         
		
                <table class="table_write02">
                    <caption>회원가입을 위한 정보입력표</caption>
                    <colgroup>
                        <col width="30%">
                        <col width="70%">
                    </colgroup>
                    <tbody id="joinDataBody">
                        <tr>
                            <th><label for="id">아이디<span class="must">*</span></label></th>
                            <td>
		                        <input type="text" name="t_u_id" id="mbrId" 
		                        		style="width:110px; 
										 padding: 8px; 
										 font-size: 14px;">
		                        <input type="button" class="btn_writecheck" onclick="checkId()" value = "CheckId">
		                        <input type ="text" name ="t_u_id_result" readonly  
		                        style=
		                        "border:none;
		                        width:100px; 
								font-size: 19px;">
		                        <input type ="hidden" name ="t_u_id_hidden"> 
		                    </td>
                		</tr>
              
                        <tr>
                            <th><label for="name">이름<span class="must">*</span></label></th>
                            <td><input type="text" name="t_u_name" id="mbrName"></td>
                        </tr>
                        <tr>
                            <th><label for="pw">비밀번호<span class="must">*</span></label></th>
                            <td><input type="password" name="t_u_password" id="scrtNo"></td>
                        </tr>
                        <tr>
                            <th><label for="pw_confirm">비밀번호확인<span class="must">*</span></label></th>
                            <td><input type="text" name="t_u_password_confirm" id="scrtNoConfirm"></td>
                        </tr>
                        <tr>
                            <th><label for="birth">Birth<span class="must">*</span></label></th>
                            <td><input type="text" name="t_u_birth" placeholder="19901004"></td>
                        </tr>
                         <tr>
                            <th><label for="gender">Gender<span class="must">*</span></label></th>
                            <td>
                            	Male<input type="radio" name="t_u_gender" value = "M">
                            	Female<input type="radio" name="t_u_gender" value = "F">
                            </td>
                        </tr>
                        <tr>
						    <th class="example-th">이메일<span class="must">*</span></th>
						    <td>
						        <div class="email-container">
						            <input type="text" id="t_email" name="t_u_email_1" class="email">
						            @&nbsp;
						            <input type="text" name="t_u_email_2" class = "email">
						            <select name="t_u_email_select" onchange="emailChange()" id="emailDomain" class="email2">
						                <option value="">직접입력</option>
						                <option value="naver.com">naver.com</option>
						                <option value="daum.net">daum.net</option>
						                <option value="gmail.com">gmail.com</option>
						            </select>
						        </div>
						        <input type = "hidden" name = "t_u_level" value = "3">
						    </td>
						</tr>
                    </tbody>
                </table>
                <div class="btnArea">
                    <button type="button" onclick="goSave()" class="btn_round">가입완료</button>
                    <button type="button" onclick="goLogin()" class="btn_round">취소</button>
                </div>
        </div>
    </div>
    </form>
    </div>
</body>
</html>





