'use strict'
 
const main_cart = document.getElementById('basket');			// 사이드 장바구니 전체
const inner_cart = document.getElementById('inner_basket');		// 사이드 장바구니 안의 실제 물품이 담기는 공간
let cartNum = 0;      // 클래스 번호
let cartBox ;
// let cartBox = sessionStorage.getItem('cartClassKey');	  // 클래스 배열


// 세션스토리지가 비어있으면 공백의 cartBox를, 하나라도 차 있다면 세션스토리지에서 갖고온 값을 디폴트로
if(sessionStorage.getItem('cartClassKey') == undefined) {
	cartBox = [];
}else {
	cartBox = JSON.parse(sessionStorage.getItem('cartClassKey'));
}

// if(sessionStorage.getItem('cartClassKey') != null) {
// 	cartBox = JSON.parse(sessionStorage.getItem('cartClassKey'));
// } else{
// 	cartBox = [];	
// } 



if(sessionStorage.getItem('jInner') != null) {
	inner_cart.innerHTML =JSON.parse(sessionStorage.getItem('jInner'));
}

/* 
	들어가야할 요소 및 기능들

	name
	photo
	a태그를 통해 상세정보 보기 가능  
	장바구니에서 삭제하는 버튼
*/


// 장바구니 내용을 담고 있는 클래스
class Cart_content {
	name;
	img;          
	content;
	arrIdx;

	constructor(_name, _img) {
		this.name = _name;
		this.img = _img;
	}

}// Cart_content

function cart_open() {                     // 장바구니 열기
	main_cart.style.right = "0px";
	main_cart.style.transitionDuration = "1s";
}

function cart_close() {                    // 장바구니 닫기
	main_cart.style.right = "-320px";
	main_cart.style.transitionDuration = "1s";
}


// 장바구니에 담기
function in_cart(lo_name, add) {   // (지역이름, 이미지 주소)

	// sessionStorage.getItem('jInner');
	// 스캔 -> 세션에 있는 카트박스 먼저 채우기 -> ?
	// 호출할때마다 세션 스캔은 너무 비효율적.

	cartBox.push(new Cart_content(lo_name, add));
	sessionStorage.setItem("cartClassKey", JSON.stringify(cartBox));	// 배열에 새로운 클래스 추가 이후 바로 클래스 배열을
																		// JSON.stringify로 문자열화 시킨뒤, 세션스토리지에 저장.
																		/* [{name: "제주도", img: "../img/jeju-logo.jpg"}]
																			0: {name: "제주도", img: "../img/jeju-logo.jpg"}
																				img: "../img/jeju-logo.jpg"
																				name: "제주도" */

	//클래스에 들어갈 html코드
	cartBox[cartNum].content = 
	`<div class="inner_cart">
	<img src="${add}" class="inner_cart_img">
	${cartBox[cartNum].name}
	<button class="Xbutton" onclick="out_cart(${cartNum})">X</button>
	</div>
	<hr style="margin: 5px 0;">`;


	let allCon = "";
	allCon = all_inner_cart();
	let jsonVal = JSON.stringify(allCon);
	sessionStorage.setItem('jInner', jsonVal);
	inner_cart.innerHTML =JSON.parse(sessionStorage.getItem('jInner'));

	// inner_cart.innerHTML = all_inner_cart();
	cartNum++;
}// in_cart


// 장바구니에서 뺴기
function out_cart(num) {

	cartBox.splice(num, 1);

	for(let i = 0; i < cartBox.length; i++) {
		cartBox[i].content = changeContent(i, cartBox[i].img, cartBox[i].name);
	}
	let allCon = all_inner_cart();
	let jsonVal = JSON.stringify(allCon);

	// 페이지 이동후 돌아와서 추가를 하는데 세션스토리지에 들어있는것을 무시한채 처음부터 다시 세팅하도록 하는 방식이 문제
	sessionStorage.setItem('jInner', jsonVal);
	inner_cart.innerHTML = JSON.parse(sessionStorage.getItem('jInner'));

	// inner_cart.innerHTML = all_inner_cart();
	cartNum--;
	
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
		sessionStorage.setItem('jInner', cartBox[i]);
	}
	return inner_contents;
}// all_inner_cart

function changeContent(num, img, name) { // 장바구니에서 뺄 때 마다 클래스의 x버튼 대응을 위해 html코드를 갱신시켜줌
	let a = `<div class="inner_cart">
	<img src="${img}" class="inner_cart_img">
	${name}
	<button class="Xbutton" onclick="out_cart(${num})">X</button>
	</div>
	<hr style="margin: 5px 0;">`;
	return a;
}

