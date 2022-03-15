let scrollPosition;
let bg = $("#bg");

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
 
// 스크롤을 움직일때마다 해당 함수가 실행
$(window).scroll(getScrollPosition)

