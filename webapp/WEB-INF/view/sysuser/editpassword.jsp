<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>修改密码</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">修改密码</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/sysuser/updatepassword" method="post">
			<div class="form-group">
				<label for="原密码" class="col-sm-2 control-label">原密码</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="password" name="password" data-verify="vtype:['notempty']">
				</div>
			</div>
			<div class="form-group">
				<label for="新密码" class="col-sm-2 control-label">新密码</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="newPassword" name="newPassword" data-verify="vtype:['notempty',{'maxLength':10, 'minLength':4},'d_english']">
				</div>
			</div>
			<div class="form-group">
				<label for="新密码确认" class="col-sm-2 control-label">新密码确认</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="newPasswordConfirm" name="newPasswordConfirm" data-verify="vtype:['notempty',{'maxLength':10, 'minLength':4},'d_english']">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="button" class="btn btn-success" onclick="checkPassword();ajax_submit(0, this);"><span class="glyphicon glyphicon-ok"></span> 提交</button>
					<button type="button" class="btn btn-danger" onclick="window.close();"><span class="glyphicon glyphicon-ban-circle"></span> 取消</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function checkPassword() {
			var newPassword = $("#newPassword").val();
			var newPasswordConfirm = $("#newPasswordConfirm").val();
			if(newPassword != newPasswordConfirm) {
				alert("两次输入的新密码不一致，请重新输入");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>