'use strict'

const sFrm = document.signUpFrm;


function signUpChk() {

	
	if(sFrm.id == "") {
		alert("아이디를 입력하십시오");
		document.signUpFrm.id.focus();
		return;
	}
	
	if(sFrm.pw == "") {
		alert("비밀번호를 입력하십시오");
		document.signUpFrm.pw.focus();
		return;
	}
	
	if(sFrm.repw == "" || sFrm.pw != sFrm.repw) {
		alert("비밀번호를 확인하십시오");
		sFrm.repw.value="";
		sFrm.repw.focus();
		return;
	}
	
	if(sFrm.name == "") {
		alert("이름을 입력하십시오");
		document.signUpFrm.name.focus();
		return;
	}
	
	if(sFrm.email == "") {
		alert("이메일을 입력하십시오");
		document.signUpFrm.email.focus();
		return;
	}
	
	if(sFrm.phone == "") {
		alert("휴대폰 번호를 입력하십시오");
		document.signUpFrm.phone.focus();
		return;
	}
	
	let str=sFrm.email.value;			// poohharry@naver.com
    let atPos = str.indexOf('@');					// 9
    let atLastPos = str.lastIndexOf('@');			// 9
    let dotPos = str.indexOf('.'); 					// 15
    let spacePos = str.indexOf(' ');				// -1
    let commaPos = str.indexOf(',');				// -1
    let eMailSize = str.length;						// 18
    
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
    sFrm.submit();
}



