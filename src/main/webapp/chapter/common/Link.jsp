<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table border="1" width="90%">
	<tr>
		<td align="center">
			<!-- 로그인 x -->
			<% if (session.getAttribute("UserId") == null) { %>
				<a href="../ch06_Session/LoginForm.jsp">로그인</a>
			<% } else { %> <!-- 로그인 o -->
				<a href="../ch06_Session/Logout.jsp">로그아웃</a>
			<% } %>
			&nbsp;&nbsp;&nbsp;
			<a href="../ch08_Board/List.jsp">게시판(페이징 x)</a>
			&nbsp;&nbsp;&nbsp;
			<a href="../ch09_PagingBoard/List.jsp">게시판(페이징 o)</a>
		</td>
	</tr>
</table>