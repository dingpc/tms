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
html,body {
	height: 100%;
}
*html,*html body {
	overflow: hidden; /*隐藏IE的默认滚动条的宽度*/
}
#bodyDiv {
	height: 100%;
}
#rowDiv {
	height: 100%;
	
}
#leftDiv {
	height: 100%;
}
#rightDiv {
	height: 100%;
	overflow: hidden;
}
.col-md-2 {
	padding-left: 0px;
	padding-right: 0px;
}
.col-md-10 {
	padding-right: 0px;
	padding-left: 0px;
}
</style>
</head>
<body>
	<div class="container-fluid"  id="bodyDiv">
      <div class="row" id="rowDiv">
        <div class="col-md-2" id="leftDiv">
			<iframe id="leftFrame" name="leftFrame" width="100%" height="100%" frameborder="0" scrolling="yes" src="/sys/left"></iframe>          
        </div>
        <div class="col-md-10" id="rightDiv">
          	<iframe id="rightFrame" name="rightFrame" width="100%" height="100%" frameborder="0" scrolling="yes" src="/demo/index"></iframe>
        </div>
      </div>
    </div>
</body>
</html>