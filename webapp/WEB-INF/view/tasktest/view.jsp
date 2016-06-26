<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>测试详情</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">测试详情</h3>
			</div>
		</div>
		<div class="row">
			<c:set var="grade" value="${taskTest.grade}"></c:set>
			<c:set var="isFix" value="${taskTest.isFix}"></c:set>
			<c:set var="state" value="${taskTest.state}"></c:set>
			<div class="col-md-6">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 control-label">标题</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${taskTest.title}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">所属任务</label>
	    				<div class="col-md-6">
							<p class="form-control-static"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">测试人员</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${taskTest.createUserName}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">修复状态</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${isFixMap[isFix]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">解决日期</label>
	    				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${taskTest.solveTime}" type="both" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 control-label">详情</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${taskTest.detail}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">等级</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${gradeMap[grade]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">测试时间</label>
		   				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${taskTest.createTime}" type="both" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">状态</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${stateMap[state]}</p>
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