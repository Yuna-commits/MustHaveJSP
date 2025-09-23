<%@ page import="utils.CookieManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 첫 로그인이면 loginId = "" 
	String loginId = CookieManager.readCookie(request, "loginId");
	String isChecked = "";
	
	// loginId에 값이 있으면 체크박스 체크 표시
	if(!"".equals(loginId)) {
		isChecked = "checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기!!</title>
</head>
<body>
 	<h2>로그인 페이지</h2>
    <form action="IDSaveProcess.jsp" method="post">
    아이디 : <input type="text" name="userId" value="<%= loginId %>" />  
        <input type="checkbox" name="saveCheck" value="Y" <%= isChecked %> />
        아이디 저장하기
    <br />
    패스워드 : <input type="text" name="userPw" />
    <br />
    <input type="submit" value="로그인하기" />
    </form>
</body>
</html>