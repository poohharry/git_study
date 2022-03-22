let scrollPosition;
let bg = $("#bg");
let scrollRate = 0;

// 스크롤 비율에 따른 배경색 바꾸기
function getScrollPosition() {
    scrollPosition = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
    if(scrollPosition < 25 && scrollPosition >= 0) {
        // $("#nd01").css({"background":"url(img.png)"});
        bg.css({"background-image":"url(../img/main_gangwon.png)"});
    }else if(scrollPosition < 50) {
        bg.css({"background-image": "url(../img/main_gyeong.png)"});
    }else if(scrollPosition < 75) {
        bg.css({"background-image": "url(../img/Jeolla-logo.jpg)"});
    }else if(scrollPosition <= 100) {
        bg.css({"background-image": "url(../img/jeju-logo.jpg)"});
    }

    console.log(scrollPosition);
}

 
// function getScrollPosition() {
//     scrollPosition = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
//     scrollRate = scrollPosition;
//     if(scrollRate >= 25) {
//         scrollRate - 25
//     }
// }


// 스크롤을 움직일때마다 해당 함수가 실행
$(window).scroll(getScrollPosition)

// 배경색 배열(아침 -> 밤-> 아침)
let bgColor = new Array(
    "../img/main_gangwon.png", 
    "../img/main_gyeong.png", 
    "../img/Jeolla-logo.jpg",
    "../img/jeju-logo.jpg"
);