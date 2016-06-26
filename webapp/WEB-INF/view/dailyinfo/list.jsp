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
			<div class="col-md-10">
				<form id="searchForm" name="searchForm" class="navbar-form navbar-left" role="search" action="/dailyinfo/list">
				<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}"/>
				<fmt:formatDate var="searchShiftDateFormate" value="${searchShiftDate}" type="both" pattern="yyyy-MM-dd"/>
            		<div class="form-group">
              			<input size="16" type="text" class="form-control" value="${searchShiftDateFormate }" id="searchShiftDate" name="searchShiftDate" readonly>
            		</div>
            		<button type="button" class="btn btn-default" onclick="location_search('/dailyinfo/list', 'searchForm', '0')"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
			<div class="col-md-2 navbar-form div-operation-button">
				<button type="button" class="btn btn-primary" onclick="openNewWin({url:'/dailyinfo/add',width:800,height:600,winName:'add'});"><span class="glyphicon glyphicon-plus"></span> 新增</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr class="listTableHead">
								<th width="10%">序号</th>
								<th width="20%">日期</th>
								<th width="10%">班次</th>
								<th width="40%">值班人员</th>
								<th nowrap="nowrap">操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="obj"  varStatus="status">
							<c:set var="shift" value="${obj.shift}"></c:set>
							<fmt:formatDate value="${obj.shiftDate}" var="shiftDate" type="both" pattern="yyyy-MM-dd"/>
							<tr>
								<td align="center">${status.index + 1}</td>
								<td align="center">${shiftDate }</td>
								<td>${shiftMap[shift]}</td>
								<td>${obj.shiftUser}</td>
								<td align="center">
									<button type="button" class="btn btn-info btn-xs" onclick="openNewWin({url:'/dailyinfo/view?shift=${obj.shift}&shiftDate=${shiftDate}',width:800,height:600,winName:'view'});" title="详情"><span class="glyphicon glyphicon-info-sign"></span></button>
									<button type="button" class="btn btn-warning btn-xs" onclick="openNewWin({url:'/dailyinfo/edit?shift=${obj.shift}&shiftDate=${shiftDate}',width:800,height:600,winName:'edit'});" title="修改"><span class="glyphicon glyphicon-edit"></span></button>
									<button type="button" class="btn btn-danger btn-xs" onclick="ajax_delete('/dailyinfo/delete', 'shift=${obj.shift}&shiftDate=${obj.shiftDate}');" title="删除"><span class="glyphicon glyphicon-remove"></span></button>
								</td>
							</tr>
						 </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<nav class="pagination">
			<c:if test="${currentPage > 1}">
				<button type="button" class="btn btn-default newer-posts" onclick="location_search('/dailyinfo/list', 'searchForm', '-1')"><span class="glyphicon glyphicon-arrow-left"></span> 上一页</button>
			</c:if>
			<span class="page-number">第 ${currentPage} 页/共 ${pageTotal} 页</span>
			<c:if test="${currentPage < pageTotal}">
				<button type="button" class="btn btn-default older-posts" onclick="location_search('/dailyinfo/list', 'searchForm', '1')">下一页  <span class="glyphicon glyphicon-arrow-right"></span></button>
			</c:if>
		</nav>
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