package com.dpc.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/** 
 * @author dingpc
 * @version 2016年2月28日
 */

@Controller
@RequestMapping("/sys")
public class SysController {
	private static Logger log = Logger.getLogger(SysController.class);
	
	@RequestMapping("/index")
//	@RequiresRoles(value = "admin")
	public String index(HttpServletRequest request, Model model) {
		/*Subject subject = SecurityUtils.getSubject();
		if(subject.hasRole("admin")) {
			log.debug("has admin");
		} else {
			log.debug("no admin");
		}*/
		log.debug("/sys/index");
		return "/sys/index";
	}
	
	@RequestMapping("/overview")
	public String overview(HttpServletRequest request, Model model) {
		log.debug("/sys/overview");
		return "/sys/overview";
	}
	
	@RequestMapping("/left")
	public String left(HttpServletRequest request, Model model) {
		log.debug("/sys/left");
		return "/sys/left";
	}
}
