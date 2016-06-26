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
<title>修改测试</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">修改测试</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/tasktest/update" method="post">
			<input type="hidden" id="id" name="id" value="${taskTest.id}"/>
			<input type="hidden" id="taskId" name="taskId" value="${taskTest.taskId}"/>
			<fmt:formatDate var="solveTime" value="${task.solveTime}" type="both" pattern="yyyy-MM-dd"/>
			<div class="form-group">
				<label for="标题" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="title" name="title" value="${taskTest.title}" data-verify="vtype:['notempty',{'maxLength':40}]">
				</div>
			</div>
			<div class="form-group">
				<label for="详情" class="col-sm-2 control-label">详情</label>
				<div class="col-sm-5">
					<textarea class="form-control" rows="3" id="detail" name="detail" data-verify="vtype:[{'maxLength':500}]">${taskTest.detail}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="等级" class="col-sm-2 control-label">等级</label>
				<div class="col-sm-5">
					<select class="form-control" id="grade" name="grade">
						<c:forEach items="${gradeList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq taskTest.grade}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="完成" class="col-sm-2 control-label">修复状态</label>
				<div class="col-sm-5">
					<c:forEach items="${isFixList}" var="obj"  varStatus="status">
						<label class="radio-inline"> 
							<input type="radio" name="isFix" id="isFix${status.index + 1}" value="${obj.dictKey}" <c:if test="${obj.dictKey eq taskTest.isFix}">checked</c:if>><c:out value="${obj.dictValue}"/>
						</label>
					</c:forEach>
				</div>
			</div>
			<div class="form-group">
				<label for="完成" class="col-sm-2 control-label">状态</label>
				<div class="col-sm-5">
					<c:forEach items="${stateList}" var="obj"  varStatus="status">
						<label class="radio-inline"> 
							<input type="radio" name="state" id="state${status.index + 1}" value="${obj.dictKey}" <c:if test="${obj.dictKey eq taskTest.state}">checked</c:if> ><c:out value="${obj.dictValue}"/>
						</label>
					</c:forEach>
				</div>
			</div>
			<div class="form-group">
				<label for="解决时间" class="col-sm-2 control-label">解决时间</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${solveTime }" id="solveTime" name="solveTime" readonly>
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
		$("#solveTime").datetimepicker({
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
		$("#isFix1").attr("checked", "true");
		$("#state1").attr("checked", "true");
	}
	</script>
</body>
</html>