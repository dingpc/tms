<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>合肥京东方 CIM科 业务交接系统</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

html,body {
	height: 100%;
	overflow: hidden;
}

*html,*html body {
	overflow: hidden; /*隐藏IE的默认滚动条的宽度*/
}

#bodyDiv {
	width: 100%;
	height: 100%;
}

#topDiv {
	height: 50px;
	background: #ccc;
	border: 0px solid #000;
	overflow: hidden; /*溢出的时候显示滚动条为 auto */
}

#mainDiv {
	width: 100%;
	background: #f4f4f4;
	border: 0px solid #7FCFF2;
	position: absolute;
    top: 50px;
    bottom: 0px;
    left: 0px;
    overflow: hidden;
}

h3 {
	font-size: 14px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="bodyDiv">
		<div id="topDiv">
			<iframe id="topFrame" name="topFrame" width="100%" height="100%" frameborder="0" scrolling="no" src="/login/top"></iframe>
		</div>
		<div id="mainDiv">
			<iframe id="mainFrame" name="mainFrame" width="100%" height="100%" frameborder="0" scrolling="auto" src="/login/index"></iframe>
		</div>
	</div>
	<script type="text/javascript">
	function logout() {
		window.location.href = "/login/logout";
	}
	</script>
</body>
</html>