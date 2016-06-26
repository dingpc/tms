<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<link href="/static/style/dpc.error.css" rel="stylesheet">
<title>WMP</title>
</head>
<body class="errorpage">
	<div class="errorpage-container">
		<h2>开发中......</h2>
		<h3>去看看其他界面吧，要不就歇会？</h3>
		<button class="btn btn-lg btn-primary" type="button" onclick="backHome();"><span class="glyphicon glyphicon-home"></span> 返回首页</button>
	</div>
	<script type="text/javascript">
	function backHome() {
		window.parent.location.href = "/login/home";
	}
	</script>
</body>
</html>