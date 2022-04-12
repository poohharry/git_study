'use strict'

function loginChk() {
	
	const frm = document.loginFrm;
	
	if(frm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		frm.id.focus();
		return;
	}
	if (frm.pw.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.loginFrm.pwd.focus();
		return;
	}
	
	
	
	frm.submit();
	//location.href = `loginProc.jsp?id=${frm.id.value}&pw=${frm.pw.value}`;
}