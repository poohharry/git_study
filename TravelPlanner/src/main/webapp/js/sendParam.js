'use strict'



function sendParam(pageUrl) {
	let arr = new Array();
	/* 장바구니가 비어있을때도 로그인 페이지로 이동가능하게 만들어줄 필요가 있음 */
	arr = document.getElementsByName("loca");
	let item = "";
	if(arr == null) {
		location.href = pageUrl
	}else {
		// arr의 길이 (등록된 장바구니 개수)만큼 반복문을 돌려서 파라미터값을 만들어 줌
		for(let i = 0; i < arr.length; i++) {
			if(i != 0) {
				item += "," + arr[i].innerHTML;
			}else {
				item = arr[i].innerHTML;
			}
		}
		let url = "locationProc.jsp"+"?loName=" + item + "&url=" + pageUrl;
		location.href=url;
	}
}