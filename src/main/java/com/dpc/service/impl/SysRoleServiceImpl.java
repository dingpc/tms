package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.SysRoleMapper;
import com.dpc.dao.SysUserRoleMapper;
import com.dpc.model.SysRole;
import com.dpc.model.SysUserRoleKey;
import com.dpc.service.SysRoleService;

/** 
 * @author dingpc
 * @version 2016年3月17日
 */
@Service("SysRoleService")
public class SysRoleServiceImpl implements SysRoleService {

	@Resource
	private SysRoleMapper sysRoleMapper;
	@Resource
	private SysUserRoleMapper sysUserRoleMapper;
	
	@Override
	public int save(SysRole sysRole) {
		return this.sysRoleMapper.insertSelective(sysRole);
	}

	@Override
	public int update(SysRole sysRole) {
		return this.sysRoleMapper.updateByPrimaryKeySelective(sysRole);
	}

	@Override
	public SysRole selectByPrimaryKey(String roleId) {
		return this.sysRoleMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public int delete(String roleId) {
		return this.sysRoleMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public List<SysRole> selectSysRoleList(Map<String, Object> paraMap) {
		return this.sysRoleMapper.selectSysRoleList(paraMap);
	}

	@Override
	public List<SysRole> selectSysRoleListByUserId(String userId) {
		return this.sysRoleMapper.selectSysRoleListByUserId(userId);
	}

	@Override
	public int deleteUserRoleByUserid(String userid) {
		return this.sysUserRoleMapper.deleteUserRoleByUserid(userid);
	}

	@Override
	public int insertUserRole(SysUserRoleKey record) {
		return this.sysUserRoleMapper.insertSelective(record);
	}

}
