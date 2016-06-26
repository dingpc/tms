package com.dpc.service;

import java.util.List;
import java.util.Map;

import com.dpc.model.DailyReport;

/** 
 * @author dingpc
 * @version 2016年3月9日
 */
public interface DailyReportService {
	public int save(DailyReport dailyReport);
	public int update(DailyReport dailyReport);
	public DailyReport selectByPrimaryKey(String reportId);
	public int delete(String reportId);
	public List<DailyReport> selectDailyReportList(Map<String, Object> paraMap);
	public int selectDailyReportCount(Map<String, Object> paraMap);
}
