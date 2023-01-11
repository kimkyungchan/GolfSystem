package golf.project.member.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;

public class LoginManager {

    private static final String LOGIN_KEY = "LOGIN_USER_ID";

    public static void login(HttpServletResponse response, String memberId) {
        Cookie cookie = new Cookie(LOGIN_KEY, memberId);
        cookie.setHttpOnly(true);
        cookie.setMaxAge(60 * 60 * 24 * 365); // 1 year

        response.addCookie(cookie);
    }

    public static void logout(HttpServletResponse response) {
        Cookie cookie = new Cookie(LOGIN_KEY, null);
        cookie.setHttpOnly(true);
        cookie.setMaxAge(0);

        response.addCookie(cookie);
    }

    private static Cookie getLoginCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        return Arrays
                .stream(cookies)
                .filter(cookie -> cookie.getName().equals(LOGIN_KEY))
                .findFirst()
                .orElse(null);
    }

    public static boolean isLogin(HttpServletRequest request) {
        Cookie cookie = getLoginCookie(request);
        return cookie.getValue() != null && !cookie.getValue().isBlank();
    }

    public static String getLoginMemberId(HttpServletRequest request) {
        if (isLogin(request)) {
            return getLoginCookie(request).getValue();
        }
        return null;
    }

    public static String getLoginMemberIdOrFail(HttpServletRequest request) {
        String memberId = getLoginMemberId(request);
        if (memberId == null) {
            throw new RuntimeException("No logged-in user");
        }
        return memberId;
    }

}
