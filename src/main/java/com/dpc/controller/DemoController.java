package com.dpc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/demo")
public class DemoController {

	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		return "/demo/index";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		return "/demo/login";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		return "/demo/add";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		return "/demo/list";
	}
}
