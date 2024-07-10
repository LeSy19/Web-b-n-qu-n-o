package poly.com.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import poly.com.entity.Account;
import poly.com.services.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();
        Account user = (Account) session.get("user"); // lấy từ session
        String error = "";
        if (user == null) { // chưa đăng nhập
            error = "Please login!";
        }
        // không đúng vai trò
        else if (!user.isRole() && uri.startsWith("/admin/")) {
            error = "Access denied!";
        }
        if (error.length() > 0) { // có lỗi
            session.set("security-uri", uri);
            response.sendRedirect("/account/login?error=" + error);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Account user = (Account) session.get("user");
        if (user != null) {
            // Đặt thuộc tính user vào session
            request.getSession().setAttribute("user", user);
        }
    }
}
