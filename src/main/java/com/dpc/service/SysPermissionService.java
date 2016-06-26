package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.SysPermission;

/** 
 * @author dingpc
 * @version 2016年3月17日
 */
public interface SysPermissionService {
	
	public int save(SysPermission sysPermission);
	public int update(SysPermission sysPermission);
	SysPermission selectByPrimaryKey(String roleId);
	public int delete(String permissionId);
	public List<SysPermission> selectSysPermissionList(Map<String, Object> paraMap);
	public List<SysPermission> selectSysPermissionListByRoleId(String roleId);
}
