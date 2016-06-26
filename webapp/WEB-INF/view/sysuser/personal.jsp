<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>个人信息</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">个人信息</h3>
			</div>
		</div>
		<div class="row">
			<c:set var="sex" value="${sysUserSession.sex}"></c:set>
			<c:set var="post" value="${sysUserSession.post}"></c:set>
			<c:set var="rank" value="${sysUserSession.rank}"></c:set>
			<div class="col-md-4">
			<form class="form-horizontal" >
				<div class="form-group">
					<label class="col-md-3 control-label">工号</label>
    				<div class="col-md-6">
						<p class="form-control-static">${sysUserSession.userName}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">性别</label>
    				<div class="col-md-6">
						<p class="form-control-static">${sexMap[sex]}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">岗位</label>
    				<div class="col-md-6">
						<p class="form-control-static">${postMap[post]}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">手机号码</label>
    				<div class="col-md-6">
						<p class="form-control-static">${sysUserSession.mobile}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-3 col-md-6">
					<button type="button" class="btn btn-warning" onclick="openNewWin({url:'/sysuser/editpassword',width:800,height:600,winName:'editpassword'});"><span class="glyphicon glyphicon-lock"></span> 修改密码</button>
				</div>
				</div>
			</form>
			</div>
			<div class="col-md-4">
			<form class="form-horizontal" >
				<div class="form-group">
					<label class="col-md-3 control-label">姓名</label>
	   				<div class="col-md-6">
						<p class="form-control-static">${sysUserSession.realName}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">办公电话</label>
	   				<div class="col-md-6">
						<p class="form-control-static">${sysUserSession.phone}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">职级</label>
	   				<div class="col-md-6">
						<p class="form-control-static">${rankMap[rank]}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">邮箱</label>
	   				<div class="col-md-6">
						<p class="form-control-static">${sysUserSession.email}</p>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>