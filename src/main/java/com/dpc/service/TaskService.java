package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.Task;

/** 
 * @author dingpc
 * @version 2016年5月10日
 */
public interface TaskService {
	public Task selectByPrimaryKey(String id);
	public int save(Task task);
	public int update(Task task);
	public int delete(String id);
	public List<Task> selectTaskList(Map<String, Object> paraMap);
	public int selectTaskCount(Map<String, Object> paraMap);
}
