package com.dpc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dpc.model.DailyReport;
import com.dpc.model.SysUser;
import com.dpc.service.DailyReportService;
import com.dpc.service.SysDictService;
import com.dpc.service.SysUserService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.DateUtil;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static Logger log = Logger.getLogger(LoginController.class);
	
	@Resource
	private SysUserService sysUserService;
	@Resource
	private DailyReportService reportService;
	@Resource
	private SysDictService dictService;
	
	@RequestMapping("/validate")
	@ResponseBody
	public String validate(@RequestBody SysUser sysUser, HttpServletRequest request, HttpServletResponse response,  Model model) {
		String userName = sysUser.getUserName();
		String password = sysUser.getPassword();
		
		String result = "";
		log.debug("userName:" + userName + "****password:" + password);
		try {
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				log.debug("isAuthenticated ");
				request.getSession().removeAttribute("sysUserSession");
		        subject.logout();
	        }
			// 身份验证
        	log.debug("isAuthenticated 1");
        	
            subject.login(new UsernamePasswordToken(userName, password));
            log.debug("isAuthenticated 2");
            // 验证成功在Session中保存用户信息
            final SysUser authUserInfo = sysUserService.selectByUserName(userName);
            request.getSession().setAttribute("sysUserSession", authUserInfo);
            log.debug("validate Success");
			result = "1";
		} catch (AuthenticationException e) {
			log.debug("用户名或密码错误");
			e.printStackTrace();
			log.debug(e.getMessage());
			result = "2";
		}
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter pw = response.getWriter();
			pw.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		Date yesterDate = DateUtil.getYesterdayDate();
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("questionState", ConstantUtil.QUESTION_STATE_RESOLVING);
		List<DailyReport> resolvingList = reportService.selectDailyReportList(paraMap);
		paraMap.clear();
		paraMap.put("shiftDate", yesterDate);
		paraMap.put("questionState", ConstantUtil.QUESTION_STATE_RESOLVED);
		List<DailyReport> resolvedList = reportService.selectDailyReportList(paraMap);
		model.addAttribute("resolvingList", resolvingList);
		model.addAttribute("resolvedList", resolvedList);
		model.addAttribute("yesterDate", yesterDate);
		model.addAttribute("questionTypeMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_TYPE));
		return "/login/index";
	}
	
	@RequestMapping("/logon")
	public String logon(HttpServletRequest request, Model model) {
		return "/login/logon";
	}
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request, Model model) {
		return "/login/home";
	}
	
	@RequestMapping("/top")
	public String top(HttpServletRequest request, Model model) {
		return "/login/top";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("sysUserSession");;
		Subject subject = SecurityUtils.getSubject();
        subject.logout();
		return "/login/logon";
	}
	
	@RequestMapping("/401")
	public String unauthorized(HttpServletRequest request, Model model) {
		return "/login/401";
	}
	//Page not found
	@RequestMapping("/404")
	public String notFound(HttpServletRequest request, Model model) {
		return "/login/404";
	}
	@RequestMapping("/500")
	public String serverError(HttpServletRequest request, Model model) {
		return "/login/500";
	}
	/*@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		Long userId = Long.parseLong(request.getParameter("userId"));
		String password = request.getParameter("password");
		log.debug("userId:" + userId + "****password:" + password);
		SysUser selectSysUser = sysUserService.getSysUserById(userId);
		if(selectSysUser != null) {
			String selectPassword = selectSysUser.getPassword();
			log.debug("selectPassword:" + selectPassword);
			if(!selectPassword.equals(ShaUtil.shaEncode(password))) {
				log.debug("密码错误");
			}
		} else {
			log.debug("用户名不存在");
		}
		return "/login/index";
	}*/
}
