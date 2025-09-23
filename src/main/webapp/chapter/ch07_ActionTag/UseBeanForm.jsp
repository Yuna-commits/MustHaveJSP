<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>액션 태그로 폼값 한 번에 보내기</h1>
	<form method="post" action="UseBeanAction.jsp">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		<input type="submit" value="폼값 전송">
	</form>
	<p>
		input 태그의 name과 Person 클래스의 멤버 변수 이름이 같아야 매핑 가능<br>
		전송된 폼값과 클래스의 변수 이름이 매핑되어 setter로 저장!
	</p>
</body>
</html>