<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cMgr" class="PoolPack.CartMgr"/>
    
<%
  request.setCharacterEncoding("UTF-8");
  String id = (String)session.getAttribute("lgnId");
  
  // 로그인 성공시 무조건 mainPage로 오는데, 만약 더미계정에 장바구니가 등록된 상태라면
  // 회원 장바구니와 합쳐줘야 함
  if(id != null) { // 로그인 상태라면?
	  if(!cMgr.isEmpty("admin")) { // 더미 장바구니가 비어있지 않다면?
		  cMgr.mergeCart(id);	// 더미장바구니와 회원장바구니 병합
	  }
  }
  String items = cMgr.searchItems(id);
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <style>
        
    </style>
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/mainPage.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> <!-- aos 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> <!-- aos -->

</head>
<body>
    <div id="bg">

        <!-- 장바구니 -->
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
                    <a href="./jsp/mainPage.jsp"><img src="./img/logo.jpg" alt="로고" id="logo"></a> 
                </div>
                
                <!-- 네비바  -->
                <nav> <!-- w:800, h:75 -->
                    <ul class="nav_menu">
                        <li><a href="./jsp/introduce.jsp" class="nav_display">소개</a></li> <!-- w:160 h:75 -->
                        <li><a href="./jsp/map.jsp" class="nav_display">지도</a> </li>
                        <li><a href="./jsp/location.jsp" class="nav_display">추천관광지</a>
                            <ul class="caption">
                                <li><a href="#" class="caption_display">경상도</a></li>
                                <li><a href="#" class="caption_display">전라도</a></li>
                                <li><a href="#" class="caption_display">제주도</a></li>
                                <li><a href="#" class="caption_display">강원도</a></li>
                            </ul>
                        </li>

                        <li><a href="./jsp/restaurant.jsp" class="nav_display">추천식당</a>
                            <ul class="caption">
                                <li><a href="#" class="caption_display">한식</a></li>
                                <li><a href="#" class="caption_display">일식</a></li>
                                <li><a href="#" class="caption_display">중식</a></li>
                                <li><a href="#" class="caption_display">양식</a></li>
                                <li><a href="#" class="caption_display">디저트, 카페</a></li>
                            </ul>
                        </li>
                        <li><a href="./jsp/rest.jsp" class="nav_display">추천숙소</a>
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
                    	<input type="button" value="로그아웃" onclick="location.href='./jsp/logout.jsp'">
                    <%}else {%>
                        <a href="./jsp/login.jsp">로그인</a><!-- 로그인페이지로 이동하기 위한 로그인 하이퍼링크 -->
                    <% }%>
                        <button onclick="cart_open();">장바구니</button>
                    </div>
                </div>
            </header>
            
            <!-- 메인 콘텐츠 -->
            <main>
                <!-- 강원도 내용 -->
                <div style="height: 1000px;">
                    <!-- AOS로 내부 콘텐츠들에게 움직임을 줄 예정 -->
                    

                </div>

                <!-- 경기도 내용 -->
                <div style="height: 1000px;">


                </div>

                <!-- 전라도 내용 -->
                <div style="height: 1000px;">


                </div>

                <!-- 제주도 내용 -->
                <div style="height: 1000px;">


                </div>


                
            </main>
        
            <!-- 기타 정보들 -->
            <footer>
                <div>
                    <p><b>Help : </b> <a href="#">010-4240-3631</a> <span class="test"> poohharry@naver.com</span></p>
                    <p><b>Address : </b> 부산광역시 부산진구 전포동 892-21</p>
                    <p><b>Donation : </b> 기업은행 980-006030-01-019</p>
                </div>
            </footer>
        </div> 
    </div>
    <script src="./js/cart.js"></script>
    <script src="./js/main.js"></script>
</body>
</html>