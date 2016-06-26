package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.TaskTestMapper;
import com.dpc.model.TaskTest;
import com.dpc.service.TaskTestService;

/** 
 * @author dingpc
 * @version 2016年5月10日
 */
@Service("TaskTestService")
public class TaskTestServiceImpl implements TaskTestService {

	@Resource
	private TaskTestMapper taskTestMapper;
	
	@Override
	public TaskTest selectByPrimaryKey(String id) {
		return taskTestMapper.selectByPrimaryKey(id);
	}

	@Override
	public int save(TaskTest taskTest) {
		return taskTestMapper.insertSelective(taskTest);
	}

	@Override
	public int update(TaskTest taskTest) {
		return taskTestMapper.updateByPrimaryKeySelective(taskTest);
	}

	@Override
	public List<TaskTest> selectTaskTestList(Map<String, Object> paraMap) {
		return taskTestMapper.selectTaskTestList(paraMap);
	}

	@Override
	public int selectTaskTestCount(Map<String, Object> paraMap) {
		return taskTestMapper.selectTaskTestCount(paraMap);
	}

	@Override
	public int delete(String id) {
		return taskTestMapper.deleteByPrimaryKey(id);
	}

}
