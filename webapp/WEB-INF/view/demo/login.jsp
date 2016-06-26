<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<title>WMP</title>
<link href="/static/style/signin.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="form-signin">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputEmail" class="sr-only">请输入工号</label> 
			<input type="email" id="inputEmail" class="form-control" placeholder="请输入工号" required autofocus> 
			<label for="inputPassword" class="sr-only">请输入密码</label> 
			<input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" required>
			<div class="checkbox">
				<label> 
					<input type="checkbox" value="remember-me">Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		</form>
		<a href="/demo/add">form demo</a>
		<a href="/demo/list">form list</a>
		<a href="/demo/index">form index</a>
	</div>
	<%@ include file="/static/common/script_base.jsp"%>
</body>
</html>