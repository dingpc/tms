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

import com.dpc.model.SysUser;
import com.dpc.model.TaskTest;
import com.dpc.service.SysDictService;
import com.dpc.service.TaskTestService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.StringUtil;

/** 
 * @author dingpc
 * @version 2016年5月9日
 */
@Controller
@RequestMapping("/tasktest")
public class TaskTestController {
	private static Logger log = Logger.getLogger(TaskTestController.class);

	@Resource
	private TaskTestService taskTestService;
	@Resource
	private SysDictService dictService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		log.debug("/tasktest/list");
		
		String searchTitle = StringUtil.formateStringToUTF8(request.getParameter("searchTitle"), "", true);
		String parentId = StringUtil.formateStringToUTF8(request.getParameter("parentId"), "0", true);
		String taskId = StringUtil.formateStringToUTF8(request.getParameter("taskId"), "", true);
		log.debug("searchTitle:" + searchTitle);
		log.debug("taskId:" + taskId);
		int currentPage = StringUtil.formateStringToInt(request.getParameter("currentPage"), 1);
		int pageOffset = StringUtil.formateStringToInt(request.getParameter("pageOffset"), 0);
		currentPage += pageOffset;
		int pageSize = ConstantUtil.PAGER_SIZE;
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("title", searchTitle);
		paraMap.put("taskId", taskId);
		paraMap.put("currentOrder", (currentPage-1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("parentId", "0");
		List<TaskTest> taskTestList = taskTestService.selectTaskTestList(paraMap);
		int dataTotal = taskTestService.selectTaskTestCount(paraMap);
		
		int pageTotal = (dataTotal + pageSize - 1) / pageSize;
		
		log.debug("currentPage:" + currentPage);
		log.debug("pageOffset:" + pageOffset);
		log.debug("dataTotal:" + dataTotal);
		model.addAttribute("list", taskTestList);
		
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("taskId", taskId);
		model.addAttribute("parentId", parentId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageTotal", pageTotal);
		
		model.addAttribute("gradeMap", dictService.selectDictMap(ConstantUtil.DICT_TASK_GRADE));
		model.addAttribute("isFixMap", dictService.selectDictMap(ConstantUtil.DICT_TEST_FIX));
		model.addAttribute("stateMap", dictService.selectDictMap(ConstantUtil.DICT_TEST_STATE));
		return "/tasktest/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		log.debug("/tasktest/add");
		String taskId = request.getParameter("taskId");
		model.addAttribute("taskId", taskId);
		model.addAttribute("gradeList", dictService.selectDictList(ConstantUtil.DICT_TASK_GRADE));
		model.addAttribute("isFixList", dictService.selectDictList(ConstantUtil.DICT_TEST_FIX));
		model.addAttribute("stateList", dictService.selectDictList(ConstantUtil.DICT_TEST_STATE));
		return "/tasktest/add";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		log.debug("/tasktest/view");
		String id = request.getParameter("id");
		log.debug("id:" + id);
		TaskTest taskTest = taskTestService.selectByPrimaryKey(id);
		
		model.addAttribute("taskTest", taskTest);
		
		model.addAttribute("gradeMap", dictService.selectDictMap(ConstantUtil.DICT_TASK_GRADE));
		model.addAttribute("isFixMap", dictService.selectDictMap(ConstantUtil.DICT_TEST_FIX));
		model.addAttribute("stateMap", dictService.selectDictMap(ConstantUtil.DICT_TEST_STATE));
		return "/tasktest/view";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		log.debug("/tasktest/edit");
		String id = request.getParameter("id");
		log.debug("id:" + id);
		TaskTest taskTest = taskTestService.selectByPrimaryKey(id);
		
		model.addAttribute("taskTest", taskTest);
		
		model.addAttribute("gradeMap", dictService.selectDictMap(ConstantUtil.DICT_TASK_GRADE));
		model.addAttribute("isFixMap", dictService.selectDictMap(ConstantUtil.DICT_TEST_FIX));
		model.addAttribute("stateMap", dictService.selectDictMap(ConstantUtil.DICT_TEST_STATE));
		model.addAttribute("gradeList", dictService.selectDictList(ConstantUtil.DICT_TASK_GRADE));
		model.addAttribute("isFixList", dictService.selectDictList(ConstantUtil.DICT_TEST_FIX));
		model.addAttribute("stateList", dictService.selectDictList(ConstantUtil.DICT_TEST_STATE));
		return "/tasktest/edit";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, String> save(@RequestBody TaskTest taskTest, HttpServletRequest request, Model model) {
		log.debug("/task/save");
		log.debug("task Title:" + taskTest.getTitle());
		SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUserSession");
		Map<String, String> map = new HashMap<String, String>(1);
		String id = UUID.randomUUID().toString();
		taskTest.setId(id);
		taskTest.setCreateTime(new Date());
		taskTest.setCreateUserId(sysUser.getUserId());
		taskTest.setCreateUserName(sysUser.getRealName());
		taskTestService.save(taskTest);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(@RequestBody TaskTest taskTest) {
		Map<String, String> map = new HashMap<String, String>(1);
		taskTestService.update(taskTest);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping({"/delete"})
	@ResponseBody  
	public Map<String, String> delete(HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>(1);
		String idStr = request.getParameter("idStr");
		log.debug("idStr:" + idStr);
		int result = taskTestService.delete(idStr);
		if(result > 0) {
			map.put("success", "true");  
		} else {
			map.put("success", "false");  
		}
		return map;
	}
	
}
