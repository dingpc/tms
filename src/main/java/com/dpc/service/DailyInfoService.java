package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.DailyInfo;
import com.dpc.model.DailyInfoKey;

/** 
 * @author dingpc
 * @version 2016年3月15日
 */
public interface DailyInfoService {
	public int save(DailyInfo dailyInfo);
	public int update(DailyInfo dailyInfo);
	public DailyInfo selectByPrimaryKey(DailyInfoKey key);
	public int delete(DailyInfoKey key);
	public List<DailyInfo> selectDailyInfoList(Map<String, Object> paraMap);
	public int selectDailyInfoCount(Map<String, Object> paraMap);
}
