let scrollPosition;
let bg = $("#bg");
let scrollRate = 0;

// 스크롤 비율에 따른 배경색 바꾸기
function getScrollPosition() {
    scrollPosition = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
    if(scrollPosition < 33 && scrollPosition >= 0) {
        bg.css("background-color", "lightyellow");
    }else if(scrollPosition < 66) {
        bg.css("background-color", "lightskyblue");
    }else if(scrollPosition <= 100) {
        bg.css("background-color", "lightpink");
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