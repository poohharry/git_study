'use strict'
 
const main_cart = document.getElementById('basket');
const inner_cart = document.getElementById('inner_basket');
let cartNum = 0;      // 클래스 번호
let cartBox = [];     // 클래스 배열
let xBox = [];        // 클래스안에 들어간 x버튼 배열(클래스배열의 인덱스와 x버튼 배열의 인덱스가 같음)

/* 
	들어가야할 요소 및 기능들

	name
	photo
	a태그를 통해 상세정보 보기 가능
	장바구니에서 삭제하는 버튼
*/


// 장바구니 내용을 담고 있는 클래스
class Cart_content {
	_name;
	_img;
	_content;
	_arrIdx;

	constructor(name, img) {
		this._name = name;
		this._img = img;
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

	/* 장바구니 담기 했을경우 중복으로 담는 것을 방지하기 위해 버튼을 비 활성화
	 	장바구니에서 삭제하면 다시 활성화시켜줄 예정*/
		  
	// let isBtnAble = document.getElementsByName('InBtn');
	// isBtnAble[cartNum].disabled = true;


	cartBox.push(new Cart_content(lo_name, add));
	
	//클래스에 들어갈 html코드
	cartBox[cartNum].content = 
	`<div class="inner_cart">
	<img src="${add}" class="inner_cart_img">
	${cartBox[cartNum]._name}
	<button class="Xbutton" onclick="out_cart(${cartNum})">X</button>
	</div>
	<hr style="margin: 5px 0;">`;
	inner_cart.innerHTML = all_inner_cart();
	cartNum++;
}// in_cart

// 장바구니에서 뺴기
function out_cart(num) {

	cartBox.splice(num, 1);

	for(let i = 0; i < cartBox.length; i++) {
		cartBox[i].content = changeContent(i, cartBox[i]._img, cartBox[i]._name);
	}
	inner_cart.innerHTML = all_inner_cart();
	cartNum--;
	
}// out_cart


// 모든 장바구니 클래스를 합쳐서 리턴
function all_inner_cart() {
	let inner_contents = "";
	for(let i = 0; i < cartBox.length; i++) {
		inner_contents += cartBox[i].content;
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