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
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">任务管理</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<form id="searchForm" name="searchForm" class="navbar-form navbar-left" role="search" action="/task/list">
					<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}"/>
            		<div class="form-group">
              			<input type="text" id="searchTitle" name="searchTitle" class="form-control" value="${searchTitle}">
            		</div>
            		<button type="button" class="btn btn-default" onclick="location_search('/task/list', 'searchForm', '0')"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
			<div class="col-md-6 navbar-form div-operation-button">
				<button type="button" class="btn btn-primary" onclick="openNewWin({url:'/task/add',width:800,height:600,winName:'add'});"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				<button type="button" class="btn btn-success" onclick="openSelect('batch', 'value', '/task/edit?id=');"><span class="glyphicon glyphicon-edit"></span> 修改</button>
				<button type="button" class="btn btn-danger" onclick="ajax_deleteSelect('batch', 'value', '/task/delete');"><span class="glyphicon glyphicon-trash"></span> 删除</button>
				<button type="button" class="btn btn-warning" onclick="location_href_select('batch', 'value', '/task/subList?parentId=');"><span class="glyphicon glyphicon-leaf"></span> 子任务</button>
				<button type="button" class="btn btn-warning" onclick="location_href_select('batch', 'value', '/tasktest/list?taskId=');"><span class="glyphicon glyphicon-sunglasses"></span> 测试</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="listTableHead">
								<th width="2%"><input type="checkbox" name="selectAll" onclick="setCheckBoxState('batch', this.checked);"/></th>
							    <th width="4%">序号</th>
							    <th width="5%">所属模块</th>
							    <th width="20%">名称</th>
								<th width="5%">等级</th>
								<th width="5%">负责人</th>
								<th nowrap="nowrap">成员</th>
								<!-- <th width="6%">邀请部门</th>
								<th width="5%">邀请人</th> -->
								<th width="6%">开始时间</th>
								<th width="6%">结束时间</th>
								<th width="6%">进度</th>
								<th width="6%">逾期天数</th>
								<!-- <th width="6%">逾期原因</th> -->
								<th width="5%">是否完成</th>
								<!-- <th width="8%" >完成时间</th> -->
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="obj"  varStatus="status">
							<c:set var="module" value="${obj.module}"></c:set>
							<c:set var="grade" value="${obj.grade}"></c:set>
							<c:set var="isComplete" value="${obj.isComplete}"></c:set>
							<tr>
								<td align="center"><input type="checkbox" name="batch" value="${obj.id}"/></td>
								<td align="center">${status.index + 1}</td>
								<td>${moduleMap[module]}</td>
								<td><a href="javascript:void(0)" onclick="openNewWin({url:'/task/view?id=${obj.id}',width:1000,height:600,winName:'view'});">${obj.title}</a></td>
								<td align="center">${gradeMap[grade]}</td>
								<td>${obj.leaderName}</td>
								<td>${obj.memberName}</td>
								<%-- <td>${obj.applyDept}</td>
								<td>${obj.applyUserName}</td> --%>
								<td align="center"><fmt:formatDate value="${obj.startTime}" type="both" pattern="yyyy-MM-dd"/></td>
								<td align="center"><fmt:formatDate value="${obj.endTime}" type="both" pattern="yyyy-MM-dd"/></td>
								<td align="center">${obj.progress}%</td>
								<td align="center">${obj.overdueDay}</td>
								<%-- <td>${obj.overdueReason}</td> --%>
								<td>${isCompleteMap[isComplete]}</td>
								<%-- <td align="center"><fmt:formatDate value="${obj.completeTime}" type="both" pattern="yyyy-MM-dd"/></td> --%>
							</tr>
						 </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<nav class="pagination">
			<c:if test="${currentPage > 1}">
				<button type="button" class="btn btn-default newer-posts" onclick="location_search('/task/list', 'searchForm', '-1')"><span class="glyphicon glyphicon-arrow-left"></span> 上一页</button>
			</c:if>
			<span class="page-number">第 ${currentPage} 页/共 ${pageTotal} 页</span>
			<c:if test="${currentPage < pageTotal}">
				<button type="button" class="btn btn-default older-posts" onclick="location_search('/task/list', 'searchForm', '1')">下一页  <span class="glyphicon glyphicon-arrow-right"></span></button>
			</c:if>
		</nav>
	</div>
</body>
</html>