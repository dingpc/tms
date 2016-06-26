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
import com.dpc.model.Task;
import com.dpc.service.SysDictService;
import com.dpc.service.TaskService;
import com.dpc.util.ConstantUtil;
import com.dpc.util.StringUtil;

/** 
 * @author dingpc
 * @version 2016年5月9日
 */
@Controller
@RequestMapping("/task")
public class TaskController {

	private static Logger log = Logger.getLogger(TaskController.class);
	@Resource
	private TaskService taskService;
	
	@Resource
	private SysDictService dictService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		return "/task/index";
	}
	
	@RequestMapping("/left")
	public String left(HttpServletRequest request, Model model) {
		return "/task/left";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		log.debug("/task/list");
		
		String searchTitle = StringUtil.formateStringToUTF8(request.getParameter("searchTitle"), "", true);
		log.debug("searchTitle:" + searchTitle);
		int currentPage = StringUtil.formateStringToInt(request.getParameter("currentPage"), 1);
		int pageOffset = StringUtil.formateStringToInt(request.getParameter("pageOffset"), 0);
		currentPage += pageOffset;
		int pageSize = ConstantUtil.PAGER_SIZE;
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("title", searchTitle);
		paraMap.put("currentOrder", (currentPage-1) * pageSize);
		paraMap.put("pageSize", pageSize);
		paraMap.put("parentId", "0");
		List<Task> taskList = taskService.selectTaskList(paraMap);
		int dataTotal = taskService.selectTaskCount(paraMap);
		
		int pageTotal = (dataTotal + pageSize - 1) / pageSize;
		
		log.debug("currentPage:" + currentPage);
		log.debug("pageOffset:" + pageOffset);
		log.debug("dataTotal:" + dataTotal);
		model.addAttribute("list", taskList);
		
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageTotal", pageTotal);
		
		model.addAttribute("moduleMap", dictService.selectDictMap(ConstantUtil.DICT_MODULE));
		model.addAttribute("isCompleteMap", dictService.selectDictMap(ConstantUtil.DICT_COMPLETE_STATE));
		model.addAttribute("gradeMap", dictService.selectDictMap(ConstantUtil.DICT_TASK_GRADE));
		return "/task/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		log.debug("/task/add");
		String parentId = StringUtil.isEmpty(request.getParameter("parentId")) ? "0" : request.getParameter("parentId");
		model.addAttribute("parentId", parentId);
		model.addAttribute("moduleList", dictService.selectDictList(ConstantUtil.DICT_MODULE));
		model.addAttribute("isCompleteList", dictService.selectDictList(ConstantUtil.DICT_COMPLETE_STATE));
		model.addAttribute("gradeList", dictService.selectDictList(ConstantUtil.DICT_TASK_GRADE));
		return "/task/add";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		log.debug("/task/view");
		String id = request.getParameter("id");
		log.debug("id:" + id);
		Task task = taskService.selectByPrimaryKey(id);
		
		model.addAttribute("task", task);
		
		model.addAttribute("moduleMap", dictService.selectDictMap(ConstantUtil.DICT_MODULE));
		model.addAttribute("isCompleteMap", dictService.selectDictMap(ConstantUtil.DICT_COMPLETE_STATE));
		model.addAttribute("gradeMap", dictService.selectDictMap(ConstantUtil.DICT_TASK_GRADE));
		return "/task/view";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		log.debug("/task/edit");
		String id = request.getParameter("id");
		log.debug("id:" + id);
		Task task = taskService.selectByPrimaryKey(id);
		
		model.addAttribute("task", task);
		
		model.addAttribute("moduleList", dictService.selectDictList(ConstantUtil.DICT_MODULE));
		model.addAttribute("isCompleteList", dictService.selectDictList(ConstantUtil.DICT_COMPLETE_STATE));
		model.addAttribute("gradeList", dictService.selectDictList(ConstantUtil.DICT_TASK_GRADE));
		return "/task/edit";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, String> save(@RequestBody Task task, HttpServletRequest request, Model model) {
		log.debug("/task/save");
		log.debug("task Title:" + task.getTitle());
		SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUserSession");
		Map<String, String> map = new HashMap<String, String>(1);
		String id = UUID.randomUUID().toString();
		task.setId(id);
		task.setCreateTime(new Date());
		task.setCreateUserId(sysUser.getUserId());
		taskService.save(task);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(@RequestBody Task task) {
		Map<String, String> map = new HashMap<String, String>(1);
		taskService.update(task);
		map.put("success", "true");
		return map;
	}
	
	@RequestMapping({"/delete"})
	@ResponseBody  
	public Map<String, String> delete(HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>(1);
		String idStr = request.getParameter("idStr");
		log.debug("idStr:" + idStr);
		int result = taskService.delete(idStr);
		if(result > 0) {
			map.put("success", "true");  
		} else {
			map.put("success", "false");  
		}
		return map;
	}
	
	@RequestMapping("/subList")
	public String subList(HttpServletRequest request, Model model) {
		log.debug("/task/subList");
		String parentId = request.getParameter("parentId");
		Task parentTask = taskService.selectByPrimaryKey(parentId);
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("parentId", parentId);
		List<Task> taskList = taskService.selectTaskList(paraMap);
		
		model.addAttribute("parentTask", parentTask);
		model.addAttribute("list", taskList);
		
		model.addAttribute("moduleMap", dictService.selectDictMap(ConstantUtil.DICT_MODULE));
		model.addAttribute("isCompleteMap", dictService.selectDictMap(ConstantUtil.DICT_COMPLETE_STATE));
		model.addAttribute("gradeMap", dictService.selectDictMap(ConstantUtil.DICT_TASK_GRADE));
		return "/task/subList";
	}
}
