package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.SysUserMapper;
import com.dpc.model.SysUser;
import com.dpc.service.SysUserService;

/** 
 * @author dingpc
 * @version 2016年2月26日 
 */
@Service("SysUserService")
public class SysUserServiceImpl implements SysUserService {
	@Resource
	private SysUserMapper sysUserMapper;

	@Override
	public SysUser selectByPrimaryKey(String userId) {
		return this.sysUserMapper.selectByPrimaryKey(userId);
	}

	@Override
	public SysUser selectByUserName(String userName) {
		return this.sysUserMapper.selectByUserName(userName);
	}

	@Override
	public List<SysUser> selectUserList(Map<String, Object> paraMap) {
		return this.sysUserMapper.selectUserList(paraMap);
	}

	@Override
	public int save(SysUser sysUser) {
		return this.sysUserMapper.insert(sysUser);
	}

	@Override
	public int update(SysUser sysUser) {
		return this.sysUserMapper.updateByPrimaryKeySelective(sysUser);
	}

	@Override
	public SysUser authentication(SysUser sysUser) {
		return this.sysUserMapper.authentication(sysUser);
	}

	@Override
	public int delete(String userId) {
		return this.sysUserMapper.deleteByPrimaryKey(userId);
	}
	
}
