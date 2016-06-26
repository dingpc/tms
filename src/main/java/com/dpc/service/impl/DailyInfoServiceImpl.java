package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.DailyInfoMapper;
import com.dpc.model.DailyInfo;
import com.dpc.model.DailyInfoKey;
import com.dpc.service.DailyInfoService;

/** 
 * @author dingpc
 * @version 2016年3月15日
 */
@Service("DailyInfoService")
public class DailyInfoServiceImpl implements DailyInfoService {

	@Resource
	private DailyInfoMapper mapper;
	
	@Override
	public int save(DailyInfo dailyInfo) {
		return mapper.insertSelective(dailyInfo);
	}

	@Override
	public int update(DailyInfo dailyInfo) {
		return mapper.updateByPrimaryKeySelective(dailyInfo);
	}

	@Override
	public DailyInfo selectByPrimaryKey(DailyInfoKey key) {
		return mapper.selectByPrimaryKey(key);
	}

	@Override
	public int delete(DailyInfoKey key) {
		return mapper.deleteByPrimaryKey(key);
	}

	@Override
	public List<DailyInfo> selectDailyInfoList(Map<String, Object> paraMap) {
		return mapper.selectDailyInfoList(paraMap);
	}

	@Override
	public int selectDailyInfoCount(Map<String, Object> paraMap) {
		return mapper.selectDailyInfoCount(paraMap);
	}

}
