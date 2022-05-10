<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="PoolPack.MemberMgr"/>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String url = "login.jsp";
	String msg = "";
	int num = mMgr.login(id, pw);
	
	switch(num) {
	case 1: msg = "아이디가 없습니다.";
		break;
	case 2: msg = "비밀번호가 일치하지 않습니다.";
		break;
	case 3: {
		msg = "로그인에 성공하였습니다.";
		url = "mainPage.jsp";
		session.setAttribute("lgnId", id);
	}
		break;
	}
%>
<script>
	sessionStorage.clear();
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>