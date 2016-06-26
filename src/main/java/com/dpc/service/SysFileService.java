package com.dpc.service;

import java.util.List;

import com.dpc.model.DailyReport;
import com.dpc.model.SysFile;

/** 
 * @author dingpc
 * @version 2016年3月13日
 */
public interface SysFileService {

	int saveBatch(DailyReport report);
	
	List<SysFile> selectFileList(String id);
	
	int deleteBatch(String id);
}
