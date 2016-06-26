package com.dpc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.DailyReportMapper;
import com.dpc.model.DailyReport;
import com.dpc.service.DailyReportService;

/** 
 * @author dingpc
 * @version 2016年3月9日
 */
@Service("DailyReportService")
public class DailyReportServiceImpl implements DailyReportService {

	@Resource
	private DailyReportMapper mapper;
	
	@Override
	public int save(DailyReport dailyReport) {
		return this.mapper.insertSelective(dailyReport);
	}

	@Override
	public int update(DailyReport dailyReport) {
		return this.mapper.updateByPrimaryKeySelective(dailyReport);
	}

	@Override
	public DailyReport selectByPrimaryKey(String reportId) {
		return this.mapper.selectByPrimaryKey(reportId);
	}

	@Override
	public int delete(String reportId) {
		return this.mapper.deleteByPrimaryKey(reportId);
	}

	@Override
	public List<DailyReport> selectDailyReportList(Map<String, Object> paraMap) {
		return this.mapper.selectDailyReportList(paraMap);
	}

	@Override
	public int selectDailyReportCount(Map<String, Object> paraMap) {
		return this.mapper.selectDailyReportCount(paraMap);
	}

}
