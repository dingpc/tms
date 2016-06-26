package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.TaskTest;

/** 
 * @author dingpc
 * @version 2016年5月10日
 */
public interface TaskTestService {
	public TaskTest selectByPrimaryKey(String id);
	public int save(TaskTest taskTest);
	public int update(TaskTest taskTest);
	public int delete(String id);
	public List<TaskTest> selectTaskTestList(Map<String, Object> paraMap);
	public int selectTaskTestCount(Map<String, Object> paraMap);
}
