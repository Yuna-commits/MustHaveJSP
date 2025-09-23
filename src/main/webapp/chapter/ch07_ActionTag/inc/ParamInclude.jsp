<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>인클루드된 페이지의 매개변수 확인</h1>
<%= request.getParameter("loc1") %>에 <%= request.getParameter("loc2") %>이 있습니다.