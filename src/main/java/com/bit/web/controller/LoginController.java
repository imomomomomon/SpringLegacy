package com.bit.web.controller;

import com.bit.web.model.UserDto;
import com.bit.web.service.Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.CookieGenerator;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource(name = "serviceImpl")
    Service service;

    @ResponseBody
    @PostMapping(value = "/check",produces = "application/text; charset=utf-8;")
    public String checkLogin(String user_id, String user_passwd, String checker,
                             HttpSession session,
                             HttpServletResponse response,
                             HttpServletRequest request){
        String id = service.checkLogin(new UserDto(user_id,user_passwd));
        if(id == null)
            return "[로그인 실패]";
        session.setAttribute("id",id);
        //쿠키생성
        CookieGenerator cg = new CookieGenerator();
        cg.setCookieName("cookie_id");
        if(checker != null){
            cg.addCookie(response,id);
        } else {
            cg.removeCookie(response);
        }
        return id;
    }
}
