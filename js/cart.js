'use strict'

const main_cart = document.getElementById('basket');
const inner_cart = document.getElementById('inner_basket');
let cartBox = [];
let cartNum = 0;

/* 
	들어가야할 요소 및 기능들

	name
	photo
	a태그를 통해 상세정보 보기 가능
	장바구니에서 삭제하는 버튼
*/


// 장바구니 내용을 담고 있는 클래스
class Cart_content {
	constructor() {
		this.name = "";
		this.img = "";
		this.content = "";
	}
}


function cart_open() {                     // 장바구니 열기
	main_cart.style.right = "0px";
	main_cart.style.transitionDuration = "1s";
}

function cart_close() {                    // 장바구니 닫기
	main_cart.style.right = "-320px";
	main_cart.style.transitionDuration = "1s";
}

// 장바구니에 담기
function in_cart(lo_name, add) {
	cartBox.push(new Cart_content);
	cartBox[cartNum].name = lo_name;
	cartBox[cartNum].img = add;
	cartBox[cartNum].content = `
	<div class="inner_cart">
	<img src="${add}" class="inner_cart_img">
	${cartBox[cartNum].name}
	<button onclick="out_cart">X</button>
	</div>
	<hr style="margin: 5px 0;">
	`;
	inner_cart.innerHTML = all_inner_cart();
	cartNum++;
}

// 장바구니에서 뺴기
function out_cart() {



	cartNum--;
}


// 모든 장바구니 클래스를 합쳐서 리턴
function all_inner_cart() {
	let inner_contents;
	for(let i = 0; i < cartBox.length; i++) {
		inner_contents += cartBox[i].content;
	}
	return inner_contents;
}