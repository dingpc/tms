<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>Daily Report</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">Daily Report</h3>
			</div>
		</div>
		<div class="row">
			<c:set var="shift" value="${report.shift}"></c:set>
			<c:set var="shop" value="${report.shop}"></c:set>
			<c:set var="questionType" value="${report.questionType}"></c:set>
			<c:set var="questionContact" value="${report.questionContact}"></c:set>
			<c:set var="questionState" value="${report.questionState}"></c:set>
			<c:set var="answerType" value="${report.answerType}"></c:set>
			<div class="col-md-6">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 control-label">问题标题</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${report.questionTitle}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">班次日期</label>
	    				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${report.shiftDate}" type="both" pattern="yyyy-MM-dd"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">班次</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${shiftMap[shift]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">分厂</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${shopMap[shop]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">问题类型</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${questionTypeMap[questionType]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">申请人</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${report.questionUser}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">联系方式</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${contactMap[questionContact]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">申请人电话</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${report.questionPhone}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">问题详情</label>
	    				<div class="col-md-6">
							<p class="form-control-static">${report.questionDetail}</p>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-md-3 control-label">问题状态</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${questionStateMap[questionState]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">问题原因</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${report.questionReason}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">接收时间</label>
		   				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${report.receiveTime}" type="both" pattern="yyyy-MM-dd HH:mm"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">接收人员</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${report.receiveUser}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">解决时间</label>
		   				<div class="col-md-6">
							<p class="form-control-static"><fmt:formatDate value="${report.answerTime}" type="both" pattern="yyyy-MM-dd HH:mm"/></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">处理方式</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${answerTypeMap[answerType]}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">处理人员</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${report.answerUser}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">解决详情</label>
		   				<div class="col-md-6">
							<p class="form-control-static">${report.answerDetail}</p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>