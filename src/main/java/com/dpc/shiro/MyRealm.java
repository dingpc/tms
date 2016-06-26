package com.dpc.shiro;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;

import com.dpc.model.SysPermission;
import com.dpc.model.SysRole;
import com.dpc.model.SysUser;
import com.dpc.service.SysPermissionService;
import com.dpc.service.SysRoleService;
import com.dpc.service.SysUserService;
import com.dpc.util.ShaUtil;
import com.dpc.util.StringUtil;

/** 
 * @author dingpc
 * @version 2016年3月16日
 */
//@Component(value = "securityRealm")
public class MyRealm extends AuthorizingRealm {
	
	private static Logger log = Logger.getLogger(MyRealm.class);
	
	@Resource
	private SysUserService userService;
	@Resource
	private SysPermissionService permissionService;
	@Resource
	private SysRoleService roleService;
	
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        String userName = String.valueOf(principalCollection.getPrimaryPrincipal());
        log.debug("Principal userName:" + userName);
        final SysUser sysUser = userService.selectByUserName(userName);
        log.debug("Principal UserId:" + sysUser.getUserId());
        final List<SysRole> roleList = roleService.selectSysRoleListByUserId(sysUser.getUserId());
        if(roleList != null) {
	        for (SysRole role : roleList) {
	            // 添加角色
	            authorizationInfo.addRole(role.getRoleKey());
	            log.debug("Principal role:" + role.getRoleKey());
	            final List<SysPermission> sysResourceList = permissionService.selectSysPermissionListByRoleId(role.getRoleId());
	            if(sysResourceList != null) {
	            	for (SysPermission permission : sysResourceList) {
		                // 添加权限
		                authorizationInfo.addStringPermission(permission.getPermissionKey());
		            }
	            }
	        }
        }
        return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName = String.valueOf(token.getPrincipal());
        String password = new String((char[]) token.getCredentials());
        log.debug("Authentication userName:" + userName);
        log.debug("Authentication password:" + password);
        
        // 通过数据库进行验证
        SysUser sysUser = new SysUser();
        sysUser.setUserName(userName);
        
        if(StringUtil.isNotEmpty(password))
        	sysUser.setPassword(ShaUtil.shaEncode(password));
        final SysUser authentication = userService.authentication(sysUser);
//        final SysUser authentication = userService.selectByUserName(userName);
        if (authentication == null) {
            throw new AuthenticationException("用户名或密码错误.");
        }
        
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
        		userName, 
        		password, 
//        		ByteSource.Util.bytes(userName + "" + authentication.getCredentialsSalt()),
        		getName());
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("userSession", authentication);
        session.setAttribute("userSessionId", authentication.getUserId());
        
        return authenticationInfo;
	}
}
