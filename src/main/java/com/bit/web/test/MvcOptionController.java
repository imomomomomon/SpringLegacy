package com.bit.web.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.bit.web.service.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/test")
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

	@ModelAttribute(name = "strList")
	public List<String> getTestList(){
		List<String> list = new ArrayList<>();
		list.add("000101.png");
		list.add("000301.png");
		list.add("000801.png");
		list.add("091201.png");
		return list;
	}

	@RequestMapping("/redirectTest/{send}")
	public String redirectAttrProcess(RedirectAttributes redirectAttributes,
									@PathVariable("send") String send){
		redirectAttributes.addFlashAttribute("msg1","Hi1Spring");
		return send+":/test2/redirectLink";
	}

	@RequestMapping(value = "/mapProcess",method = RequestMethod.POST)
	public String mapProcess(RedirectAttributes redirectAttributes,String strings){
		String[] strArr = strings.split(",");

		for (int i = 0; i < strArr.length; i++) {
			redirectAttributes.addFlashAttribute("str"+i,strArr[i]);
		}

		return "redirect:/test2/inputFlashMapTest";
	}
}






















