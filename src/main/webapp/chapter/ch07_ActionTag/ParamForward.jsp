<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request" />
	<h1>포워드된 페이지에서 매개변수 확인</h1>
	<ul>
		<li><jsp:getProperty property="name" name="person"/></li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
		<li>본명 : <%= request.getParameter("param1") %></li>
		<li>출생 : <%= request.getParameter("param2") %></li>
		<li>특징 : <%= request.getParameter("param3") %></li>
	</ul>
	
	<!-- 인클루드된 페이지의 매개변수 확인 -->
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param name="loc1" value="강원도 영월" />
		<jsp:param name="loc2" value="김삿갓면" />
	</jsp:include>
</body>
</html>