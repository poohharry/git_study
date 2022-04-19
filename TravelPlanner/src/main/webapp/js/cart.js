'use strict'
 
const main_cart = $('#basket');			// 사이드 장바구니 전체
const inner_cart = $('#inner_basket');		// 사이드 장바구니 안의 실제 물품이 담기는 공간
const member_cart = $('#member_basket');	// 로그인 했을 경우 나오는 장바구니

let cartBox ;

// 세션스토리지가 비어있으면 공백의 cartBox를, 하나라도 차 있다면 세션스토리지에서 갖고온 값을 디폴트로
if(sessionStorage.cartClassKey == undefined) {
	cartBox = [];
	console.log('빈 배열 생성');
}else {
	cartBox = JSON.parse(sessionStorage.cartClassKey);
	inner_cart.html(JSON.parse(sessionStorage.jInner));
	console.log('배열 불러옴');
}
let cartNum = cartBox.length;      // 클래스 번호

/* 
	들어가야할 요소 및 기능들

	name
	photo
	a태그를 통해 상세정보 보기 가능  
	장바구니에서 삭제하는 버튼
	추가 할 때 그냥 딱 들어가는 것이 아니라 스르륵? 들어가게 함
	
*/


// 장바구니 내용을 담고 있는 클래스
class Cart_content {
	name;
	img;          
	content;
	btnid;
	
	constructor(_name, _img, _id) {
		this.name = _name;
		this.img = _img;
		this.btnid = _id;
	}

}// Cart_content

function cart_open() {                     // 장바구니 열기
	main_cart.css('right', "0px");
	main_cart.css('transitionDuration', "1s");
}
function cart_close() {                    // 장바구니 닫기
	main_cart.css('right', "-320px");
	main_cart.css('transitionDuration', "1s");
}


// 장바구니에 담기
function in_cart(lo_name, add, id) {   // (지역이름, 이미지 주소)
	// $(`#${id}`).attr("disabled", true);
	// document.getElementById(`${id}`).disabled = true;
	console.log(document.getElementById(`${id}`));

	cartBox.push(new Cart_content(lo_name, add, id));

	//클래스에 들어갈 html코드
	cartBox[cartNum].content = 
	`<div class="inner_cart">
	<img src="${add}" class="inner_cart_img">
	<span name="loca">${cartBox[cartNum].name}</span>
	<button class="Xbutton" onclick="out_cart(${cartNum}, '${id}')">X</button>
	</div>
	<hr style="margin: 5px 0;">`;


	let allCon = "";
	allCon = all_inner_cart();
	let jsonVal = JSON.stringify(allCon);
	sessionStorage.jInner = jsonVal;
	inner_cart.html(JSON.parse(sessionStorage.jInner));

	// inner_cart.innerHTML = all_inner_cart();
	cartNum++;

	sessionStorage.cartClassKey = JSON.stringify(cartBox);	// 배열에 새로운 클래스 추가 이후 바로 클래스 배열을
																		// JSON.stringify로 문자열화 시킨뒤, 세션스토리지에 저장.
																		/* [{name: "제주도", img: "../img/jeju-logo.jpg"}]
																			0: {name: "제주도", img: "../img/jeju-logo.jpg"}
																				img: "../img/jeju-logo.jpg"
																				name: "제주도" */

	for(let i = 0; i < cartBox.length; i++) {
		console.log(cartBox[i].btnid);
	}
}// in_cart 


// 장바구니에서 뺴기
function out_cart(num, id) {
	
	// console.log(document.getElementById(`${id}`)); -> null
	// document.getElementById(`${id}`).disabled = false; 
	cartBox.splice(num, 1);

	for(let i = 0; i < cartBox.length; i++) {
		cartBox[i].content = changeContent(i, cartBox[i].img, cartBox[i].name, cartBox[i].btnid);
	}
	let allCon = all_inner_cart();
	let jsonVal = JSON.stringify(allCon);

	// 페이지 이동후 돌아와서 추가를 하는데 세션스토리지에 들어있는것을 무시한채 처음부터 다시 세팅하도록 하는 방식이 문제
	sessionStorage.jInner = jsonVal;
	inner_cart.html(JSON.parse(sessionStorage.jInner));

	// inner_cart.innerHTML = all_inner_cart();
	cartNum--;
	sessionStorage.cartClassKey = JSON.stringify(cartBox);
}// out_cart


// 모든 장바구니 클래스를 합쳐서 리턴
// 세션스토리지를 스캔 후 안에 내용물을 먼저 카트박스에 담아둘 필요가 있음 
// 현재는 페이지를 새로고침 했을때 카트박스가 텅 비어있는 상태로 페이지가 열림
// 장바구니 추가 버튼을 눌러야 카트박스가 채워짐
// -> 카트박스를 세션스토리지(key 2)에 저장 -> getitem으로 카트박스를 불러옴 -> 불러온 카트박스에 담긴 콘텐츠를 세션스토리지(key 1)에 저장
function all_inner_cart() {
	let inner_contents = "";
	for(let i = 0; i < cartBox.length; i++) {

		inner_contents += cartBox[i].content;
		sessionStorage.jInner = cartBox[i];
	}
	return inner_contents;
}// all_inner_cart

function changeContent(num, img, name, id) { // 장바구니에서 뺄 때 마다 클래스의 x버튼 대응을 위해 html코드를 갱신시켜줌
	let a = `<div class="inner_cart">
	<img src="${img}" class="inner_cart_img">
	<span name="loca">${name}</span>
	<button class="Xbutton" onclick="out_cart(${num}, ${id})">X</button>
	</div>
	<hr style="margin: 5px 0;">`;
	return a;
}