package com.dpc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dpc.model.DailyInfo;
import com.dpc.model.DailyReport;
import com.dpc.service.DailyInfoService;
import com.dpc.service.DailyReportService;
import com.dpc.service.SysDictService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.DateUtil;
import com.dpc.util.StringUtil;

/** 
 * @author dingpc
 * @version 2016年3月10日
 */
@Controller
@RequestMapping("/daily")
public class DailyController {

	private static Logger log = Logger.getLogger(DailyController.class);
	@Resource
	private DailyReportService reportService;
	@Resource
	private SysDictService dictService;
	@Resource
	private DailyInfoService infoService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		log.debug("/daily/index");
		return "/daily/index";
	}
	
	@RequestMapping("/overview")
	public String overview(HttpServletRequest request, Model model, @RequestParam(value="searchShiftDate", defaultValue="") String searchShiftDate) {
		log.debug("/daily/overview");
		Date shiftDate = new Date();
		if(StringUtil.isNotEmpty(searchShiftDate)) {
			shiftDate = DateUtil.convertStringToDate(ConstantUtil.PATTERN_DATE, searchShiftDate);
		}
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("shiftDate", shiftDate);
		List<DailyInfo> dailyInfoList = infoService.selectDailyInfoList(paraMap);
		List<DailyReport> dailyReportList = reportService.selectDailyReportList(paraMap);
		
		model.addAttribute("searchShiftDate", shiftDate);
		model.addAttribute("dailyInfoList", dailyInfoList);
		model.addAttribute("dailyReportList", dailyReportList);
		
		int questionResolving = 0;
		int questionResolved = 0;
		int questionTotal = 0;
		for(DailyReport obj : dailyReportList) {
			if(ConstantUtil.QUESTION_STATE_RESOLVING.equals(obj.getQuestionState())) {
				questionResolving++;
			} else if(ConstantUtil.QUESTION_STATE_RESOLVED.equals(obj.getQuestionState())) {
				questionResolved++;
			}
		}
		questionTotal = questionResolving + questionResolved;
		model.addAttribute("questionResolving", questionResolving);
		model.addAttribute("questionResolved", questionResolved);
		model.addAttribute("questionTotal", questionTotal);
		
		model.addAttribute("shiftMap", dictService.selectDictMap(ConstantUtil.DICT_SHIFT_TYPE));
		model.addAttribute("shopMap", dictService.selectDictMap(ConstantUtil.DICT_SHOP_TYPE));
		model.addAttribute("questionTypeMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_TYPE));
		model.addAttribute("contactMap", dictService.selectDictMap(ConstantUtil.DICT_CONTACT_TYPE));
		model.addAttribute("questionStateMap", dictService.selectDictMap(ConstantUtil.DICT_QUESTION_STATE));
		model.addAttribute("answerTypeMap", dictService.selectDictMap(ConstantUtil.DICT_ANSWER_TYPE));
		return "/daily/overview";
	}
	
	@RequestMapping("/left")
	public String left(HttpServletRequest request, Model model) {
		log.debug("/daily/left");
		return "/daily/left";
	}
}
