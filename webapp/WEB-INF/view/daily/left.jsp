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
		<a href="javascript:void(0)" onclick="openMainPage('/daily/overview')" class="list-group-item active">概览</a>
		<a href="javascript:void(0)" onclick="openMainPage('/dailyreport/list')" class="list-group-item">DailyReport</a>
		<a href="javascript:void(0)" onclick="openMainPage('/dailyinfo/list')" class="list-group-item">值班信息</a>
		<a href="javascript:void(0)" onclick="openMainPage('/demo/index')" class="list-group-item">信息发布</a>
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