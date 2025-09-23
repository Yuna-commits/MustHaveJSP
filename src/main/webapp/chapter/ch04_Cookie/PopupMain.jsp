<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String popupMode = "on"; // 팝업창 표시 여부
	
	Cookie[] cookies = request.getCookies();
	// 쿠키가 존재하는 경우
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			String cookieName = cookie.getName(); // "PopupClose"
			String cookieValue = cookie.getValue(); // "off"
			// 팝업창 체크가 된 경우
			if("PopupClose".equals(cookieName)) {
				popupMode = cookieValue;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리!!</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function() {
	// 닫기 버튼(id="closeBtn")을 누르는 이벤트
    $('#closeBtn').click(function() {
    	// 팝업창(id="popup") 숨김
        $('#popup').hide();
        // id=inactiveToday이고 "checked" 된 체크박스의 값을 읽고, isChecked에 저장
        var isChecked = $("input:checkbox[id=inactiveToday]:checked").val();
        // 체크된 경우
        if(isChecked) {
        	$.ajax({
        		// PopupCookie.jsp에 GET 방식으로 비동기 요청 전송
        		url : "./PopupCookie.jsp",
        		type : "get",
        		// inactiveToday=isChecked의 데이터를 서버로 보냄
        		data : {inactiveToday : isChecked},
        		dataType : "text",
        		success : function(resultData) {
        			if(resultData != "") location.reload(); // 새로고침
        		}
        	})
        }
    });
});
</script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
    for (int i = 1 ; i <= 10 ; i++) { 
        out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
    }

    if (popupMode.equals("on")) {
%>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right"><form name="popFrm">
            <input type="checkbox" id="inactiveToday" value="1" /> 
            하루 동안 열지 않음
            <input type="button" value="닫기" id="closeBtn" /> 
        </form></div>
    </div>
<%
    }
%>
</body>
</html>