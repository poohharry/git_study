<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cMgr" class="PoolPack.CartMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("lgnId");
	

	// 쿼리로 던진 파라미터를 받아옴
	String name = request.getParameter("loName");
	// 더미 계정에 임시로 장바구니 아이템을 등록
	cMgr.insertTempCart(name);
	
	String url = request.getParameter("url");
%>


<script type="text/javascript">
location.href = "<%=url%>";
</script>