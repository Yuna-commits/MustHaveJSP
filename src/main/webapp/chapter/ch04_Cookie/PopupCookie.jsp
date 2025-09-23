<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String isChecked = request.getParameter("inactiveToday");
	
	// 체크된 경우
	if(isChecked != null && "1".equals(isChecked)) {
		Cookie cookie = new Cookie("PopupClose", "off");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		out.println("쿠키 : 하루 동안 열지 않음");
	}
%>