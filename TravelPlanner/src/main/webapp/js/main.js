let scrollPosition; // 현재 스크롤
let bg = $("#bg");
let scrollIdx = 0; // 스크롤 인덱스 조절해줄 변수
let preScroll = 0; // 이전 스크롤
let bgIdx = 0;

// 스크롤 비율에 따른 배경색 바꾸기
function getScrollPosition() {
    scrollPosition = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
    // if(scrollPosition < 25 && scrollPosition >= 0) {
    //     // $("#nd01").css({"background":"url(img.png)"});
    //     bg.css({"background-image":"url(../img/main_gangwon.png)"});
    // }else if(scrollPosition < 50) {
    //     bg.css({"background-image": "url(../img/main_gyeong.png)"});
    // }else if(scrollPosition < 75) {
    //     bg.css({"background-image": "url(../img/Jeolla-logo.jpg)"});
    // }else if(scrollPosition <= 100) {
    //     bg.css({"background-image": "url(../img/jeju-logo.jpg)"});
    // }

    calSc();
    console.log("scrollIdx "+ scrollIdx);
    console.log("bgIdx "+ bgIdx);
    
    bg.css({"background-image":`url(${bgImg[bgIdx]})`});
    
}

function calSc() {
    scrollIdx += scrollPosition - preScroll;
    preScroll = scrollPosition;
    if(bgImg.length - 1 != bgIdx){
        if(scrollIdx == 25) {
            bgIdx++;
            scrollIdx = 0;
        } else if(scrollIdx == -25) {
            bgIdx--;
            scrollIdx = 0;
        }
    }else {
        if(scrollIdx == 25) scrollIdx = 0;
        else if(bgIdx == -25) {
            bgIdx--;
            scrollIdx = 0;
        }
    }

    if(bgIdx == 0 && scrollIdx == -25) {
        bgIdx = 0;
    }
    
} 

// 스크롤을 움직일때마다 해당 함수가 실행
$(window).scroll(getScrollPosition)

// 배경색 배열(아침 -> 밤-> 아침)
let bgImg = new Array(
    "../img/main_gangwon.png", 
    "../img/main_gyeong.png", 
    "../img/Jeolla-logo.jpg",
    "../img/jeju-logo.jpg"
);
