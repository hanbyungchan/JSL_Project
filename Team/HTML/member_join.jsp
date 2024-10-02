<!doctype html>
  <head> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  	<link href="../css/join.css" rel='stylesheet'>
  	 <script src="../js/common.js"></script>
  <script type="text/javascript">


  function goSave(){
	   if(checkLength(mem.t_id,4,15, 'ID는 4자 이상 15자 이내 입니다')) return;//4 최소 15최대
	 var val = checkValue(mem.t_id,'ID 입력!') ;//2개 넘긴다
	 if(val) return; 
	 
	 if(mem.t_id_result.value == ""){
		 alert("ID 중복검사 하시오");
		 return;
	 }
	 if(mem.t_id_result.value == "사용불가"){
			alert(mem.t_id.value+" ID는 사용불가 입니다");
			mem.t_id.focus();
			return;
		}
	 if(mem.t_id.value != mem.t_id_hidden.value){
		 alert("ID 중복검사 하세요");
		 mem.t_id.focus();
			return;
			
			
	 }
	
	
	  if(checkValue(mem.t_name,'성명 입력')) return;
	  if(checkLength(mem.t_name,2,10, '성명은 2자이상 10자 이내입니다.')) return;//4 최소 15최대
	  
	  if(checkValue(mem.t_password,'비밀번호 입력')) return;
	  if(checkLength(mem.t_password,3,20, '비밀번호은 3자이상 자 20자이내입니다.')) return;//4 최소 15최대
	  
	  if(checkValue(mem.t_password_confirm,'비밀번호 확인 입력')) return;

	  	if(mem.t_password.value != mem.t_password_confirm.value){
	  		alert("비밀번호 확인! ")
	  		mem.t_password_confirm.focus();
	  		return; //빠져나가라
	  	}
	  	if(checkValue(mem.t_coustomer, '회원유형을 선택해주세요')) return;
	  	
	  	
	
		
		if(checkValue(mem.t_mobile_2, '휴대전화 입력 바랍니다')) return;
		if(checkLength(mem.t_mobile_2,4,4, '번호는 4자 입니다.')) return;//
		
		if(checkValue(mem.t_mobile_3, '휴대전화 입력 바랍니다')) return;
		if(checkLength(mem.t_mobile_3,4,4, '번호는 4자 입니다.')) return;//
		
	
		
		
	
		
		if(checkValue(mem.t_email_1,  'email 입력')) return;
		if(checkLength(mem.t_email_1 ,1,20, '이메일은 1자리 이상 20자리 이내입니다.')) return;//
		
		

		
  }

  /* function checkId() {
      
	  if(checkValue(mem.t_id,'ID 입력후 중복검사 하시오')) return;
	  $.ajax({
		 type:"post",//넘기는 방식
	  	 url:"member_checkid.jsp", // 중복검사 누르면 member_checkid로
	  	 data:"t_id="+mem.t_id.value, //member_checkid 에 aaa넘김
	  	 dataType:"text",
	  	 error:function(){
	  		alert("통신 실패");
	  	 },
		 success:function(data){//result에 사용가능 
		 var result = $.trim(data); 
			// alert("=="+result+"==");
			 mem.t_id_result.value = result;
			 if(result ="使用可能"){
				mem.t_id_hidden.value = mem.t_id.value;
			 }
			 else{
				 mem.t_id_hidden.value = "";
			 }
			 
			 
		 } 
	  });
  } */


  
  
  </script>

 </head>
 <body>
 <div class="joinbigdiv">
    <form  class="join" name="mem">
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
		                        <input type="text" name="t_id" id="mbrId" 
		                        		style="width:110px; 
										 padding: 8px; 
										 font-size: 14px;">
		                        <button type="button" class="btn_writecheck" onclick="checkId()">ID 중복검사</button>
		                        <input type ="text" name ="t_id_result"  disabled  
		                        style=
		                        "border:none;
		                        width:100px; 
								font-size: 19px;">
		                        <input type ="hidden" name ="t_id_hidden"> 
		                    </td>
                		</tr>
              
                        <tr>
                            <th><label for="name">이름<span class="must">*</span></label></th>
                            <td><input type="text" name="t_name" id="mbrName"></td>
                        </tr>
                        <tr>
                            <th><label for="pw">비밀번호<span class="must">*</span></label></th>
                            <td><input type="password" name="t_password" id="scrtNo"></td>
                        </tr>
                        <tr>
                            <th><label for="pw_confirm">비밀번호확인<span class="must">*</span></label></th>
                            <td><input type="password" name="t_password_confirm" id="scrtNoConfirm"></td>
                        </tr>
                   
                      
                        <tr>
                            <th>유선전화</th>
                            <td>
                                <select name="t_tell_1" id="telNo1" class="tell" style="width:110px; 
								 padding: 8px; 
								 font-size: 14px;">
                                    <option value="">선택</option>
                                    <option >02</option>
                                    <option >042</option>
                                    <option >035</option>
                                    <option >017</option>
                                    <option >033</option>
                                </select> -
                                <input type="text" name="t_tell_2" class="tell" maxlength="4"
                                style="width:90px; 
								 padding: 8px; 
								 font-size: 14px;"> -
                                <input type="text" name="t_tell_3" class="tell" maxlength="4"
                                style="width:90px; 
								 padding: 8px; 
								 font-size: 14px;">
                            </td>
                        </tr>
                        <tr>
                            <th>휴대전화<span class="must">*</span></th>
                            <td>
                                <select name="t_mobile_1" id="mphonNo1" class="mobile" 
                                style="width:110px; 
								 padding: 8px; 
								 font-size: 14px;">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                </select> -
                               
                                <input type="text" name="t_mobile_2" class="mobile" maxlength="4" 
                                style="width:90px; 
								 padding: 8px; 
								 font-size: 14px;"> -
                                <input type="text" name="t_mobile_3" class="mobile" maxlength="4"
                                 style="width:90px; 
								 padding: 8px; 
								 font-size: 14px;"
                                >
                            </td>
                        </tr> 
                        <tr>
						    <th class="example-th">이메일<span class="must">*</span></th>
						    <td>
						        <div class="email-container">
						            <input type="email" id="t_email" name="t_email" class="email">
						            @
						            <select name="t_email_1" id="emailDomain" class="email2">
						                <option value="">직접입력</option>
						                <option value="naver.com">naver.com</option>
						                <option value="daum.net">daum.net</option>
						                <option value="gmail.com">gmail.com</option>
						            </select>
						            <input type="text" name="t_email_result" disabled style="border:none; width:135px; padding: 1px; font-size: 18px;">
						            <input type="hidden" name="t_email_hidden"> 
						        </div>
						    </td>
						</tr>
                    </tbody>
                </table>
                <div class="btnArea">
                    <a href="javascript:goSave()"  class="btn_round">가입완료</a>
                    <a href="javascript:goHome()" class="btn_round"  >취소</a>
                </div>
           
        </div>
    </div>
    </form>
    </div>
</body>
</html>





