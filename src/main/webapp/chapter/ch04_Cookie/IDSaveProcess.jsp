<%@ page import="utils.CookieManager" %>
<%@ page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String saveCheck = request.getParameter("saveCheck");
	
	// 로그인 성공
	if("must".equals(userId) && "1234".equals(userPw)) {
		// 아이디 저장하기 체크한 경우 : 쿠키 생성
		if(saveCheck != null && "Y".equals(saveCheck)) {
			CookieManager.makeCookie(response, "loginId", userId, 60*60*24);
		} else { // 체크 안 한 경우 : 쿠키 삭제
			CookieManager.deleteCookie(response, "loginId");
		}
		
		JSFunction.alertLocation("로그인에 성공했습니다.", "IDSaveMain.jsp", out);
	} else { // 로그인 실패
		JSFunction.alertBack("로그인에 실패했습니다.", out);
	}
%>