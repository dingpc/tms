package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.SysUser;

public interface SysUserService {
	public SysUser selectByPrimaryKey(String userId);
	public SysUser selectByUserName(String userName);
	public List<SysUser> selectUserList(Map<String, Object> paraMap);
	public int save(SysUser sysUser);
	public int update(SysUser sysUser);
	public SysUser authentication(SysUser sysUser);
	public int delete(String userId);
}
