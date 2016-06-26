package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.SysDict;

/** 
 * @author dingpc
 * @version 2016年3月7日
 */
public interface SysDictService {
	public List<SysDict> selectDictList(Map<String, Object> paraMap);
	public List<SysDict> selectDictList(Long typeId);
	public Map<Long, String> selectDictMap(Long typeId);
}
