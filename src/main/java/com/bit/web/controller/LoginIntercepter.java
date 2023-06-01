package com.bit.web.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Component("LoginInterceptor")
public class LoginIntercepter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String id = (String) request.getSession().getAttribute("id");
        if(id == null) {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>alert('로그인이 필요합니다.'); location.href='http://localhost:8080/page/login';  </script>");
            out.flush();
            out.close();

            return false;
        }
        return true;
    }
}
