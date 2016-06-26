<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<link href="/static/style/dpc.logon.css" rel="stylesheet">
<title>合肥京东方 CIM科 业务交接系统</title>
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
					<li><a href="javascript:void(0)" onclick=""><span class="glyphicon glyphicon-question-sign"></span> 帮助</a></li>
					<li><a href="javascript:void(0)" onclick=""><span class="glyphicon glyphicon glyphicon-wrench"></span> 关于</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<form id="loginForm" name="loginForm" class="form-signin" action="/login/validate" method="post">
			<h1 class="form-signin-heading">&nbsp;</h1>
			<h1 class="form-signin-heading">欢迎登录</h1>
			<div class="form-group">
			<label for="userNo" class="sr-only">请输入工号</label> 
			<input type="text" id="userName" name="userName" class="form-control" placeholder="请输入工号" required autofocus>
			</div>
			<div class="form-group"> 
			<label for="password" class="sr-only">请输入密码</label> 
			<input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" required>
			</div>
			<!-- <div class="checkbox">
				<label> 
					
				</label>
			</div> -->
			<div class="form-group">
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="ajax_login('loginForm');">登录</button>
			</div>
		</form>
	</div>
	<footer class="footer navbar navbar-default navbar-fixed-bottom">
	    <div class="container copyright">
	    	<div class="row">
	    		<div clss="col-sm-12">
	    			<span>Copyright © BOEHF CIM</span>·<span>联系电话：3945 3948</span>
	    		</div>
	    	</div>
	    </div>
	</footer>
	<script type="text/javascript">
	$(document).ready(function() {
		if(window.top != window.self) {
			window.top.location.href = "/login/logon";
		}
		/* if(window.parent != undefined) {
			window.parent.location.href = "/login/logon"
		} */
	});
	$(window).keydown(function (e) {
		if (e.which == 13) {
			ajax_login('loginForm');
		}
	});
	function ajax_login(formId) {
		var formValue = $.toJSON($("#" + formId).serializeObject());
		var validation = validateForm(formId);
		if (validation) {
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				url : $("#" + formId).attr("action"),
				data : formValue,
				success : function(data) {
					if (data == "2") {
						alert("用户名或密码错误，请重新登录！");
						window.location.reload();
					} else {
						commonSubmitDynamicForm({
							id : "dataForm",
							action : "/login/home",
							method : "post"
						});
					}
				},
				error : function(data) {
					alert("登录失败，请联系管理员！");
				}
			});
		}
	}
	</script>
</body>
</html>