<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<title>WMP</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="dpc-header dpc-smaller dpc-lighter dpc-blue">系统详情</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10">
				<form class="navbar-form navbar-left" role="search" action="">
            		<div class="form-group">
              			<input type="text" id="userName" name="userName" class="form-control" value="${userName}">
            		</div>
            		<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> 查询</button>
          		</form>
			</div>
			<div class="col-md-2 navbar-form">
				<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 新增</button>
				<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 批量删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr class="listTableHead">
							  	<th><input type="checkbox" name="selectAll" onclick="setCheckBoxState('batch', this.checked);"/></th>
							  	<th>列名1</th>
							  	<th>列名2</th>
							  	<th>列名3</th>
							  	<th>列名4</th>
							  	<th>列名5</th>
							  	<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<%for(int i = 0; i < 50; i++) {%>
							<tr>
								<td align="center"><input type="checkbox" name="batch" value="<%=i%>"/></td>
								<td>测试数据1</td>
								<td>测试数据2</td>
								<td>测试数据3</td>
								<td>测试数据4</td>
								<td>测试数据5</td>
								<td align="center">
									<button type="button" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-edit"></span></button>
									<button type="button" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span></button>
								</td>
							</tr>
						<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>