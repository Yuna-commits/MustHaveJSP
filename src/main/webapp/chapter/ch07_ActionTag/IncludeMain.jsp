<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. include 할 파일의 경로
	String outerPath1 = "./inc/OuterPage1.jsp";
	String outerPath2 = "./inc/OuterPage2.jsp";
	
	// 2. page 영역, request 영역에 저장
	pageContext.setAttribute("pageAttribute", "동명왕");
	request.setAttribute("requestAttribute", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>지시어와 액션 태그 동작 방식 비교하기</h1>
	<h3>include 지시어로 페이지 포함하기</h3>
	<%@ include file="./inc/OuterPage1.jsp" %>
	<%--@ include file="<%=outerPath1" --%>
	<p>외부 파일에 선언한 변수 : <%=newVar1 %></p>
	
	<h3>include 액션 태그로 페이지 포함하기</h3>
	<jsp:include page="./inc/OuterPage2.jsp"/>
	<jsp:include page="<%=outerPath2 %>"></jsp:include>
	<!-- newVar2 : error -->
	<p>외부 파일에 선언한 변수 : <%--=newVar2 --%>error!</p>
</body>
</html>