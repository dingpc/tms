package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.SysPermissionMapper;
import com.dpc.model.SysPermission;
import com.dpc.service.SysPermissionService;

/** 
 * @author dingpc
 * @version 2016年3月17日
 */
@Service("SysPermissionService")
public class SysPermissionServiceImpl implements SysPermissionService {

	@Resource
	private SysPermissionMapper mapper;
	
	@Override
	public int save(SysPermission sysRole) {
		return this.mapper.insertSelective(sysRole);
	}

	@Override
	public int update(SysPermission sysResource) {
		return this.mapper.updateByPrimaryKeySelective(sysResource);
	}

	@Override
	public SysPermission selectByPrimaryKey(String resourceId) {
		return this.mapper.selectByPrimaryKey(resourceId);
	}

	@Override
	public int delete(String resourceId) {
		return this.mapper.deleteByPrimaryKey(resourceId);
	}

	@Override
	public List<SysPermission> selectSysPermissionList(Map<String, Object> paraMap) {
		return this.mapper.selectSysPermissionList(paraMap);
	}

	@Override
	public List<SysPermission> selectSysPermissionListByRoleId(String roleId) {
		return this.mapper.selectSysPermissionListByRoleId(roleId);
	}

}
