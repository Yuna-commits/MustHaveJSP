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
	<h1>회원 목록 조회 테스트!! (executeQuery() 사용)</h1>
	<%
		JDBCconnect jdbc = new JDBCconnect();
	
		// Create Query
		String sql = "select id, password, name, reg_date from member";
		jdbc.stmt = jdbc.conn.createStatement();
		
		// Execute Query
		jdbc.rs = jdbc.stmt.executeQuery(sql);
		
		// Result
		while(jdbc.rs.next()) {
			String id = jdbc.rs.getString(1);
			String password = jdbc.rs.getString(2);
			String name = jdbc.rs.getString(3);
			java.sql.Date regDate = jdbc.rs.getDate("reg_date");
			
			out.println(String.format("%s %s %s %s", id, password, name, regDate) + "<br>");
		}
		
		jdbc.close();
	%>
</body>
</html>