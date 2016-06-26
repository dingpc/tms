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
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">用户管理</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<form class="navbar-form navbar-left" role="search" action="/sysuser/list" method="post" accept-charset="utf-8">
            		<div class="form-group">
              			<input type="text" id="searchRealName" name="searchRealName" class="form-control" value="${searchRealName}">
            		</div>
            		<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
			<div class="col-md-6 navbar-form div-operation-button">
				<button type="button" class="btn btn-primary" onclick="openNewWin({url:'/sysuser/add',width:800,height:600,winName:'add'});"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				<button type="button" class="btn btn-info" onclick="openSelect('batch', 'value', '/sysuser/view?userId=');"><span class="glyphicon glyphicon-info-sign"></span> 查看</button>
				<button type="button" class="btn btn-success" onclick="openSelect('batch', 'value', '/sysuser/edit?userId=');"><span class="glyphicon glyphicon-edit"></span> 修改</button>
				<button type="button" class="btn btn-danger" onclick="ajax_deleteSelect('batch', 'value', '/sysuser/delete');"><span class="glyphicon glyphicon-trash"></span> 删除</button>
				<button type="button" class="btn btn-warning" onclick="openSelect('batch', 'value', '/sysrole/select?userId=');"><span class="glyphicon glyphicon-cog"></span> 分配角色</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr class="listTableHead">
							  	<th width="2%"><input type="checkbox" name="selectAll" onclick="setCheckBoxState('batch', this.checked);"/></th>
							  	<th width="10%">工号</th>
							  	<th width="10%">姓名</th>
							  	<th width="15%">管理职级</th>
							  	<th width="15%">办公电话</th>
							  	<th width="15%">手机号码</th>
							  	<th nowrap="nowrap">邮箱</th>
							  	
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="obj"  varStatus="status">
							<c:set var="post" value="${obj.post}"></c:set>
							<tr>
								<td align="center"><input type="checkbox" name="batch" value="${obj.userId}"/></td>
								<td><c:out value="${obj.userName}"/></td>
								<td><c:out value="${obj.realName}"/></td>
								<td>${postMap[post]}</td>
								<td><c:out value="${obj.phone}"/></td>
								<td><c:out value="${obj.mobile}"/></td>
								<td>${obj.email}</td>
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