<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// DB 연결
	BoardDAO dao = new BoardDAO(application);
	
	// 검색어가 있으면 Map에 저장
	Map<String, Object> map = new HashMap<String, Object>();
	String field = request.getParameter("field");
	String keyword = request.getParameter("keyword");
	
	if(keyword != null) {	
		map.put("field", field);
		map.put("keyword", keyword);
	}
	
	int count = dao.selectCount(map); // 게시물 수
	List<BoardDTO> list = dao.selectList(map); // 게시물 목록
	
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<h2>목록 보기(List)</h2>
	<!-- 검색폼 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="field">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	<!-- 게시물 목록 테이블 -->
	<table border="1" width="90%">
		<!-- 컬럼명 -->
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<!-- 목록 내용 -->
		<%
			// 게시물이 하나도 없는 경우
			if (list.isEmpty()) {
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		<%
			// 게시물이 있는 경우
			} else {
				int index = count;
				for (BoardDTO dto : list) {
		%>
		<tr align="center">
			<td><%=index-- %></td>
			<td align="left">
				<a href="View.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>
			</td>
			<td align="center"><%=dto.getId() %></td>
			<td align="center"><%=dto.getVisitCount() %></td>
			<td align="center"><%=dto.getPostDate() %></td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<!-- 글쓰기 -->
	<table border="1" width="90%">
		<tr align="right">
			<td>
				<button type="button" onclick='location.href="Write.jsp";'>글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>