package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.TaskMapper;
import com.dpc.model.Task;
import com.dpc.service.TaskService;

/** 
 * @author dingpc
 * @version 2016年5月10日
 */
@Service("TaskService")
public class TaskServiceImpl implements TaskService {

	@Resource
	private TaskMapper taskMapper;
	
	@Override
	public Task selectByPrimaryKey(String id) {
		return taskMapper.selectByPrimaryKey(id);
	}

	@Override
	public int save(Task task) {
		return taskMapper.insertSelective(task);
	}

	@Override
	public int update(Task task) {
		return taskMapper.updateByPrimaryKeySelective(task);
	}

	@Override
	public List<Task> selectTaskList(Map<String, Object> paraMap) {
		return taskMapper.selectTaskList(paraMap);
	}

	@Override
	public int selectTaskCount(Map<String, Object> paraMap) {
		return taskMapper.selectTaskCount(paraMap);
	}

	@Override
	public int delete(String id) {
		return taskMapper.deleteByPrimaryKey(id);
	}
}
