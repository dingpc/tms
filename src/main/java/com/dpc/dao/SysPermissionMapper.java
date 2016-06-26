package com.dpc.dao;

import java.util.List;
import java.util.Map;

import com.dpc.model.SysPermission;

public interface SysPermissionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_permission
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String permissionId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_permission
     *
     * @mbggenerated
     */
    int insert(SysPermission record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_permission
     *
     * @mbggenerated
     */
    int insertSelective(SysPermission record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_permission
     *
     * @mbggenerated
     */
    SysPermission selectByPrimaryKey(String permissionId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_permission
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SysPermission record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_permission
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SysPermission record);
    
    List<SysPermission> selectSysPermissionListByUserId(String userId);
	
	List<SysPermission> selectSysPermissionList(Map<String, Object> paraMap);
	
	List<SysPermission> selectSysPermissionListByRoleId(String roleId);
}