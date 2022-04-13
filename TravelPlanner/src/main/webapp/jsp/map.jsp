<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  String id = (String)session.getAttribute("lgnId");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지도페이지</title>
    <link rel="stylesheet" href="../css/main.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <aside id="basket">
        <div class="basket_title">
            <button onclick="cart_close()">닫기</button>
            <span style="text-align: center; line-height: 30px;">장바구니 목록</span>
        </div>
        <div id="inner_basket">

        </div>
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
                    <%if(id != null) {
                    	if(id.length() < 9) {
                    	out.print(id + "님");                    		
                    	}else {
                    		out.print(id.substring(0, 6) + "...님");
                    	}%>
                    	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
                    <%}else {%>
                        <a href="login.jsp">로그인</a><!-- 로그인페이지로 이동하기 위한 로그인 하이퍼링크 -->
                    <% }%>
                        <button onclick="cart_open();">장바구니</button>
                    </div>
                </div>
        </header>
        <main>
            <div class="font" id="main_contents">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3262.267604939671!2d129.06122025115224!3d35.
                14994626643519!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568eb7bb57655cf%3A0x7285d314993b9340!2z67a
                A7IKw6rSR7Jet7IucIOu2gOyCsOynhOq1rCDsoITtj6zrj5kgODkyLTIx!5e0!3m2!1sko!2skr!4v1643087063028!5m2!1sko!2skr" 
                width="100%" height="600px" style="border:0; z-index: -50;" allowfullscreen="" loading="lazy"></iframe>
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