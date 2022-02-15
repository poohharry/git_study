'use strict'

const cart1 = document.getElementById('basket');
let cartBox = [];
let cartNum = 0;

/* 
	들어가야할 요소 및 기능들

	name
	photo
	a태그를 통해 상세정보 보기 가능
	장바구니에서 삭제하는 버튼
*/



class Cart_content {
	constructor() {
		this.name = "";
		this.img = "";
	}
}

/* let ab = new Array();
let a1 = new Cart_content;
let a2 
ab[0] = new Cart_content; */


function cart_open() {                     // 장바구니 열기
	cart1.style.right = "0px";
	cart1.style.transitionDuration = "1s";
}

function cart_close() {                    // 장바구니 닫기
	cart1.style.right = "-320px";
	cart1.style.transitionDuration = "1s";
}

function in_cart(lo_name, add) {
	cartBox.push(new Cart_content);
	cartBox[cartNum].name = lo_name;
	cartBox[cartNum].img = add;
	cart1.innerHTML += 
	`<div class="inner_cart">
	<img src="${add}" class="inner_cart_img">
	${cartBox[cartNum].name}
	<button onclick="out_cart">X</button>
	</div>
	<hr style="margin: 5px 0;">
	`
	cartNum++;
}
function out_cart() {



	cartNum--;
}