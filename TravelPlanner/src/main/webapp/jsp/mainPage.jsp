<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>����������</title>
    <style>
        
    </style>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/mainPage.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> <!-- aos ���̺귯�� -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> <!-- aos -->

</head>
<body>
    <div id="bg">

        <!-- ��ٱ��� -->
        <aside id="basket">
            <div class="basket_title">
                <button onclick="cart_close()">�ݱ�</button>
                <span style="text-align: center; line-height: 30px;">��ٱ��� ���</span>
            </div>
            <div id="inner_basket">

            </div>

        </aside>
        <div class="default_layout"> <!-- w:1200 h:�ּ� 1500 -->
            <div style="text-align: right; font-size: 8pt;">�� ����</div>
            <br>

            <header>
                <!-- ���������� �̵��� �ΰ� �׸� -->
                <div class="logoBox"> <!-- w:150 h:75 -->
                    <a href="mainPage.jsp"><img src="../img/logo.jpg" alt="�ΰ�" id="logo"></a> 
                </div>
                
                <!-- �׺��  -->
                <nav> <!-- w:800, h:75 -->
                    <ul class="nav_menu">
                        <li><a href="introduce.jsp" class="nav_display">�Ұ�</a></li> <!-- w:160 h:75 -->
                        <li><a href="map.jsp" class="nav_display">����</a> </li>
                        <li><a href="location.jsp" class="nav_display">��õ������</a>
                            <ul class="caption">
                                <li><a href="#" class="caption_display">���</a></li>
                                <li><a href="#" class="caption_display">����</a></li>
                                <li><a href="#" class="caption_display">���ֵ�</a></li>
                                <li><a href="#" class="caption_display">������</a></li>
                            </ul>
                        </li>

                        <li><a href="restaurant.jsp" class="nav_display">��õ�Ĵ�</a>
                            <ul class="caption">
                                <li><a href="#" class="caption_display">�ѽ�</a></li>
                                <li><a href="#" class="caption_display">�Ͻ�</a></li>
                                <li><a href="#" class="caption_display">�߽�</a></li>
                                <li><a href="#" class="caption_display">���</a></li>
                                <li><a href="#" class="caption_display">����Ʈ, ī��</a></li>
                            </ul>
                        </li>
                        <li><a href="rest.jsp" class="nav_display">��õ����</a>
                            <ul class="caption">
                                <li><a href="#" class="caption_display">ȣ��</a></li>
                                <li><a href="#" class="caption_display">����</a></li>
                                <li><a href="#" class="caption_display">�����Ͽ콺</a></li>

                            </ul>
                        </li>
                    </ul>
                </nav>
                    
                    
                <!-- �α��� �� ��ٱ��� ��ư -->
                <div class="login_cart">
                    <div style="margin: 5px;">
                        <a href="login.jsp">�α���</a><!-- �α����������� �̵��ϱ� ���� �α��� �����۸�ũ -->
                        <button onclick="cart_open();">��ٱ���</button>

                        <!-- ������ �̵��� �ƴ� ��ư�� ������ ��� ���̵�ٷ� �������� ���� ����-->
                    </div>
            
                </div>
            </header>
            
            <!-- ���� ������ -->

            <main>
                <!-- ������ ���� -->
                <div style="height: 1000px;">
                    <!-- AOS�� ���� �������鿡�� �������� �� ���� -->

                </div>

                <!-- ��⵵ ���� -->
                <div style="height: 1000px;">


                </div>

                <!-- ���� ���� -->
                <div style="height: 1000px;">


                </div>

                <!-- ���ֵ� ���� -->
                <div style="height: 1000px;">


                </div>


                
            </main>
        
            <!-- ��Ÿ ������ -->
            <footer>
                <div>
                    <p><b>Help : </b> <a href="#">010-4240-3631</a> <span class="test"> poohharry@naver.com</span></p>
                    <p><b>Address : </b> �λ걤���� �λ����� ������ 892-21</p>
                    <p><b>Donation : </b> ������� 980-006030-01-019</p>
                </div>
            </footer>
        </div> 
    </div>
    <script src="../js/cart.js"></script>
    <script src="../js/main.js"></script>
</body>
</html>