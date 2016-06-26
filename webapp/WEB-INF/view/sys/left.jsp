<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>WMP</title>
<style type="text/css">
.list-group {
    padding-top: 5px;
}
</style>
</head>
<body>
	<div class="list-group">
		<a href="javascript:void(0)" onclick="openMainPage('/demo/index')" class="list-group-item active">系统详情</a>
		<a href="javascript:void(0)" onclick="openMainPage('/sysuser/list')" class="list-group-item">用户管理</a>
		<a href="javascript:void(0)" onclick="openMainPage('/demo/index')" class="list-group-item">角色管理</a>
		<a href="javascript:void(0)" onclick="openMainPage('/demo/index')" class="list-group-item">权限管理</a>
		<a href="javascript:void(0)" onclick="openMainPage('/demo/index')" class="list-group-item">定制首页</a>
		<a href="javascript:void(0)" onclick="openMainPage('/sysuser/editpassword')" class="list-group-item">修改密码</a>
	</div>
	<script type="text/javascript">
	function openMainPage(url) {
		$("#rightFrame",parent.document.body).attr("src", url);
	}
	
	$(function() {
		$(".list-group-item").click(function() {
			$(this).removeClass("list-group-item");
			$(this).addClass("list-group-item active");
			$(this).siblings().removeClass("list-group-item active");
			$(this).siblings().addClass("list-group-item");
		});
	});
	</script>
</body>
</html>