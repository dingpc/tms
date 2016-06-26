<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>业务交接系统</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
			        <img width="20" height="20" alt="Brand" src="/static/images/logo1.png">
			      </a>
				<a class="navbar-brand" href="#">合肥京东方CIM科业务交接系统</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right" id="topMenu">
					<li><a href="javascript:void(0)" onclick="addMainFrameScroll();openMainPage('/login/index');"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
					<li><a href="javascript:void(0)" onclick="removeMainFrameScroll();openMainPage('/daily/index');"><span class="glyphicon glyphicon-road"></span> 日常工作</a></li>
					<li><a href="javascript:void(0)" onclick="removeMainFrameScroll();openMainPage('/task/index');"><span class="glyphicon glyphicon-tasks"></span> 任务管理</a></li>
					<li><a href="javascript:void(0)" onclick="openMainPage('/demo/index')"><span class="glyphicon glyphicon-book"></span> 知识管理</a></li>
					<li><a href="javascript:void(0)" onclick="removeMainFrameScroll();openMainPage('/sys/index');"><span class="glyphicon glyphicon-cog"></span> 系统设置</a></li>
					<li><a href="javascript:void(0)" onclick="window.parent.logout();"><span class="glyphicon glyphicon-off"></span> 退出系统</a></li>
					<li><a href="javascript:void(0)" onclick="removeMainFrameScroll();openMainPage('/sysuser/personal');"><span class="glyphicon glyphicon-user"></span> ${sysUserSession.realName }(${sysUserSession.userName })</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<script type="text/javascript">
	function openMainPage(url) {
		$("#mainFrame",parent.document.body).attr("src", url);
	}
	function addMainFrameScroll() {
		$("#mainFrame",parent.document.body).attr("scrolling", "yes");
	}
	function removeMainFrameScroll() {
		$("#mainFrame",parent.document.body).attr("scrolling", "no");
	}
	</script>
</body>
</html>