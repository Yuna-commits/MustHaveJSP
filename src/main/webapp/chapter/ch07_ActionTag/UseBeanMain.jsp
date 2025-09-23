<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp:useBean 액션 태그</h1>
	<h3>자바빈즈 생성하기</h3>
	<jsp:useBean id="person" class="common.Person" scope="request" />
	<p>
		1. common 패키지의 Person 클래스로 "person"이라는 이름의 자바빈즈 생성<br>
		2. request 영역에 저장<br>
		3. request 영역에서 "person"을 가져옴(없으면 생성)<br><br>
		Person person = (Person)request.getAttribute("person");<br>
		if (person == null) {<br>
		&nbsp;&emsp;person = new Person();<br>
		&nbsp;&emsp;request.setAttribute("person", person);<br>
		}<br>
	</p>
	
	<h3>jsp:setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<jsp:setProperty property="name" name="person" value="임꺽정" />
	<jsp:setProperty property="age" name="person" value="41"/>
	<p>
		4. "person" 자바빈즈의 name과 age 멤버 변수에 값 설정 (setter)<br>
	</p>
	
	<h3>jsp:getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person"/></li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
	</ul>
	<p>
		5. "person" 자바빈즈에서 멤버 변수의 값 출력 (getter)<br>
	</p>
</body>
</html>