package com.dpc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dpc.model.SysUser;
import com.dpc.service.SysDictService;
import com.dpc.service.SysUserService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.ShaUtil;

/** 
 * @author dingpc
 * @version 2016年2月26日
 */

@Controller
@RequestMapping("/sysuser")
public class SysUserController {
	private static Logger log = Logger.getLogger(SysUserController.class);
	
	@Resource
	private SysUserService sysUserService;
	
	@Resource
	private SysDictService dictService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model, @RequestParam(value="searchRealName", defaultValue="") String searchRealName) {
		log.debug("/sysuser/list");
		log.debug("searchRealName:" + searchRealName);
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("realName", searchRealName);
		List<SysUser> list = sysUserService.selectUserList(paraMap);
		model.addAttribute("list", list);
		model.addAttribute("searchRealName", searchRealName);
		
		model.addAttribute("postMap", dictService.selectDictMap(ConstantUtil.DICT_POST_TYPE));
		return "/sysuser/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		model.addAttribute("postList", dictService.selectDictList(ConstantUtil.DICT_POST_TYPE));
		model.addAttribute("rankList", dictService.selectDictList(ConstantUtil.DICT_RANK_TYPE));
		model.addAttribute("sexList", dictService.selectDictList(ConstantUtil.DICT_SEX_TYPE));
		return "/sysuser/add";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		log.debug("/sysuser/view");
		String userId = request.getParameter("userId");
		log.debug("userId:" + userId);
		SysUser sysUser = sysUserService.selectByPrimaryKey(userId);
		model.addAttribute("sysUser", sysUser);
		
		model.addAttribute("postMap", dictService.selectDictMap(ConstantUtil.DICT_POST_TYPE));
		model.addAttribute("rankMap", dictService.selectDictMap(ConstantUtil.DICT_RANK_TYPE));
		model.addAttribute("sexMap", dictService.selectDictMap(ConstantUtil.DICT_SEX_TYPE));
		return "/sysuser/view";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		String userId = request.getParameter("userId");
		log.debug("userId:" + userId);
		SysUser sysUser = sysUserService.selectByPrimaryKey(userId);
		model.addAttribute("sysUser", sysUser);
		
		model.addAttribute("postList", dictService.selectDictList(ConstantUtil.DICT_POST_TYPE));
		model.addAttribute("rankList", dictService.selectDictList(ConstantUtil.DICT_RANK_TYPE));
		model.addAttribute("sexList", dictService.selectDictList(ConstantUtil.DICT_SEX_TYPE));
		return "/sysuser/edit";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, String> save(@RequestBody SysUser sysUser, HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>(1);
		log.debug("UserName:" + sysUser.getUserName());
		
		sysUser.setPassword(ShaUtil.shaEncode(sysUser.getPassword()));
		sysUser.setCreateTime(new Date());
		String userId = UUID.randomUUID().toString();
		sysUser.setUserId(userId);
		log.debug("userId:" + userId);
		sysUserService.save(sysUser);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(@RequestBody SysUser sysUser) {
		Map<String, String> map = new HashMap<String, String>(1);
		log.debug("UserName:" + sysUser.getUserName());
		sysUserService.update(sysUser);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping({"/delete"})
	@ResponseBody  
	public Map<String, String> delete(HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>(1);
		String idStr = request.getParameter("idStr");
		log.debug("idStr:" + idStr);
		int result = sysUserService.delete(idStr);
		if(result > 0) {
			map.put("success", "true");  
		} else {
			map.put("success", "false");  
		}
		return map;
	}
	
	@RequestMapping("/personal")
	public String personal(HttpServletRequest request, Model model) {
		log.debug("personal");
		SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUserSession");
		if(sysUser == null) {
			return "/login/logon";
		}
		log.debug("personal userName:" + sysUser.getUserName());
		model.addAttribute("postMap", dictService.selectDictMap(ConstantUtil.DICT_POST_TYPE));
		model.addAttribute("rankMap", dictService.selectDictMap(ConstantUtil.DICT_RANK_TYPE));
		model.addAttribute("sexMap", dictService.selectDictMap(ConstantUtil.DICT_SEX_TYPE));
		return "/sysuser/personal";
	}
	
	@RequestMapping("/editpassword")
	public String editpassword(HttpServletRequest request, Model model) {
		log.debug("personal");
		SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUserSession");
		if(sysUser == null) {
			return "/login/logon";
		}
		log.debug("personal userName:" + sysUser.getUserName());
		return "/sysuser/editpassword";
	}
	
	@RequestMapping("/updatepassword")
	@ResponseBody
	public Map<String, String> updatepassword(@RequestBody SysUser sysUser, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>(1);
		log.debug("updatepassword");
		log.debug("Password:" + sysUser.getPassword());
		SysUser sysUserSession = (SysUser)request.getSession().getAttribute("sysUserSession");
		if(sysUserSession != null) {
			log.debug("sysUserSession is not null");
			if(ShaUtil.shaEncode(sysUser.getPassword()).equals(sysUserSession.getPassword())) {
				sysUser.setUserId(sysUserSession.getUserId());
				sysUser.setPassword(ShaUtil.shaEncode(sysUser.getNewPassword()));
				sysUserService.update(sysUser);
				map.put("success", "true");
			} else {
				map.put("success", "passwordError");
			}
		} else {
			log.debug("sysUserSession is null");
			map.put("success", "false");
		}
		return map;
	}
	
	@RequestMapping("/select")
	public String select(HttpServletRequest request, Model model) {
		log.debug("/sysuser/select");
		Map<String, Object> paraMap = new HashMap<String, Object>();
		List<SysUser> list = sysUserService.selectUserList(paraMap);
		model.addAttribute("list", list);
		return "/sysuser/select";
	}
}
