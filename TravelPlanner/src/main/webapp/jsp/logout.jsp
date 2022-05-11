<%@ page contentType="text/html; charset=UTF-8"%>
<%
      session.invalidate();
%>
<script>
	// 세션 스토리지 초기화
	sessionStorage.clear();
	alert('로그아웃 되었습니다.');
	location.href="mainPage.jsp";
</script>