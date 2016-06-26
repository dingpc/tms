<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/upload_base.jsp"%>
<%@ include file="/static/common/datetime_base.jsp"%>
<title>Add</title>

</head>
<body>
	<div class="page-header">
	  	<h1><small>Subtext for header</small></h1>
	</div>
	<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="InputText" class="col-sm-2 control-label">InputText</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="InputText" placeholder="Text input">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="checkbox" class="col-sm-2 control-label">Checkbox</label>
				<div class="col-sm-5">
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox1" value="option1">1
					</label> 
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox2" value="option2">2
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" id="inlineCheckbox3" value="option3">3
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="Radio" class="col-sm-2 control-label">Radio</label>
				<div class="col-sm-5">
					<label class="radio-inline"> 
						<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">1
					</label>
					<label class="radio-inline">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">2
					</label>
					<label class="radio-inline">
						<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">3
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="Select" class="col-sm-2 control-label">Select</label>
				<div class="col-sm-5">
					<select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="Selectmultiple" class="col-sm-2 control-label">Selectmultiple</label>
				<div class="col-sm-5">
					<select multiple class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="InputText" class="col-sm-2 control-label">datetime</label>
				<div class="col-sm-5 input-append date" data-date="2012-12-21T15:25:00Z">
					<input size="16" type="text" class="form-control" value="" id="datetime" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="textarea" class="col-sm-2 control-label">textarea</label>
				<div class="col-sm-5">
					<textarea class="form-control" id="textarea" rows="3" placeholder="textarea input"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="InputText" class="col-sm-2 control-label">附件</label>
				<div class="col-sm-5">
					<div class="controls">
						<div id="queue"></div>
						<input id="file" name="file" type="file" multiple>  
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="submit" class="btn btn-primary">OK</button>
					<button type="button" class="btn btn-danger">Cancel</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#datetime").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd hh:ii",
	        autoclose: true,
	        todayBtn: true,
	        pickerPosition: "bottom-left"
	    });
		$('#file').uploadifive({
			'auto' : true,
			'uploadScript' : '/file/upload',
			'fileObjName' : 'file',
			'buttonText' : '点击上传',
			'queueID' : 'queue',
			'multi' : false,
			'fileSizeLimit' : 5242880,
			'uploadLimit' : 1,
			'queueSizeLimit' : 1,
			'onUploadComplete' : function(file, data) {
				var obj = JSON.parse(data);
				if (obj.img == "500") {
					alert("系统异常！");
				} else {

				}
			},
			onCancel : function(file) {

			},
			onFallback : function() {
				alert("该浏览器无法使用!");
			},
			onUpload : function(file) {

			},
		});
	});
	</script>
</body>
</html>