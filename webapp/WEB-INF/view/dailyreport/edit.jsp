<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/datetime_base.jsp"%>
<%@ include file="/static/common/upload_base.jsp"%>
<title>修改Report</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">修改Report</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/dailyreport/update" method="post">
			<input type="hidden" id="reportId" name="reportId" value="${report.reportId}"/>
			<fmt:formatDate var="shiftDate" value="${report.shiftDate}" type="both" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="receiveTime" value="${report.receiveTime}" type="both" pattern="yyyy-MM-dd HH:mm"/>
			<fmt:formatDate var="answerTime" value="${report.answerTime}" type="both" pattern="yyyy-MM-dd HH:mm"/>
			<div class="form-group">
				<label for="问题标题" class="col-sm-2 control-label">问题标题</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="questionTitle" name="questionTitle" value="${report.questionTitle}" data-verify="vtype:['notempty',{'maxLength':40}]">
				</div>
			</div>
			<div class="form-group">
				<label for="班次日期" class="col-sm-2 control-label">班次日期</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${shiftDate}" id="shiftDate" name="shiftDate" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="班次" class="col-sm-2 control-label">班次</label>
				<div class="col-sm-5">
					<select class="form-control" id="shift" name="shift">
						<c:forEach items="${shiftList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq report.shift}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="分厂" class="col-sm-2 control-label">分厂</label>
				<div class="col-sm-5">
					<select class="form-control" id="shop" name="shop">
						<c:forEach items="${shopList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq report.shop}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="问题类型" class="col-sm-2 control-label">问题类型</label>
				<div class="col-sm-5">
					<select class="form-control" id="questionType" name="questionType">
						<c:forEach items="${questionTypeList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq report.questionType}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="申请人" class="col-sm-2 control-label">申请人</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="questionUser" name="questionUser" value="${report.questionUser}" data-verify="vtype:['notempty',{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="联系方式" class="col-sm-2 control-label">联系方式</label>
				<div class="col-sm-5">
					<select class="form-control" id="questionContact" name="questionContact">
						<c:forEach items="${contactList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq report.questionContact}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="申请人电话" class="col-sm-2 control-label">申请电话</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="questionPhone" name="questionPhone" value="${report.questionPhone}" data-verify="vtype:[{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="问题详情" class="col-sm-2 control-label">问题详情</label>
				<div class="col-sm-5">
					<textarea class="form-control" rows="3" id="questionDetail" name="questionDetail" data-verify="vtype:[{'maxLength':500}]">${report.questionDetail}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="问题状态" class="col-sm-2 control-label">问题状态</label>
				<div class="col-sm-5">
					<select class="form-control" id="questionState" name="questionState">
						<c:forEach items="${questionStateList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq report.questionState}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="问题原因" class="col-sm-2 control-label">问题原因</label>
				<div class="col-sm-5">
					<textarea class="form-control" rows="3" id="questionReason" name="questionReason" data-verify="vtype:[{'maxLength':500}]">${report.questionReason}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="接收时间" class="col-sm-2 control-label">接收时间</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${receiveTime}"  id="receiveTime" name="receiveTime" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="接收人员" class="col-sm-2 control-label">接收人员</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="receiveUser" name="receiveUser" value="${report.receiveUser}" data-verify="vtype:[{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="解决时间" class="col-sm-2 control-label">解决时间</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${answerTime}"  id="answerTime" name="answerTime" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="处理方式" class="col-sm-2 control-label">处理方式</label>
				<div class="col-sm-5">
					<select class="form-control" id="answerType" name="answerType">
						<c:forEach items="${answerTypeList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq report.answerType}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="处理人员" class="col-sm-2 control-label">处理人员</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="answerUser" name="answerUser" value="${report.answerUser}" data-verify="vtype:[{'maxLength':20}]">
				</div>
			</div>
			<div class="form-group">
				<label for="解决详情" class="col-sm-2 control-label">解决详情</label>
				<div class="col-sm-5">
					<textarea class="form-control" rows="3" id="answerDetail" name="answerDetail" data-verify="vtype:[{'maxLength':500}]">${report.answerDetail}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="InputText" class="col-sm-2 control-label">附件1</label>
				<div class="col-sm-5">
					<div class="controls">
						<div id="queue">
							<c:forEach items="${fileList}" var="obj"  varStatus="status">
								<div id="uploadifive-file-dpc-${status.index }" class="uploadifive-queue-item complete">
									<a class="close" href="javascript:void(0)" onclick="cancleUploadFile('${status.index}', '${obj.realName}', '${obj.saveName}')">X</a>
									<div>
										<span class="filename">${obj.realName}</span>
										<span class="fileinfo"> - Completed</span>
									</div>
									<div class="progress" style="display: none;">
										<div class="progress-bar" style="width: 100%;"></div>
									</div>
								</div>
							</c:forEach>
							<c:set var="fileListLength" value="${fn:length(fileList)}"></c:set>
						</div>
						<input id="file" name="file" type="file" multiple>
						<input type="hidden" id="realName" name="realName" value="${report.realName }"/>
						<input type="hidden" id="saveName" name="saveName" value="${report.saveName }"/>  
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="button" class="btn btn-success" onclick="ajax_submit(0, this);"><span class="glyphicon glyphicon-ok"></span> 提交</button>
					<button type="button" class="btn btn-danger" onclick="window.close();"><span class="glyphicon glyphicon-ban-circle"></span> 取消</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#shiftDate").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd",
	        autoclose: true,
	        todayBtn: true,
	        minView: 2,
	        pickerPosition: "bottom-left"
	    });
		$("#receiveTime").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd hh:ii",
	        autoclose: true,
	        todayBtn: true,
	        pickerPosition: "bottom-left"
	    });
		$("#answerTime").datetimepicker({
			language:  "zh-CN",
			format: "yyyy-mm-dd hh:ii",
	        autoclose: true,
	        todayBtn: true,
	        pickerPosition: "bottom-left"
	    });
		$('#file').uploadifive({
			'auto' : true,
			'uploadScript' : '/sysfile/upload',
			'fileObjName' : 'file',
			'buttonText' : '点击上传',
			'queueID' : 'queue',
			'multi' : false,
			'fileSizeLimit' : '10MB',
			//'uploadLimit' : 1,
			//'queueSizeLimit' : 0,
			'onUploadComplete' : function(file, data) {
				if (data == "FAILURE") {
					alert("FAILURE!");
				} else {
					var obj = JSON.parse(data);
					initUploadFile(obj);
				}
			},
			onCancel : function(file) {
				//alert("Remove:" + file.name);
				removeUploadFile(file.name);
			},
			onDrop : function(file, fileDropCount) {
	            alert(fileDropCount + ' files were dropped onto the queue.');
	        },
	        onInit : function() {
	        	var fileListLength = ${fileListLength};
	        	for(var i = 0; i < fileListLength; i++) {
	        			$("#file").after('<input type="file" id="dpc-file-' + i + '" style="font-size: 40px; opacity: 0; position: absolute; right: -3px; top: -3px; z-index: 999; display: none;">');	
	        	}
			},
			onUpload : function(file) {

			},
		});
	});
	
	</script>
</body>
</html>