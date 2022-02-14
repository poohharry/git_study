'use strict'

var cart1 = document.getElementById('basket');

function cart_open() {
	cart1.style.right = "0px";
	cart1.style.transitionDuration = "1s";
}

function cart_close() {
	cart1.style.right = "-320px";
	cart1.style.transitionDuration = "1s";
}
