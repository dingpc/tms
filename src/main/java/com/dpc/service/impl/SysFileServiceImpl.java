package com.dpc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dpc.dao.SysFileMapper;
import com.dpc.model.DailyReport;
import com.dpc.model.SysFile;
import com.dpc.service.SysFileService;
import com.dpc.util.FileUtil;

/** 
 * @author dingpc
 * @version 2016年3月14日
 */
@Service("SysFileService")
public class SysFileServiceImpl implements SysFileService {

	@Resource
	private SysFileMapper mapper;
	@Override
	public int saveBatch(DailyReport report) {
		List<SysFile> list = FileUtil.generateFile(report.getReportId(), report.getRealName(), report.getSaveName());
		for(SysFile file : list) {
			mapper.insertSelective(file);
		}
		return 1;
	}

	@Override
	public List<SysFile> selectFileList(String id) {
		return mapper.selectFileList(id);
	}

	@Override
	public int deleteBatch(String id) {
		return mapper.deleteBatch(id);
	}

}
