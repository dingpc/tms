<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/datetime_base.jsp"%>
<%@ include file="/static/common/upload_base.jsp"%>
<title>修改任务</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">修改任务</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/task/update" method="post">
			<input type="hidden" id="id" name="id" value="${task.id}"/>
			<input type="hidden" id="parentId" name="parentId" value="${task.parentId}"/>
			<fmt:formatDate var="startTime" value="${task.startTime}" type="both" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="endTime" value="${task.endTime}" type="both" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="completeTime" value="${task.completeTime}" type="both" pattern="yyyy-MM-dd"/>
			<div class="form-group">
				<label for="所属模块" class="col-sm-2 control-label">所属模块</label>
				<div class="col-sm-5">
					<select class="form-control" id="module" name="module">
						<c:forEach items="${moduleList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq task.module}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="标题" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="title" name="title" value="${task.title}" data-verify="vtype:['notempty',{'maxLength':40}]">
				</div>
			</div>
			<div class="form-group">
				<label for="详情" class="col-sm-2 control-label">详情</label>
				<div class="col-sm-5">
					<textarea class="form-control" rows="3" id="detail" name="detail" data-verify="vtype:[{'maxLength':500}]">${task.detail}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="等级" class="col-sm-2 control-label">等级</label>
				<div class="col-sm-5">
					<select class="form-control" id="grade" name="grade">
						<c:forEach items="${gradeList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq task.grade}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="负责人" class="col-sm-2 control-label">负责人</label>
				<div class="col-sm-5">
					<input type="hidden" id="leaderId" name="leaderId" value="${task.leaderId}"/>
					<input type="text" class="form-control" id="leaderName" name="leaderName" value="${task.leaderName}" data-verify="vtype:['notempty',{'maxLength':200}]" 
					onclick="openNewWin({url:'/sysuser/select?id=leaderId&name=leaderName',width:600,height:400,winName:'selectuser'});" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="成员" class="col-sm-2 control-label">成员</label>
				<div class="col-sm-5">
					<input type="hidden" id="memberId" name="memberId" value="${task.memberId}"/>
					<input type="text" class="form-control" id="memberName" name="memberName" value="${task.memberName}" data-verify="vtype:[{'maxLength':200}]"  
					onclick="openNewWin({url:'/sysuser/select?id=memberId&name=memberName',width:600,height:400,winName:'selectuser'});" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="申请部门" class="col-sm-2 control-label">申请部门</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="applyDept" name="applyDept" value="${task.applyDept}" data-verify="vtype:[{'maxLength':100}]">
				</div>
			</div>
			<div class="form-group">
				<label for="申请人员" class="col-sm-2 control-label">申请人员</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="applyUserName" name="applyUserName" value="${task.applyUserName}" data-verify="vtype:[{'maxLength':100}]">
				</div>
			</div>
			<div class="form-group">
				<label for="开始日期" class="col-sm-2 control-label">开始日期</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${startTime }" id="startTime" name="startTime" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="结束日期" class="col-sm-2 control-label">结束日期</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${endTime }" id="endTime" name="endTime" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="进度" class="col-sm-2 control-label">进度(%)</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="progress" name="progress" value="${task.progress}" data-verify="vtype:['notempty',{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="逾期天数" class="col-sm-2 control-label">逾期天数</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="overdueDay" name="overdueDay" value="${task.overdueDay}" data-verify="vtype:[{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="逾期原因" class="col-sm-2 control-label">逾期原因</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="overdueReason" name="overdueReason" value="${task.overdueReason}" data-verify="vtype:[{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="完成" class="col-sm-2 control-label">完成程度</label>
				<div class="col-sm-5">
					<c:forEach items="${isCompleteList}" var="obj"  varStatus="status">
						<label class="radio-inline"> 
							<input type="radio" name="isComplete" id="isComplete${status.index + 1}" value="${obj.dictKey}" <c:if test="${obj.dictKey eq task.isComplete}">checked</c:if>><c:out value="${obj.dictValue}"/>
						</label>
					</c:forEach>
				</div>
			</div>
			<div class="form-group">
				<label for="完成日期" class="col-sm-2 control-label">完成日期</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${completeTime }" id="completeTime" name="completeTime" readonly>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="button" class="btn btn-success" onclick="ajax_submit(0, this);"><span class="glyphicon glyphicon-ok"></span> 提交</button>
					<button type="button" class="btn btn-danger" onclick="window.close();"><span class="glyphicon glyphicon-ban-circle"></span> 取消</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#startTime").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd",
	        autoclose: true,
	        todayBtn: true,
	        minView: 2,
	        pickerPosition: "bottom-left"
	    });
		$("#endTime").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd",
	        autoclose: true,
	        todayBtn: true,
	        minView: 2,
	        pickerPosition: "bottom-left"
	    });
		$("#completeTime").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd",
	        autoclose: true,
	        todayBtn: true,
	        minView: 2,
	        pickerPosition: "bottom-left"
	    });
		init();
	});
	
	function init() {
		$("#isComplete1").attr("checked", "true");
	}
	
	/* function selectCompleteState(obj) {
		$("#isComplete").val(obj.value);
	} */
	</script>
</body>
</html>