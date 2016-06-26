<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<link href="/static/style/dpc.error.css" rel="stylesheet">
<title>业务交接系统</title>
</head>
<body class="errorpage">
	<div class="errorpage-container">
		<h1>401</h1>
		<h2>亲，您并未获得访问此页面的授权，请联系管理员</h2>
		<button class="btn btn-lg btn-primary" type="button" onclick="back_home();"><span class="glyphicon glyphicon-home"></span> 返回首页</button>
	</div>
</body>
</html>