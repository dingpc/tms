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
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">测试管理</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<form id="searchForm" name="searchForm" class="navbar-form navbar-left" role="search" action="/tasktest/list">
					<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}"/>
            		<div class="form-group">
              			<input type="text" id="searchTitle" name="searchTitle" class="form-control" value="${searchTitle}">
            		</div>
            		<button type="button" class="btn btn-default" onclick="location_search('/tasktest/list', 'searchForm', '0')"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
			<div class="col-md-4 navbar-form div-operation-button">
				<c:if test="${parentId == '0' }">
					<button type="button" class="btn btn-info" onclick="location_href('/task/list');"><span class="glyphicon glyphicon-menu-left"></span> 返回</button>
				</c:if>
				<c:if test="${parentId != null && parentId != '' && parentId != '0'}">
					<button type="button" class="btn btn-info" onclick="location_href('/task/subList?parentId=${parentId}');"><span class="glyphicon glyphicon-menu-left"></span> 返回</button>
				</c:if>
				<c:if test="${taskId != null && taskId != '' }">
					<button type="button" class="btn btn-primary" onclick="openNewWin({url:'/tasktest/add?taskId=${taskId}',width:800,height:600,winName:'add'});"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				</c:if>
				<button type="button" class="btn btn-info" onclick="openSelect('batch', 'value', '/tasktest/view?id=');"><span class="glyphicon glyphicon-info-sign"></span> 查看</button>
				<button type="button" class="btn btn-success" onclick="openSelect('batch', 'value', '/tasktest/edit?id=');"><span class="glyphicon glyphicon-edit"></span> 修改</button>
				<button type="button" class="btn btn-danger" onclick="ajax_deleteSelect('batch', 'value', '/tasktest/delete');"><span class="glyphicon glyphicon-trash"></span> 删除</button>
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
							    <th width="15%">名称</th>
							    <th nowrap="nowrap">描述</th>
								<th width="6%">等级</th>
								<th width="6%">创建人</th>
								<th width="6%">测试时间</th>
								<th width="6%">修复状态</th>
								<th width="6%">状态</th>
								<th width="6%">解决时间</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="obj"  varStatus="status">
							<c:set var="grade" value="${obj.grade}"></c:set>
							<c:set var="isFix" value="${obj.isFix}"></c:set>
							<c:set var="state" value="${obj.state}"></c:set>
							<tr>
								<td align="center"><input type="checkbox" name="batch" value="${obj.id}"/></td>
								<td align="center">${status.index + 1}</td>
								<td><a href="javascript:void(0)" onclick="openNewWin({url:'/tasktest/view?id=${obj.id}',width:1000,height:600,winName:'view'});">${obj.title}</a></td>
								<td>${obj.detail}</td>
								<td align="center">${gradeMap[grade]}</td>
								<td align="center">${obj.createUserName}</td>
								<td align="center"><fmt:formatDate value="${obj.createTime}" type="both" pattern="yyyy-MM-dd"/></td>
								<td align="center">${isFixMap[isFix]}</td>
								<td align="center">${stateMap[state]}</td>
								<td align="center"><fmt:formatDate value="${obj.solveTime}" type="both" pattern="yyyy-MM-dd"/></td>
							</tr>
						 </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<nav class="pagination">
			<c:if test="${currentPage > 1}">
				<button type="button" class="btn btn-default newer-posts" onclick="location_search('/tasktest/list', 'searchForm', '-1')"><span class="glyphicon glyphicon-arrow-left"></span> 上一页</button>
			</c:if>
			<span class="page-number">第 ${currentPage} 页/共 ${pageTotal} 页</span>
			<c:if test="${currentPage < pageTotal}">
				<button type="button" class="btn btn-default older-posts" onclick="location_search('/tasktest/list', 'searchForm', '1')">下一页  <span class="glyphicon glyphicon-arrow-right"></span></button>
			</c:if>
		</nav>
	</div>
</body>
</html>