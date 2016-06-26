<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>选择用户</title>
<style type="text/css">
.checkbox-inline {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">选择用户</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/sysuser/save" method="post">
			<div class="form-group">
				<div class="col-sm-5">
					<c:forEach items="${list}" var="obj"  varStatus="status">
						<label class="checkbox-inline">
							<input type="checkbox" name="batch" value="${obj.userId}" title="${obj.realName}"><c:out value="${obj.realName}"/>
						</label>
					</c:forEach>
				</div>
			</div>
			<footer class="footer navbar navbar-fixed-bottom">
			    <div class="container copyright">
			    	<div class="row">
			    		<div class="col-sm-5">
							<button type="button" class="btn btn-success" onclick="select_submit();"><span class="glyphicon glyphicon-ok"></span> 提交</button>
							<button type="button" class="btn btn-danger" onclick="window.close();"><span class="glyphicon glyphicon-ban-circle"></span> 取消</button>
						</div>
			    	</div>
			    </div>
			</footer>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			var selectIds = $("#${param.id}", window.opener.document).val();
			$("input[name=batch]").each(function(){
				var id = $(this).val();
				if(selectIds.indexOf(id) >= 0) {
					$(this).attr("checked", true)
				}
			});
		});
		
		function select_submit() {
			var idStr = getCheckBoxData("batch", "value");
			var nameStr = getCheckBoxData("batch", "title");
			$("#${param.id}", window.opener.document).val(idStr);
			$("#${param.name}", window.opener.document).val(nameStr);
			window.close();
		}
	</script>
</body>
</html>