<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>포워드 결과</h1>
	<ul>
		<li>page 영역 : <%=pageContext.getAttribute("pageAttribute") %> : page 영역은 공유되지 않음!</li>
		<li>request 영역 : <%=request.getAttribute("requestAttribute") %></li>
	</ul>
</body>
</html>