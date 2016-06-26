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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dpc.model.DailyInfo;
import com.dpc.model.DailyInfoKey;
import com.dpc.service.DailyInfoService;
import com.dpc.service.SysDictService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.DateUtil;
import com.dpc.util.StringUtil;

/** 
 * @author dingpc
 * @version 2016年3月15日
 */
@Controller
@RequestMapping("/dailyinfo")
public class DailyInfoController {

	private static Logger log = Logger.getLogger(DailyInfoController.class);
	
	@Resource
	private SysDictService dictService;
	@Resource
	private DailyInfoService infoService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		log.debug("/dailyinfo/list");
		
		Date shiftDate = null;
		if(StringUtil.isNotEmpty(request.getParameter("searchShiftDate"))) {
			shiftDate = DateUtil.convertStringToDate(ConstantUtil.PATTERN_DATE, request.getParameter("searchShiftDate"));
		}
		log.debug("searchShiftDate:" + shiftDate);
		int currentPage = StringUtil.formateStringToInt(request.getParameter("currentPage"), 1);
		int pageOffset = StringUtil.formateStringToInt(request.getParameter("pageOffset"), 0);
		currentPage += pageOffset;
		int pageSize = ConstantUtil.PAGER_SIZE;
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("shiftDate", shiftDate);
		paraMap.put("currentOrder", (currentPage-1) * pageSize);
		paraMap.put("pageSize", pageSize);
		
		List<DailyInfo> list = infoService.selectDailyInfoList(paraMap);
		int dataTotal = infoService.selectDailyInfoCount(paraMap);
		
		int pageTotal = (dataTotal + pageSize - 1) / pageSize;
		
		log.debug("currentPage:" + currentPage);
		log.debug("pageOffset:" + pageOffset);
		log.debug("dataTotal:" + dataTotal);
		model.addAttribute("list", list);
		
		model.addAttribute("searchShiftDate", shiftDate);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageTotal", pageTotal);
		model.addAttribute("shiftMap", dictService.selectDictMap(ConstantUtil.DICT_SHIFT_TYPE));
		return "/dailyinfo/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		log.debug("/dailyinfo/add");
		model.addAttribute("shiftList", dictService.selectDictList(ConstantUtil.DICT_SHIFT_TYPE));
		return "/dailyinfo/add";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		log.debug("/dailyinfo/view");
		log.debug("shift:" + request.getParameter("shift") + "----shiftDate:" + request.getParameter("shiftDate"));
		Long shift = new Long(request.getParameter("shift"));
		Date shiftDate = DateUtil.convertStringToDate(ConstantUtil.PATTERN_DATE, request.getParameter("shiftDate"));
		DailyInfoKey key = new DailyInfoKey();
		key.setShiftDate(shiftDate);
		key.setShift(shift);
		DailyInfo dailyInfo = infoService.selectByPrimaryKey(key);
		model.addAttribute("dailyInfo", dailyInfo);
		model.addAttribute("shiftMap", dictService.selectDictMap(ConstantUtil.DICT_SHIFT_TYPE));
		return "/dailyinfo/view";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		log.debug("/dailyinfo/edit");
		log.debug("shift:" + request.getParameter("shift") + "----shiftDate:" + request.getParameter("shiftDate"));
		Long shift = new Long(request.getParameter("shift"));
		Date shiftDate = DateUtil.convertStringToDate(ConstantUtil.PATTERN_DATE, request.getParameter("shiftDate"));
		DailyInfoKey key = new DailyInfoKey();
		key.setShiftDate(shiftDate);
		key.setShift(shift);
		DailyInfo dailyInfo = infoService.selectByPrimaryKey(key);
		model.addAttribute("dailyInfo", dailyInfo);
		model.addAttribute("shiftList", dictService.selectDictList(ConstantUtil.DICT_SHIFT_TYPE));
		return "/dailyinfo/edit";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, String> save(@RequestBody DailyInfo dailyInfo, HttpServletRequest request, Model model) {
		log.debug("/dailyinfo/save");
		Map<String, String> map = new HashMap<String, String>(1);
		dailyInfo.setCreateTime(new Date());
		infoService.save(dailyInfo);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(@RequestBody DailyInfo dailyInfo) {
		Map<String, String> map = new HashMap<String, String>(1);
		infoService.update(dailyInfo);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping({"/delete"})
	@ResponseBody  
	public Map<String, String> delete(DailyInfoKey key, Model model) {
		log.debug("delete result:" + key.getShiftDate());
		Map<String, String> map = new HashMap<String, String>(1);
		int result = infoService.delete(key);
		log.debug("delete result:" + result);
		if(result > 0) {
			map.put("success", "true");
		} else {
			map.put("success", "false");
		}
		return map;
	}
}
