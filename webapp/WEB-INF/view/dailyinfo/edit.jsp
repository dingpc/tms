<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/datetime_base.jsp"%>
<title>修改值班信息</title>
</head>
<body>
	<div class="container">
		<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">修改值班信息</h3>
		<form class="form-horizontal" id="dataForm" name="dataForm" action="/dailyinfo/update" method="post">
			<fmt:formatDate var="shiftDate" value="${dailyInfo.shiftDate}" type="both" pattern="yyyy-MM-dd"/>
			<div class="form-group">
				<label for="班次日期" class="col-sm-2 control-label">班次日期</label>
				<div class="col-sm-5">
					<input size="16" type="text" class="form-control" value="${shiftDate }" id="shiftDate" name="shiftDate" readonly>
				</div>
			</div>
			<div class="form-group">
				<label for="班次" class="col-sm-2 control-label">班次</label>
				<div class="col-sm-5">
					<select class="form-control" id="shift" name="shift">
						<c:forEach items="${shiftList}" var="obj"  varStatus="status">
							<option value="${obj.dictKey}" <c:if test="${obj.dictKey eq dailyInfo.shift}">selected</c:if> ><c:out value="${obj.dictValue}"/></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="值班人员" class="col-sm-2 control-label">值班人员</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="shiftUser" name="shiftUser" value="${dailyInfo.shiftUser}" data-verify="vtype:['notempty',{'maxLength':40}]">
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
	});
	</script>
</body>
</html>