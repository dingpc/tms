package com.dpc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dpc.model.DailyReport;
import com.dpc.model.SysFile;
import com.dpc.service.DailyReportService;
import com.dpc.service.SysDictService;
import com.dpc.service.SysFileService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.StringUtil;

/** 
 * @author dingpc
 * @version 2016年3月10日
 */
@Controller
@RequestMapping("/dailyreport")
public class DailyReportController {
	private static Logger log = Logger.getLogger(DailyReportController.class);
	@Resource
	private DailyReportService reportService;
	@Resource
	private SysDictService dictService;
	@Resource
	private SysFileService fileService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		log.debug("/dailyreport/list");
		
		String searchQuestionTitle = StringUtil.formateStringToUTF8(request.getParameter("searchQuestionTitle"), "", true);
		log.debug("searchQuestionTitle:" + searchQuestionTitle);
		int currentPage = StringUtil.formateStringToInt(request.getParameter("currentPage"), 1);
		int pageOffset = StringUtil.formateStringToInt(request.getParameter("pageOffset"), 0);
		currentPage += pageOffset;
		int pageSize = ConstantUtil.PAGER_SIZE;
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("questionTitle", searchQuestionTitle);
		paraMap.put("currentOrder", (currentPage-1) * pageSize);
		paraMap.put("pageSize", pageSize);
		
		List<DailyReport> reportList = reportService.selectDailyReportList(paraMap);
		int dataTotal = reportService.selectDailyReportCount(paraMap);
		
		int pageTotal = (dataTotal + pageSize - 1) / pageSize;
		
		log.debug("currentPage:" + currentPage);
		log.debug("pageOffset:" + pageOffset);
		log.debug("dataTotal:" + dataTotal);
		model.addAttribute("list", reportList);
		
		model.addAttribute("searchQuestionTitle", searchQuestionTitle);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageTotal", pageTotal);
		
		model.addAttribute("shiftMap", dictService.selectDictMap(ConstantUtil.DICT_SHIFT_TYPE));
		model.addAttribute("shopMap", dictService.selectDictMap(ConstantUtil.DICT_SHOP_TYPE));
		model.addAttribute("questionTypeMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_TYPE));
		model.addAttribute("contactMap", dictService.selectDictMap(ConstantUtil.DICT_CONTACT_TYPE));
		model.addAttribute("questionStateMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_STATE));
		model.addAttribute("answerTypeMap", dictService.selectDictMap(ConstantUtil.DICT_ANSWER_TYPE));
		return "/dailyreport/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		log.debug("/dailyreport/add");
		model.addAttribute("shiftList", dictService.selectDictList(ConstantUtil.DICT_SHIFT_TYPE));
		model.addAttribute("shopList", dictService.selectDictList(ConstantUtil.DICT_SHOP_TYPE));
		model.addAttribute("questionTypeList", dictService.selectDictList(ConstantUtil.DICT_QUESTION_TYPE));
		model.addAttribute("contactList", dictService.selectDictList(ConstantUtil.DICT_CONTACT_TYPE));
		model.addAttribute("questionStateList", dictService.selectDictList(ConstantUtil.DICT_QUESTION_STATE));
		model.addAttribute("answerTypeList", dictService.selectDictList(ConstantUtil.DICT_ANSWER_TYPE));
		return "/dailyreport/add";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		log.debug("/dailyreport/view");
		String reportId = request.getParameter("reportId");
		log.debug("userId:" + reportId);
		DailyReport report = reportService.selectByPrimaryKey(reportId);
		List<SysFile> fileList = fileService.selectFileList(reportId);
		
		String realName = "";
		String saveName = "";
		for(SysFile file : fileList) {
			realName += "**" + file.getRealName() + "**";
			saveName += "**" + file.getSaveName() + "**";
		}
		report.setRealName(realName);
		report.setSaveName(saveName);
		
		model.addAttribute("report", report);
		model.addAttribute("fileList", fileList);
		
		model.addAttribute("shiftMap", dictService.selectDictMap(ConstantUtil.DICT_SHIFT_TYPE));
		model.addAttribute("shopMap", dictService.selectDictMap(ConstantUtil.DICT_SHOP_TYPE));
		model.addAttribute("questionTypeMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_TYPE));
		model.addAttribute("contactMap", dictService.selectDictMap(ConstantUtil.DICT_CONTACT_TYPE));
		model.addAttribute("questionStateMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_STATE));
		model.addAttribute("answerTypeMap", dictService.selectDictMap(ConstantUtil.DICT_ANSWER_TYPE));
		return "/dailyreport/view";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		log.debug("/dailyreport/edit");
		String reportId = request.getParameter("reportId");
		log.debug("userId:" + reportId);
		DailyReport report = reportService.selectByPrimaryKey(reportId);
		List<SysFile> fileList = fileService.selectFileList(reportId);
		
		String realName = "";
		String saveName = "";
		for(SysFile file : fileList) {
			realName += "**" + file.getRealName() + "**";
			saveName += "**" + file.getSaveName() + "**";
		}
		report.setRealName(realName);
		report.setSaveName(saveName);
		
		model.addAttribute("report", report);
		model.addAttribute("fileList", fileList);
		
		model.addAttribute("shiftList", dictService.selectDictList(ConstantUtil.DICT_SHIFT_TYPE));
		model.addAttribute("shopList", dictService.selectDictList(ConstantUtil.DICT_SHOP_TYPE));
		model.addAttribute("questionTypeList", dictService.selectDictList(ConstantUtil.DICT_QUESTION_TYPE));
		model.addAttribute("contactList", dictService.selectDictList(ConstantUtil.DICT_CONTACT_TYPE));
		model.addAttribute("questionStateList", dictService.selectDictList(ConstantUtil.DICT_QUESTION_STATE));
		model.addAttribute("answerTypeList", dictService.selectDictList(ConstantUtil.DICT_ANSWER_TYPE));
		return "/dailyreport/edit";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, String> save(@RequestBody DailyReport report, HttpServletRequest request, Model model) {
		log.debug("/dailyreport/save");
		Map<String, String> map = new HashMap<String, String>(1);
		String reportId = UUID.randomUUID().toString();
		report.setReportId(reportId);
		report.setCreateTime(new Date());
		log.debug("realName:" + request.getParameter("realName"));
		log.debug("realName:" + report.getRealName());
		reportService.save(report);
		fileService.saveBatch(report);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(@RequestBody DailyReport report) {
		Map<String, String> map = new HashMap<String, String>(1);
		reportService.update(report);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping({"/delete"})
	@ResponseBody  
	public Map<String, String> delete(HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>(1);
		String idStr = request.getParameter("idStr");
		log.debug("idStr:" + idStr);
		int result = reportService.delete(idStr);
		if(result > 0) {
			map.put("success", "true");  
		} else {
			map.put("success", "false");  
		}
		return map;
	}
}
