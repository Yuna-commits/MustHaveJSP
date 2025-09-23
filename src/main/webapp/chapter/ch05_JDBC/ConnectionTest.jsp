<%@ page import="common.JDBCconnect"%>
<%@ page import="common.DBConnectionPool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>JDBC</title>
</head>
<body>
	<h2>JDBC 테스트 1</h2>
	<%
	JDBCconnect jdbc1 = new JDBCconnect();
	jdbc1.close();
	%>

	<h2>JDBC 테스트 2</h2>
	<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd");

	JDBCconnect jdbc2 = new JDBCconnect(driver, url, id, pwd);
	jdbc2.close();
	%>
	
	<h2>JDBC 테스트 3</h2>
    <%
    JDBCconnect jdbc3 = new JDBCconnect(application); 
    jdbc3.close();
    %>

	<h2>커넥션 풀 테스트</h2>
    <%
    DBConnectionPool pool = new DBConnectionPool();
    pool.close();
    %>
</body>
</html>