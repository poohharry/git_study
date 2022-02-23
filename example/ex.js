let cart;
let a;
let b = 'abc';
sessionStorage.setItem(1, b);
cart = document.getElementById('basket');

function plus() {
    a = sessionStorage.getItem(1);
    ba();
}

function ba() {
    b += 'abc';
    cart.innerHTML += sessionStorage.getItem(1);
}
