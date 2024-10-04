<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head> 
  	<link href="css/join.css" rel='stylesheet'>
  	 <script src="js/common.js"></script>
  <script type="text/javascript">
  function goSave(){
	   if(checkLength(mem.t_id,4,15, 'ID�� 4�� �̻� 15�� �̳� �Դϴ�')) return;//4 �ּ� 15�ִ�
	 var val = checkValue(mem.t_id,'ID �Է�!') ;//2�� �ѱ��
	 if(val) return; 
	 
	 if(mem.t_id_result.value == ""){
		 alert("ID �ߺ��˻� �Ͻÿ�");
		 return;
	 }
	 if(mem.t_id_result.value == "���Ұ�"){
			alert(mem.t_id.value+" ID�� ���Ұ� �Դϴ�");
			mem.t_id.focus();
			return;
		}
	 if(mem.t_id.value != mem.t_id_hidden.value){
		 alert("ID �ߺ��˻� �ϼ���");
		 mem.t_id.focus();
			return;
			
			
	 }
	
	
	  if(checkValue(mem.t_name,'���� �Է�')) return;
	  if(checkLength(mem.t_name,2,10, '������ 2���̻� 10�� �̳��Դϴ�.')) return;//4 �ּ� 15�ִ�
	  
	  if(checkValue(mem.t_password,'��й�ȣ �Է�')) return;
	  if(checkLength(mem.t_password,3,20, '��й�ȣ�� 3���̻� �� 20���̳��Դϴ�.')) return;//4 �ּ� 15�ִ�
	  
	  if(checkValue(mem.t_password_confirm,'��й�ȣ Ȯ�� �Է�')) return;

	  	if(mem.t_password.value != mem.t_password_confirm.value){
	  		alert("��й�ȣ Ȯ��! ")
	  		mem.t_password_confirm.focus();
	  		return; //����������
	  	}
	  	if(checkValue(mem.t_coustomer, 'ȸ�������� �������ּ���')) return;
	  	
	  	
	
		
		if(checkValue(mem.t_mobile_2, '�޴���ȭ �Է� �ٶ��ϴ�')) return;
		if(checkLength(mem.t_mobile_2,4,4, '��ȣ�� 4�� �Դϴ�.')) return;//
		
		if(checkValue(mem.t_mobile_3, '�޴���ȭ �Է� �ٶ��ϴ�')) return;
		if(checkLength(mem.t_mobile_3,4,4, '��ȣ�� 4�� �Դϴ�.')) return;//
		
	
		
		
	
		
		if(checkValue(mem.t_email_1,  'email �Է�')) return;
		if(checkLength(mem.t_email_1 ,1,20, '�̸����� 1�ڸ� �̻� 20�ڸ� �̳��Դϴ�.')) return;//
		
		

		
  }

  /* function checkId() {
      
	  if(checkValue(mem.t_id,'ID �Է��� �ߺ��˻� �Ͻÿ�')) return;
	  $.ajax({
		 type:"post",//�ѱ�� ���
	  	 url:"member_checkid.jsp", // �ߺ��˻� ������ member_checkid��
	  	 data:"t_id="+mem.t_id.value, //member_checkid �� aaa�ѱ�
	  	 dataType:"text",
	  	 error:function(){
	  		alert("��� ����");
	  	 },
		 success:function(data){//result�� ��밡�� 
		 var result = $.trim(data); 
			// alert("=="+result+"==");
			 mem.t_id_result.value = result;
			 if(result ="����ʦ��"){
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
            <h2>ȸ������</h2>
            <div class="list_con">
                <ul class="icon_type1">
                    <li>  ȸ�������� �����ϰ� ��ȣ�Ǹ�, ���� ���� �������� �ʽ��ϴ�.</li>
                </ul>
            </div>
         
		
                <table class="table_write02">
                    <caption>ȸ�������� ���� �����Է�ǥ</caption>
                    <colgroup>
                        <col width="30%">
                        <col width="70%">
                    </colgroup>
                    <tbody id="joinDataBody">
                        <tr>
                            <th><label for="id">���̵�<span class="must">*</span></label></th>
                            <td>
		                        <input type="text" name="t_id" id="mbrId" 
		                        		style="width:110px; 
										 padding: 8px; 
										 font-size: 14px;">
		                        <button type="button" class="btn_writecheck" onclick="checkId()">ID �ߺ��˻�</button>
		                        <input type ="text" name ="t_id_result"  disabled  
		                        style=
		                        "border:none;
		                        width:100px; 
								font-size: 19px;">
		                        <input type ="hidden" name ="t_id_hidden"> 
		                    </td>
                		</tr>
              
                        <tr>
                            <th><label for="name">�̸�<span class="must">*</span></label></th>
                            <td><input type="text" name="t_name" id="mbrName"></td>
                        </tr>
                        <tr>
                            <th><label for="pw">��й�ȣ<span class="must">*</span></label></th>
                            <td><input type="password" name="t_password" id="scrtNo"></td>
                        </tr>
                        <tr>
                            <th><label for="pw_confirm">��й�ȣȮ��<span class="must">*</span></label></th>
                            <td><input type="password" name="t_password_confirm" id="scrtNoConfirm"></td>
                        </tr>
                   
                      
                        <tr>
                            <th>������ȭ</th>
                            <td>
                                <select name="t_tell_1" id="telNo1" class="tell" style="width:110px; 
								 padding: 8px; 
								 font-size: 14px;">
                                    <option value="">����</option>
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
                            <th>�޴���ȭ<span class="must">*</span></th>
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
						    <th class="example-th">�̸���<span class="must">*</span></th>
						    <td>
						        <div class="email-container">
						            <input type="email" id="t_email" name="t_email" class="email">
						            @
						            <select name="t_email_1" id="emailDomain" class="email2">
						                <option value="">�����Է�</option>
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
                    <a href="javascript:goSave()"  class="btn_round">���ԿϷ�</a>
                    <a href="javascript:goHome()" class="btn_round"  >���</a>
                </div>
           
        </div>
    </div>
    </form>
    </div>
</body>
</html>
