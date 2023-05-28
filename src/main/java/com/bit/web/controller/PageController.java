package com.bit.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/page")
public class PageController {
    @GetMapping("/login")
    public String goLogin(Model model,
                          @CookieValue(value = "cookie_id",required = false)String id){
        if(id != null) {
            model.addAttribute("cookie_id",id);
        }
        return "adminLogin";
    }
    @GetMapping("/logout")
    public String goLogout(HttpSession session){
        session.removeAttribute("id");
        return "cart/productList";
    }
    @GetMapping("/list")
    public String goList(){
        return "cart/productList";
    }
    @GetMapping("/info/{no}")
    public String goInfo(@PathVariable("no") int no, Model model){
        model.addAttribute("no",no);
        return "cart/productInfo";
    }
    @GetMapping("/add")
    public String goAdd(){
        return "cart/productAdd";
    }
}
