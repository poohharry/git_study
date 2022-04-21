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
    <title>추천관광지</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="shortcut icon" href="#">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
    	function asd() {
    		let arr = new Array();
    		arr = document.getElementsByName("loca");
    		
			let url = "login.jsp?loName="+ arr[0].innerHTML+ "," + arr[1].innerHTML;
			location.href=url;
    		
			
    	}
    </script>
    
</head>
<body>
    <aside id="basket">
        <div class="basket_title">
            <button onclick="cart_close()">닫기</button>
            <span style="text-align: center; line-height: 30px;">장바구니 목록</span>
        </div>
        <%if(id == null) {%>
        <div id="inner_basket">

        </div>
        <%} else {%>
        <div id="member_basket">
        	
        </div>
        <%}%>
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
                        <a onclick="asd()">로그인</a><!-- 로그인페이지로 이동하기 위한 로그인 하이퍼링크 -->
                        <!-- <a href="login.jsp?loName=jeju,gyeongi"> -->
                    <% }%>
                        <button onclick="cart_open();">장바구니</button>
                    </div>
                </div>
        </header>
        <main >
            <div class="main_contents">
                <hr style="clear: left; border: 0; height: 1px; margin: 0 0 5px 0;" color="black">

                <div data-aos="fade-out" class="lo_content_box">
                    <div class="lo_photo">
                        <a href="#"><img src="../img/jeju-logo.jpg" width="400px" height="270.25px"></a>
                    </div>
                    <div class="lo_text">
                        <h3>제주도 </h3><button id="jeju" class="cartBtn" onclick="in_cart('제주도', '../img/jeju-logo.jpg', 'jeju')">장바구니 넣기</button>
                        <br><br>
                        <p>도시를 벗어나 바닷바람 맞으며 힐링하고 싶을 때</p>
                        <br><br>
                        <div class="tag_text">
                            tag : 식도락
                        </div>
                    </div>
                </div>

                <hr class="lo_hr" color="black">
                
                <div data-aos="fade-out" class="lo_content_box">
                    <div class="lo_photo">
                        <a href="#"><img src="../img/gangwon-logo.jpg" width="400px" height="270.25px"></a>
                    </div>
                    <div class="lo_text">
                        <h3>강원도</h3><button id="gangwon" class="cartBtn" onclick="in_cart('강원도', '../img/gangwon-logo.jpg', 'gangwon')">장바구니 넣기</button>
                        <br><br>
                        <p>산과 바다를 느끼고 싶을 때</p>
                        <br><br>
                        <div class="tag_text">
                            tag : 산, 해안도로
                        </div>
                    </div>
                    
                </div>
                
                <hr class="lo_hr" color="black">
                
                <div data-aos="fade-out" class="lo_content_box">
                    <div class="lo_photo">
                        <a href="#"><img src="../img/gyeonggi-logo.jpg" width="400px" height="270.25px"></a>
                        
                    </div>
                    <div class="lo_text">
                        <h3>경기도</h3><button id="gyeonggi" class="cartBtn" onclick="in_cart('경기도', '../img/gyeonggi-logo.jpg', 'gyeonggi')">장바구니 넣기</button>
                        <br><br>
                        <p>도시속 여행을 원할 때</p>
                        <br><br>
                        <div class="tag_text">
                            tag : 당일치기
                        </div>
                    </div>
                </div>
                <hr class="lo_hr" color="black">
                <div data-aos="fade-out" class="lo_content_box">
                    <div class="lo_photo">
                        <a href="#"><img src="../img/Jeolla-logo.jpg" width="400px" height="270.25px"></a>
                        
                    </div>
                    <div class="lo_text">
                        <h3>전라도</h3><button id="jeolla" class="cartBtn" onclick="in_cart('전라도', '../img/Jeolla-logo.jpg', 'jeolla')">장바구니 넣기</button>
                        <br><br>
                        <p>식도락 여행의 진수를 느끼고 싶을 때</p>
                        <br><br>
                        <div class="tag_text">
                            tag : 식도락
                        </div>
                    </div>
                </div>
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

    <script>
        AOS.init();
    </script>
    <script defer src="../js/cart.js"></script>
</body>
</html>