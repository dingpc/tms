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
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">子任务管理</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<form id="searchForm" name="searchForm" class="navbar-form navbar-left" role="search" action="/task/list">
					<label class="control-label">主任务：</label>
            		<div class="form-group">
            			<p class="form-control-static">${parentTask.title }</p>
            		</div>
          		</form>
			</div>
			<div class="col-md-6 navbar-form div-operation-button">
				<button type="button" class="btn btn-info" onclick="location_href('/task/list');"><span class="glyphicon glyphicon-menu-left"></span> 返回</button>
				<button type="button" class="btn btn-primary" onclick="openNewWin({url:'/task/add?parentId=${parentTask.id}',width:800,height:600,winName:'add'});"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				<button type="button" class="btn btn-success" onclick="openSelect('batch', 'value', '/task/edit?id=');"><span class="glyphicon glyphicon-edit"></span> 修改</button>
				<button type="button" class="btn btn-danger" onclick="ajax_deleteSelect('batch', 'value', '/task/delete');"><span class="glyphicon glyphicon-trash"></span> 删除</button>
				<button type="button" class="btn btn-warning" onclick="location_href_select('batch', 'value', '/task/subList?parentId=');"><span class="glyphicon glyphicon-leaf"></span> 子任务</button>
				<button type="button" class="btn btn-warning" onclick="location_href_select('batch', 'value', '/tasktest/list?parentId=${parentTask.id}&taskId=');"><span class="glyphicon glyphicon-sunglasses"></span> 测试</button>
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
							    <th width="8%" nowrap="nowrap">名称</th>
								<th width="8%">等级</th>
								<th width="8%">负责人</th>
								<th width="6%">成员</th>
								<th width="8%">开始时间</th>
								<th width="8%">结束时间</th>
								<th width="8%">进度</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="obj"  varStatus="status">
							<c:set var="grade" value="${obj.grade}"></c:set>
							<c:set var="isComplete" value="${obj.isComplete}"></c:set>
							<tr>
								<td align="center"><input type="checkbox" name="batch" value="${obj.id}"/></td>
								<td align="center">${status.index + 1}</td>
								<td><a href="javascript:void(0)" onclick="openNewWin({url:'/task/view?id=${obj.id}',width:1000,height:600,winName:'view'});">${obj.title}</a></td>
								<td>${gradeMap[grade]}</td>
								<td>${obj.leaderName}</td>
								<td>${obj.memberName}</td>
								<td align="center"><fmt:formatDate value="${obj.startTime}" type="both" pattern="yyyy-MM-dd"/></td>
								<td align="center"><fmt:formatDate value="${obj.endTime}" type="both" pattern="yyyy-MM-dd"/></td>
								<td>${obj.progress}%</td>
							</tr>
						 </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>