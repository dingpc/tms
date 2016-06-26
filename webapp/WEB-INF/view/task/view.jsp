<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>查看任务</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">查看任务</h3>
			</div>
		</div>
		<div class="row">
			<c:set var="module" value="${task.module}"></c:set>
			<c:set var="grade" value="${task.grade}"></c:set>
			<c:set var="isComplete" value="${task.isComplete}"></c:set>
			<div class="col-md-6">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 control-label">所属模块</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${moduleMap[module]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">标题</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${task.title}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">负责人</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${task.leaderName}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">申请部门</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${task.applyDept}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">开始日期</label>
	    				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${task.startTime}" type="both" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">逾期天数</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${task.overdueDay}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">完成程度</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${isCompleteMap[isComplete]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">进度(%)</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${task.progress}</p>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 control-label">等级</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${gradeMap[grade]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">详情</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${task.detail}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">成员</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${task.memberName}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">申请人员</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${task.applyUserName}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">结束日期</label>
		   				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${task.endTime}" type="both" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">逾期原因</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${task.overdueReason}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">完成日期</label>
		   				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${task.completeTime}" type="both" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
		   				<div class="col-md-6">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>