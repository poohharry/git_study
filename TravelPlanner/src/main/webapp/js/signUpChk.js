'use strict'

function signUpChk() {
	if(document.signUpFrm.id == "") {
		alert("아이디를 입력하십시오");
		document.signUpFrm.id.focus();
		return;
	}
	
	if(document.signUpFrm.pw == "") {
		alert("비밀번호를 입력하십시오");
		document.signUpFrm.pw.focus();
		return;
	}
	
	if(document.signUpFrm.repw == "" || document.signUpFrm.pw != document.signUpFrm.repw) {
		alert("비밀번호를 확인하십시오");
		document.signUpFrm.repw.value="";
		document.signUpFrm.repw.focus();
		return;
	}
	
	if(document.signUpFrm.name == "") {
		alert("이름을 입력하십시오");
		document.signUpFrm.name.focus();
		return;
	}
	
	if(document.signUpFrm.email == "") {
		alert("이메일을 입력하십시오");
		document.signUpFrm.email.focus();
		return;
	}
	
	if(document.signUpFrm.phone == "") {
		alert("휴대폰 번호를 입력하십시오");
		document.signUpFrm.phone.focus();
		return;
	}
	
	var str=document.regFrm.email.value;			// poohharry@naver.com
    var atPos = str.indexOf('@');					// 9
    var atLastPos = str.lastIndexOf('@');			// 9
    var dotPos = str.indexOf('.'); 					// 15
    var spacePos = str.indexOf(' ');				// -1
    var commaPos = str.indexOf(',');				// -1
    var eMailSize = str.length;						// 18
    
    if (atPos > 1 									// @앞에 글자가 2개 이상
    	&& atPos == atLastPos 						// @가 하나만 있는 경우
    	&& dotPos > 3 								// . 옆에 글자가 4개 이상
    	&& spacePos == -1 							// 공백 없음
    	&& commaPos == -1 							// 콤마(,) 없음
	    && atPos + 1 < dotPos 						// @와 . 사이에 글자가 1개 이상
	    && dotPos + 1 < eMailSize);					// .뒤에 글자가 1개 이상
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.regFrm.email.focus();
		  return;
    }
    document.signUpfrm.submit();
}



