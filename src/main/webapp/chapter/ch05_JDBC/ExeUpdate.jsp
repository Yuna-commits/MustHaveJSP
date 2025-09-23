<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBCconnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h1>회원 추가 테스트!!</h1>
	<%
		JDBCconnect jdbc = new JDBCconnect();
		
		String id = "test1";
		String password = "1234";
		String name = "테스트1 회원";
		
		// Query
		String sql = "insert into member values (?, ?, ?, sysdate)";
		jdbc.pstmt = jdbc.conn.prepareStatement(sql);
		
		jdbc.pstmt.setString(1, id);
		jdbc.pstmt.setString(2, password);
		jdbc.pstmt.setString(3, name);
		
		// Execute Query
		int result = jdbc.pstmt.executeUpdate();
		out.println(result + "행이 입력되었습니다.");
		
		jdbc.close();
	%>
</body>
</html>