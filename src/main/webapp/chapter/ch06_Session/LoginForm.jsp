<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/Link.jsp" />
	<h1>로그인 페이지</h1>
	<span style="color: red; font-size: 1.2em">
	<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	// 로그아웃 상태
	if (session.getAttribute("UserId") == null) {
	%>
	<script>
		// id, pw 유효성 검사
		function validateForm(form) {
			if(!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!form.user_pw.value) {
				alert("패스워드를 입력하세요.")}
				return false;
			}
		}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginForm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id"><br> 
		패스워드 : <input type="password" name="user_pw"><br>
		<input type="submit" value="로그인">
	</form>
	<%
	// 로그인 상태
	} else {
	%>
	<%=session.getAttribute("UserName")%>
	회원님, 반갑습니다.
	<br>
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>