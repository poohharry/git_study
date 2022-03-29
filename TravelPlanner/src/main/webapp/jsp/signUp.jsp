<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/main.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <aside id="basket">
        <div class="basket_title">
            <button onclick="cart_close()">닫기</button>
            <span style="text-align: center; line-height: 30px;">장바구니 목록</span>
        </div>
        
        <div><a href="#">예시 1</a></div>
        <div><a href="#">예시 2</a></div>
        <div><a href="#">예시 3</a></div>
        <div><a href="#">예시 4</a></div>
    </aside>
    <div class="default_layout"> <!-- w:1200 h:최소 1500 -->
        <div style="text-align: right; font-size: 8pt;">윗 공간</div>
        <br>
        

        <header>
            <!-- 메인페이지 이동용 로고 그림 -->
            <div class="logoBox"> <!-- w:150 h:75 -->
                <a href="mainPage.jsp"><img src="../img/logo.jpg" alt="로고" id="logo"></a> 
            </div>
            
            <!-- 네비바  -->
            <nav> <!-- w:800, h:75 -->
                <ul class="nav_menu">
                    <li><a href="introduce.jsp" class="nav_display">소개</a></li> <!-- w:160 h:75 -->
                    <li><a href="map.jsp" class="nav_display">지도</a> </li>
                    <li><a href="location.jsp" class="nav_display">추천관광지</a>
                        <ul class="caption">
                            <li><a href="#" class="caption_display">경상도</a></li>
                            <li><a href="#" class="caption_display">전라도</a></li>
                            <li><a href="#" class="caption_display">제주도</a></li>
                            <li><a href="#" class="caption_display">강원도</a></li>
                        </ul>
                    </li>

                    <li><a href="restaurant.jsp" class="nav_display">추천식당</a>
                        <ul class="caption">
                            <li><a href="#" class="caption_display">한식</a></li>
                            <li><a href="#" class="caption_display">일식</a></li>
                            <li><a href="#" class="caption_display">중식</a></li>
                            <li><a href="#" class="caption_display">양식</a></li>
                            <li><a href="#" class="caption_display">디저트, 카페</a></li>
                        </ul>
                    </li>
                    <li><a href="rest.jsp" class="nav_display">추천숙소</a>
                        <ul class="caption">
                            <li><a href="#" class="caption_display">호텔</a></li>
                            <li><a href="#" class="caption_display">모텔</a></li>
                            <li><a href="#" class="caption_display">쉐어하우스</a></li>

                        </ul>
                    </li>
                </ul>
            </nav>
                
                
            <!-- 로그인 및 장바구니 버튼 -->
            <div class="login_cart">
                <div style="margin: 5px;">
                    <a href="login.jsp">로그인</a><!-- 로그인페이지로 이동하기 위한 로그인 하이퍼링크 -->
                    <button onclick="cart_open();">장바구니</button>

                    <!-- 페이지 이동이 아닌 버튼을 눌렀을 경우 사이드바로 나오도록 만들 예정-->
                </div>
           
            </div>
        </header>
        <main class="container" style="height: 100%; width: 100%;">
            <div class="font" id="main_contents">

                <form name="signUpFrm" method="post" action="signUpProc.jsp" style="margin: 30px;">
                    <!-- 계정정보 -->
                    <fieldset style="margin: 30px auto; width: 600px;">
                        <legend>계정정보</legend>
                        <ul style="list-style-type: none;">
                            <li>아이디<input type="text"></li>
                            <li>비밀번호<input type="password"></li>
                            <li>이메일<input type="email"></li>
                        </ul>
                    </fieldset>
                    <!-- 개인정보 -->
                    <fieldset style="margin: 30px auto; width: 600px;">
                        <legend>개인정보</legend>
                        <ul style="list-style-type: none;">
                            <li>이름<input type="text"></li>
                            <li>주민번호<input type="text" style="width: 60px;">- <input type="text" style="width: 70px;"><input type="button" value="실명확인"></li>
                            <li>주소<input type="text"> <input type="button" value="주소찾기"></li>
                            <li>상세주소<input type="text"></li>
                        </ul>
                    </fieldset>
                    <input type="submit" value="가입하기">
                </form>
            </div>
        </main>
        <footer>
            <div>
                <p><b>Help : </b> <a href="#">010-4240-3631</a> <a href="#" class="test"> poohharry@naver.com</a></p>
                <p><b>Address : </b> 부산광역시 부산진구 전포동 892-21</p>
                <p><b>Donation : </b> 기업은행 980-006030-01-019</p>
            </div>
        </footer>
    </div>
    <script src="../js/cart.js"></script>
</body>
</html>