<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/datetime_base.jsp"%>
<title>查看值班信息</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">查看值班信息</h3>
		<form class="form-horizontal" >
			<c:set var="shift" value="${dailyInfo.shift}"></c:set>
			<div class="form-group">
				<label class="col-sm-2 control-label">班次日期</label>
   				<div class="col-sm-5">
					<p class="form-control-static"><fmt:formatDate value="${dailyInfo.shiftDate}" type="both" pattern="yyyy-MM-dd"/></p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">班次</label>
   				<div class="col-sm-5">
					<p class="form-control-static">${shiftMap[shift]}</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">值班人员</label>
   				<div class="col-sm-5">
					<p class="form-control-static">${dailyInfo.shiftUser}</p>
				</div>
			</div>
		</form>
	</div>
</body>
</html>