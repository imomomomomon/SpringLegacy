package com.bit.web.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/test2")
public class testController {
    @RequestMapping("/redirectLink")
    public String redirectAttrProcessLink(@ModelAttribute("msg1")String msg1, Model model) {
        model.addAttribute("msg1",msg1);
        return "test/mvcOptionIndex";
    }

    @RequestMapping("/inputFlashMapTest")
    public String inputFlashMapTest(Model model, HttpServletRequest request) {
        model.addAttribute("map", RequestContextUtils.getInputFlashMap(request));
        return "test/mvcOptionIndex";
    }
}
