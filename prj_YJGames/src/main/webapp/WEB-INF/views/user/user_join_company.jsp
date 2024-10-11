<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
  <head> 

  	<link href="css/join.css" rel='stylesheet'>
  	 <script src="js/common.js"></script>
  	 <script src="js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">

  function goSave(){
	 if(checkValueLength(user.t_u_id,3,15, "Please enter ID", 'ID is more than 3 less than 15')) return;//4 최소 15최대
	 
	 if(user.t_u_id_result.value == ""){
		 alert("Please Check Duplicate ID");
		 return;
	 }
	 if(user.t_u_id_result.value == "Unuseable ID"){
			alert(user.t_u_id.value+" Unuseable ID");
			user.t_u_id.focus();
			return;
		}
	 if(user.t_u_id.value != user.t_u_id_hidden.value){
		 alert("Please Check Duplicate ID");
		 user.t_u_id.focus();
			return;
	 }
	 
	  if(checkValueLength(user.t_u_name,2,20, "Please enter Company Name",'Name is more than 2 less than 20')) return;//4 최소 15최대
	  
	  if(checkValueLength(user.t_u_password,3,20, "Please enter password", 'Password is more than 3 less than 20')) return;//4 최소 15최대
	  
	  if(checkValue(user.t_u_password_confirm,'Please enter password confirm')) return;

	  if(user.t_u_password.value != user.t_u_password_confirm.value){
	  	alert("Check the password! ")
	  	user.t_u_password_confirm.focus();
	  	return;
	  }
	if(checkValueLength(user.t_u_email_1 ,1,20, "Please enter Email", 'Email is more than 1 less than 20')) return;//
	if(checkValue(user.t_u_email_2,  'Please select Email')) return;
	
		user.method = "post";
		user.action = "Game?t_gubun=usersave";
		user.submit();
		
  }
  function goCheck() {
		if(event.keyCode ==13){checkId();}
	}

  function emailChange() {
		user.t_u_email_2.value = user.t_u_email_select.value;
	}

   function checkId() {
      
	   if(checkValueLength(user.t_u_id,3,15, "Please enter ID", 'ID is more than 3 less than 15')) return;//4 최소 15최대
	  $.ajax({
		 type:"post",//넘기는 방식
	  	 url:"checkId", 
	  	 data:"t_u_id="+user.t_u_id.value, //member_checkid 에 aaa넘김
	  	 dataType:"text",
	  	 error:function(){
	  		alert("Communication failure");
	  	 },
		 success:function(data){//result에 사용가능 
		 var result = $.trim(data); 
			 //alert("=="+result+"==");
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
	user.method = "post";
	user.action = "Game?t_gubun=goSignin";
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
            <h2>Sign up</h2>
            <div class="list_con">
                <ul class="icon_type1">
                    <li>  Membership information is secured and not disclosed without consent.</li>
                </ul>
            </div>
         
		
                <table class="table_write02">
                    <caption>Information input sheet for membership registration</caption>
                    <colgroup>
                        <col width="30%">
                        <col width="70%">
                    </colgroup>
                    <tbody id="joinDataBody">
                        <tr>
                            <th><label for="id">ID<span class="must">*</span></label></th>
                            <td>
		                        <input type="text" name="t_u_id" id="mbrId" 
		                        		style="width:110px; 
										 padding: 8px; 
										 font-size: 14px;" onkeypress="goCheck()">
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
                            <th><label for="name">Company Name<span class="must">*</span></label></th>
                            <td><input type="text" name="t_u_name" id="mbrName"></td>
                        </tr>
                        <tr>
                            <th><label for="pw">Password<span class="must">*</span></label></th>
                            <td><input type="password" name="t_u_password" id="scrtNo"></td>
                        </tr>
                        <tr>
                            <th><label for="pw_confirm">Password Confirm<span class="must">*</span></label></th>
                            <td><input type="password" name="t_u_password_confirm" id="scrtNoConfirm"></td>
                        </tr>
                        <tr>
						    <th class="example-th">Email<span class="must">*</span></th>
						    <td>
						        <div class="email-container">
						            <input type="text" id="t_email" name="t_u_email_1" class="email">
						            @&nbsp;
						            <input type="text" name="t_u_email_2" class = "email">
						            <select name="t_u_email_select" onchange="emailChange()" id="emailDomain" class="email2">
						                <option value="">Direct Input</option>
						                <option value="naver.com">naver.com</option>
						                <option value="daum.net">daum.net</option>
						                <option value="gmail.com">gmail.com</option>
						            </select>
						        </div>
						        <input type = "hidden" name = "t_u_level" value = "2">
						    </td>
						</tr>
                    </tbody>
                </table>
                <div class="btnArea">
                    <button type="button" onclick="goSave()" class="btn_round">Registration</button>
                    <button type="button" onclick="goLogin()" class="btn_round">Cancel</button>
                </div>
        </div>
    </div>
    </form>
    </div>
</body>
</html>





