package utils;

import java.io.IOException;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {

	// 메시지 알림창을 띄운 후, 명시한 URL로 이동
	public static void alertLocation(String message, String url, JspWriter out) {
		try {
			String script = "<script>" // 삽입할 자바스크립트 코드
					+ "    alert('" + message + "');" 
					+ "    location.href='" + url + "';" 
					+ "</script>";
			out.println(script); // 자바 스크립트 코드를 out 내장 객체로 삽입
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 메시지 알림창을 띄운 후, 이전 페이지로 돌아감
	public static void alertBack(String message, JspWriter out) {
		try {
            String script = "<script>"
                          + "    alert('" + message + "');"
                          + "    history.back();" // 무조건 이전 페이지로 이동
                          + "</script>";
            out.println(script);
        }
        catch (Exception e) {
        	e.printStackTrace();
        }
	}
}
