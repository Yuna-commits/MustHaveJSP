<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("pageAttribute", "김유신");
	request.setAttribute("requestAttribute", "계백");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>액션 태그를 이용한 포워딩</h1>
	<!-- 포워드 태그 이전의 모든 출력은 제거됨 -->
	<jsp:forward page="/chapter/ch07_ActionTag/ForwardSub.jsp" />
</body>
</html>