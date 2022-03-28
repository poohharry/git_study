<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ȸ������</title>
    <link rel="stylesheet" href="../css/main.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <aside id="basket">
        <div class="basket_title">
            <button onclick="cart_close()">�ݱ�</button>
            <span style="text-align: center; line-height: 30px;">��ٱ��� ���</span>
        </div>
        
        <div><a href="#">���� 1</a></div>
        <div><a href="#">���� 2</a></div>
        <div><a href="#">���� 3</a></div>
        <div><a href="#">���� 4</a></div>
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
        <main class="container" style="height: 100%; width: 100%;">
            <div class="font" id="main_contents">

                <form style="margin: 30px;">
                    <!-- �������� -->
                    <fieldset style="margin: 30px auto; width: 600px;">
                        <legend>��������</legend>
                        <ul style="list-style-type: none;">
                            <li>���̵�<input type="text"></li>
                            <li>��й�ȣ<input type="password"></li>
                            <li>�̸���<input type="email"></li>
                        </ul>
                    </fieldset>
                    <!-- �������� -->
                    <fieldset style="margin: 30px auto; width: 600px;">
                        <legend>��������</legend>
                        <ul style="list-style-type: none;">
                            <li>�̸�<input type="text"></li>
                            <li>�ֹι�ȣ<input type="text" style="width: 60px;">- <input type="text" style="width: 70px;"><input type="button" value="�Ǹ�Ȯ��"></li>
                            <li>�ּ�<input type="text"> <input type="button" value="�ּ�ã��"></li>
                            <li>���ּ�<input type="text"></li>
                        </ul>
                    </fieldset>
                    <input type="submit" value="�����ϱ�">
                </form>
            </div>
        </main>
        <footer>
            <div>
                <p><b>Help : </b> <a href="#">010-4240-3631</a> <a href="#" class="test"> poohharry@naver.com</a></p>
                <p><b>Address : </b> �λ걤���� �λ����� ������ 892-21</p>
                <p><b>Donation : </b> ������� 980-006030-01-019</p>
            </div>
        </footer>
    </div>
    <script src="../js/cart.js"></script>
</body>
</html>