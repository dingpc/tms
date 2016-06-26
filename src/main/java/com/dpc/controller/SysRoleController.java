package com.dpc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dpc.model.SysRole;
import com.dpc.model.SysUserRoleKey;
import com.dpc.service.SysRoleService;

/** 
 * @author dingpc
 * @version 2016年3月21日
 */
@Controller
@RequestMapping("/sysrole")
public class SysRoleController {
	
	private static Logger log = Logger.getLogger(SysRoleController.class);
	
	@Resource
	private SysRoleService roleService;
	
	@RequestMapping("/select")
	public String select(HttpServletRequest request, Model model) {
		String userId = request.getParameter("userId");
		log.debug("userId:" + userId);
		List<SysRole> selectRoleList = roleService.selectSysRoleListByUserId(userId);
		List<SysRole> roleList = roleService.selectSysRoleList(new HashMap<String, Object>());
		model.addAttribute("userId", userId);
		model.addAttribute("selectRoleList", selectRoleList);
		model.addAttribute("roleList", roleList);
		return "/sysrole/select";
	}
	
	@RequestMapping("/selectupdate")
	@ResponseBody
	public Map<String, String> selectUpdate(HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>(1);
		String userId = request.getParameter("userId");
		String idStr = request.getParameter("idStr");
		log.debug("selectUpdate userId:" + userId);
		log.debug("selectUpdate idStr:" + idStr);
		roleService.deleteUserRoleByUserid(userId);
		String[] idArr = idStr.split(",");
		for (String str : idArr) {
			SysUserRoleKey record = new SysUserRoleKey();
			record.setUserId(userId);
			record.setRoleId(str);
			roleService.insertUserRole(record);
		}
		log.debug("UserName:");
		map.put("success", "true");
		return map;
	}
}
