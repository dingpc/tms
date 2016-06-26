package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.SysRole;
import com.dpc.model.SysUserRoleKey;

/** 
 * @author dingpc
 * @version 2016年3月17日
 */
public interface SysRoleService {

	public int save(SysRole sysRole);
	public int update(SysRole sysRole);
	SysRole selectByPrimaryKey(String roleId);
	public int delete(String roleId);
	public List<SysRole> selectSysRoleList(Map<String, Object> paraMap);
	public List<SysRole> selectSysRoleListByUserId(String userId);
	
	public int deleteUserRoleByUserid(String userid);
	public int insertUserRole(SysUserRoleKey record);
}
