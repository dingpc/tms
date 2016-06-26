package com.dpc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.SysDictMapper;
import com.dpc.model.SysDict;
import com.dpc.service.SysDictService;

/** 
 * @author dingpc
 * @version 2016年3月7日
 */
@Service("SysDictService")
public class SysDictServiceImpl implements SysDictService {

	@Resource
	private SysDictMapper dictMapper;
	
	@Override
	public List<SysDict> selectDictList(Map<String, Object> paraMap) {
		return this.dictMapper.selectDictList(paraMap);
	}

	@Override
	public List<SysDict> selectDictList(Long typeId) {
		return this.dictMapper.selectDictListByType(typeId);
	}

	@Override
	public Map<Long, String> selectDictMap(Long typeId) {
		List<SysDict> list = selectDictList(typeId);
		Map<Long, String> map = new HashMap<Long, String>();
		for(SysDict dict : list) {
			map.put(dict.getDictKey(), dict.getDictValue());
		}
		return map;
	}

}
