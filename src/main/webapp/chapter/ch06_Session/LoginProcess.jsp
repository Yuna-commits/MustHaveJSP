<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 로그인 폼으로부터 받은 id, password
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// web.xml에서 가져온 데이터베이스 연결 정보
String driver = application.getInitParameter("OracleDriver");
String url = application.getInitParameter("OracleURL");
String id = application.getInitParameter("OracleId");
String pwd = application.getInitParameter("OraclePwd");

// MemberDAO를 통해 MemberDTO 획득
MemberDAO dao = new MemberDAO(driver, url, id, pwd);
MemberDTO dto = dao.getMemberDTO(userId, userPwd);
dao.close();

// 로그인 성공
if(dto.getId() != null){
	session.setAttribute("UserId", dto.getId());
	session.setAttribute("UserName", dto.getName());
	// 로그인 폼으로 리다이렉트
	response.sendRedirect("LoginForm.jsp");
} else { // 로그인 실패
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>