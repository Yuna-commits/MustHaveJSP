<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 1. 회원인증정보 속성 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");

// 2. 모든 속성 전부 삭제
// session.invalidate();

// 속성 삭제 후 로그인 폼으로 리다이렉트
response.sendRedirect("LoginForm.jsp");
%>