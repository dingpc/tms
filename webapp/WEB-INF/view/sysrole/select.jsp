<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>选择角色</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">选择角色</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/sysrole/selectupdate" method="post">
			<input type="hidden" id="userId" name="userId" value="${userId}"/>
			<div class="list-group">
				<c:forEach items="${roleList}" var="obj"  varStatus="status">
					<c:set var="isSelected" value=""></c:set>
					<c:forEach items="${selectRoleList}" var="selectObj"  varStatus="selectStatus">
						<c:if test="${obj.roleId eq selectObj.roleId }">
							<c:set var="isSelected" value="selected"></c:set>
						</c:if>
					</c:forEach>
					<a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">
							<input type="checkbox" name="batchRole" value="${obj.roleId }" <c:if test="${isSelected eq 'selected'}">checked</c:if>> ${obj.roleName }
						</h4>
						<p class="list-group-item-text">${obj.description }</p>
					</a>
				</c:forEach>
				<a href="#" class="list-group-item">
					<h4 class="list-group-item-heading">
						<button type="button" class="btn btn-success" onclick="ajax_select_submit('batchRole', 'value', 'userId', '/sysrole/selectupdate');"><span class="glyphicon glyphicon-ok"></span> 提交</button>
						<button type="button" class="btn btn-danger" onclick="window.close();"><span class="glyphicon glyphicon-ban-circle"></span> 取消</button>
					</h4>
				</a>
   			</div>
		</form>
	</div>
</body>
</html>