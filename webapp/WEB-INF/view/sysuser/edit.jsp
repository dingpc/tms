<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>修改用户</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">修改用户</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/sysuser/update" method="post">
			<input type="hidden" id="userId" name="userId" value="${sysUser.userId}"/>
			<div class="form-group">
				<label for="工号" class="col-sm-2 control-label">工号</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="userName" name="userName" value="${sysUser.userName}" data-verify="vtype:['notempty',{'maxLength':10},'d_english_u']">
				</div>
			</div>
			<div class="form-group">
				<label for="姓名" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="realName" name="realName" value="${sysUser.realName}" data-verify="vtype:['notempty',{'maxLength':10}]">
				</div>
			</div>
			<div class="form-group">
				<label for="性别" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-5">
					<select class="form-control" id="sex" name="sex">
						<c:forEach items="${sexList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq sysUser.sex}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="岗位" class="col-sm-2 control-label">岗位</label>
				<div class="col-sm-5">
					<select class="form-control" id="post" name="post">
						<c:forEach items="${postList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq sysUser.post}">selected</c:if>><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="职级" class="col-sm-2 control-label">职级</label>
				<div class="col-sm-5">
					<select class="form-control" id="rank" name="rank">
						<c:forEach items="${rankList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq sysUser.rank}">selected</c:if>><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="办公电话" class="col-sm-2 control-label">办公电话</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="phone" name="phone" value="${sysUser.phone}">
				</div>
			</div>
			<div class="form-group">
				<label for="手机号码" class="col-sm-2 control-label">手机号码</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="mobile" name="mobile"  value="${sysUser.mobile}" data-verify="vtype:['mobile']">
				</div>
			</div>
			<div class="form-group">
				<label for="邮箱" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="email" name="email" value="${sysUser.email}" data-verify="vtype:['email']">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="button" class="btn btn-success" onclick="ajax_submit(0, this);"><span class="glyphicon glyphicon-ok"></span> 提交</button>
					<button type="button" class="btn btn-danger" onclick="window.close();"><span class="glyphicon glyphicon-ban-circle"></span> 取消</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>