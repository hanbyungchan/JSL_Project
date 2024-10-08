 	function checkValueLength(obj, minLength, maxLength, msg1, msg2) {
 		var result = false;
 		var len = obj.value.length;
		if(obj.value == "") {
 			alert(msg1);
 			obj.focus();
 			result = true;
 			
 		}
 		if(len < minLength || len > maxLength) {
 			alert(msg2);
 			obj.focus();
 			result = true;
 		}
 		return result;
 	}
 	function checkValue(obj, msg) {
 		var result = false;
 		if(obj.value == "") {
 			alert(msg);
 			obj.focus();
 			result = true;
 			
 		}
	 	return result;
 	}