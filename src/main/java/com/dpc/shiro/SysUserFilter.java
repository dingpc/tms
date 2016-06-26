package com.dpc.shiro;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;

import com.dpc.model.SysUser;
import com.dpc.service.SysUserService;

/** 
 * @author dingpc
 * @version 2016年3月30日
 */
public class SysUserFilter extends PathMatchingFilter {
	private static Logger log = Logger.getLogger(SysUserFilter.class);
	@Resource
	private SysUserService userService;
	
	@Override
	protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		log.debug("onPreHandle()");
		String userName = (String)SecurityUtils.getSubject().getPrincipal();
		log.debug("onPreHandle() userName:" + userName);
		SysUser sysUser = userService.selectByUserName(userName);
		request.setAttribute("user", sysUser);
		return true;
	}

}
