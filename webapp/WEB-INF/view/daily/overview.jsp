<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/datetime_base.jsp"%>
<title>WMP</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">Daily Report</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<table class="table table-striped">
					<thead>
						<tr>
						    <th width="20%">班次</th>
						    <th width="80%">值班人员</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${dailyInfoList}" var="obj"  varStatus="status">
						<c:set var="shift" value="${obj.shift}"></c:set>
						<tr>
							<td>${shiftMap[shift]}</td>
							<td>${obj.shiftUser}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-2">
				<table class="table table-striped">
					<thead>
						<tr>
						    <th width="80%">Total</th>
						    <th width="20%">${questionTotal}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>解决中</td>
							<td>${questionResolving}</td>
						</tr>
						<tr>
							<td>已解决</td>
							<td>${questionResolved}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3 col-md-offset-4">
				<form class="navbar-form navbar-left" role="search" action="/daily/overview">
				<fmt:formatDate var="searchShiftDateFormate" value="${searchShiftDate}" type="both" pattern="yyyy-MM-dd"/>
            		<div class="form-group">
              			<input size="16" type="text" class="form-control" value="${searchShiftDateFormate }" id="searchShiftDate" name="searchShiftDate" readonly>
            		</div>
            		<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr class="listTableHead">
							    <th rowspan="2" width="5%">序号</th>
							    <th rowspan="2" width="5%">班次</th>
							    <th colspan="4">问题信息</th>
							    <th colspan="4">处理信息</th>
							</tr>
							<tr class="listTableHead">
								<th width="10%">分厂</th>
								<th nowrap="nowrap">问题标题</th>
								<th width="8%">问题类型</th>
								<th width="8%">申请人</th>
								<th width="8%">问题状态</th>
								<th width="15%">解决时间</th>
								<th width="8%">处理方式</th>
								<th width="8%">处理人</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dailyReportList}" var="obj"  varStatus="status">
							<c:set var="shift" value="${obj.shift}"></c:set>
							<c:set var="shop" value="${obj.shop}"></c:set>
							<c:set var="questionType" value="${obj.questionType}"></c:set>
							<c:set var="questionState" value="${obj.questionState}"></c:set>
							<c:set var="answerType" value="${obj.answerType}"></c:set>
							<tr>
								<td align="center">${status.index + 1}</td>
								<td>${shiftMap[shift]}</td>
								<td>${shopMap[shop]}</td>
								<td><a href="javascript:void(0)" onclick="openNewWin({url:'/dailyreport/view?reportId=${obj.reportId}',width:1000,height:600,winName:'add'});">${obj.questionTitle}</a></td>
								<td>${questionTypeMap[questionType]}</td>
								<td>${obj.questionUser}</td>
								<td>${questionStateMap[questionState]}</td>
								<td align="center"><fmt:formatDate value="${obj.answerTime}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
								<td>${answerTypeMap[answerType]}</td>
								<td>${obj.answerUser}</td>
							</tr>
						 </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#searchShiftDate").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd",
	        autoclose: true,
	        todayBtn: true,
	        minView: 2,
	        pickerPosition: "bottom-left"
	    });
	});
	</script>
</body>
</html>