package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {

	// 명시한 (이름, 값, 유지 기간)으로 새로운 쿠키 생성
	public static void makeCookie(HttpServletResponse response, String name, String value, int time) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(time);

		response.addCookie(cookie);
	}

	// 명시한 이름의 쿠키를 찾아 값 반환
	public static String readCookie(HttpServletRequest request, String name) {
		String value = "";
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					value = cookie.getValue();
				}
			}
		}

		return value;
	}

	// 명시한 이름의 쿠키 삭제
	public static void deleteCookie(HttpServletResponse response, String name) {
		// 값("") 유지 기간(0)으로 설정하여 쿠키 삭제
		makeCookie(response, name, "", 0);
	}

}
