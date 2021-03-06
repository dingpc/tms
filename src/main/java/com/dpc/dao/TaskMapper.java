package com.dpc.dao;

import java.util.List;
import java.util.Map;

import com.dpc.model.Task;

public interface TaskMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table task
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table task
	 * @mbggenerated
	 */
	int insert(Task record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table task
	 * @mbggenerated
	 */
	int insertSelective(Task record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table task
	 * @mbggenerated
	 */
	Task selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table task
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(Task record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table task
	 * @mbggenerated
	 */
	int updateByPrimaryKey(Task record);

	List<Task> selectTaskList(Map<String, Object> paraMap);
	
	int selectTaskCount(Map<String, Object> paraMap);
}