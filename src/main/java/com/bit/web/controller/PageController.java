package com.bit.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        return "login/adminLogin";
    }
    @GetMapping("/logout")
    public String goLogout(HttpSession session){
        session.removeAttribute("id");
        return "cart/productList";
    }
    @GetMapping("/signup")
    public String goSignUp(){
        return "login/signup";
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
    @GetMapping("/cart")
    public String goCart(){
        return "cart/cartList";
    }

    @GetMapping("/ajax-test")
    public String goTest() { return "test/mvcOptionIndex"; }
}
