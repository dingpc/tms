<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
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
			<div class="col-md-8">
				<form id="searchForm" name="searchForm" class="navbar-form navbar-left" role="search" action="/dailyreport/list">
					<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}"/>
            		<div class="form-group">
              			${searchQuestionTitle}<input type="text" id="searchQuestionTitle" name="searchQuestionTitle" class="form-control" value="${searchQuestionTitle}">
            		</div>
            		<button type="button" class="btn btn-default" onclick="location_search('/dailyreport/list', 'searchForm', '0')"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
			<div class="col-md-4 navbar-form div-operation-button">
				<button type="button" class="btn btn-primary" onclick="openNewWin({url:'/dailyreport/add',width:800,height:600,winName:'add'});"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				<button type="button" class="btn btn-info" onclick="openSelect('batch', 'value', '/dailyreport/view?reportId=');"><span class="glyphicon glyphicon-info-sign"></span> 查看</button>
				<button type="button" class="btn btn-success" onclick="openSelect('batch', 'value', '/dailyreport/edit?reportId=');"><span class="glyphicon glyphicon-edit"></span> 修改</button>
				<button type="button" class="btn btn-danger" onclick="ajax_deleteSelect('batch', 'value', '/dailyreport/delete');"><span class="glyphicon glyphicon-trash"></span> 删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="listTableHead">
								<th rowspan="2" width="2%"><input type="checkbox" name="selectAll" onclick="setCheckBoxState('batch', this.checked);"/></th>
							    <th rowspan="2" width="4%">序号</th>
							    <th rowspan="2" width="8%">日期</th>
							    <th rowspan="2" width="5%">班次</th>
							    <th colspan="4">问题信息</th>
							    <th colspan="4">处理信息</th>
							</tr>
							<tr class="listTableHead">
								<th width="5%">分厂</th>
								<th nowrap="nowrap">问题标题</th>
								<th width="8%">问题类型</th>
								<th width="6%">申请人</th>
								<th width="8%">问题状态</th>
								<th width="12%">解决时间</th>
								<th width="8%">处理方式</th>
								<th width="8%">处理人</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="obj"  varStatus="status">
							<c:set var="shift" value="${obj.shift}"></c:set>
							<c:set var="shop" value="${obj.shop}"></c:set>
							<c:set var="questionType" value="${obj.questionType}"></c:set>
							<c:set var="questionState" value="${obj.questionState}"></c:set>
							<c:set var="answerType" value="${obj.answerType}"></c:set>
							<tr>
								<td align="center"><input type="checkbox" name="batch" value="${obj.reportId}"/></td>
								<td align="center">${status.index + 1}</td>
								<td align="center"><fmt:formatDate value="${obj.shiftDate}" type="both" pattern="yyyy-MM-dd"/></td>
								<td>${shiftMap[shift]}</td>
								<td>${shopMap[shop]}</td>
								<td><a href="javascript:void(0)" onclick="openNewWin({url:'/dailyreport/view?reportId=${obj.reportId}',width:1000,height:600,winName:'view'});">${obj.questionTitle}</a></td>
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
		<nav class="pagination">
			<c:if test="${currentPage > 1}">
				<button type="button" class="btn btn-default newer-posts" onclick="location_search('/dailyreport/list', 'searchForm', '-1')"><span class="glyphicon glyphicon-arrow-left"></span> 上一页</button>
			</c:if>
			<span class="page-number">第 ${currentPage} 页/共 ${pageTotal} 页</span>
			<c:if test="${currentPage < pageTotal}">
				<button type="button" class="btn btn-default older-posts" onclick="location_search('/dailyreport/list', 'searchForm', '1')">下一页  <span class="glyphicon glyphicon-arrow-right"></span></button>
			</c:if>
		</nav>
	</div>
</body>
</html>