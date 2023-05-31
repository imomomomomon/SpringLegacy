package com.bit.web.controller;

import java.util.HashMap;
import java.util.List;

import com.bit.web.service.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MvcOptionController {
	@Autowired
	Service service;

	@ResponseBody
	@RequestMapping(value = "ajaxTest1",method = RequestMethod.POST)
	public String ajaxTestProcess1(Model model) {
		model.addAttribute("ajax", "AjaxTest1");
		return "AjaxTest1";
	}
	@ResponseBody
	@RequestMapping(value = "ajaxTest2",method = RequestMethod.POST)
	public HashMap<String, Object> ajaxTestProcess2(Model model,@RequestBody HashMap<String, Object>map) {//@RequestBody json을 자바로 받아주는 부분
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "ajaxTest3",method = RequestMethod.POST)
	public List<Object> ajaxTestProcess3(@RequestBody HashMap<String, Object>map) {
		System.out.println(map);
		return service.selectList(null);
	}

	@ResponseBody
	@RequestMapping(value = "ajaxTest4",method = RequestMethod.POST)
	public List<Object> ajaxTestProcess4(@RequestBody HashMap<String, Object>map) {
		System.out.println(map);
		return service.selectList(null);

	}
}






















