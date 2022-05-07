'use strict'

// onclick에 목적지 url을 담아서 함수를 호출
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
		// 장바구니 아이템과 목적지 url을 담아서 get방식으로 넘겨줌
		let url = "locationProc.jsp"+"?loName=" + item + "&url=" + pageUrl;
		location.href=url;
	}
}