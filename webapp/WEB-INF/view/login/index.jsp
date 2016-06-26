<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/page_head.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="/static/common/meta_head.jsp"%>
<%@ include file="/static/common/style_base.jsp"%>
<%@ include file="/static/common/script_base.jsp"%>
<%@ include file="/static/common/carousel_base.jsp"%>
<%@ include file="/static/common/slimscroll_base.jsp"%>
<%@ include file="/static/common/highcharts_base.jsp"%>
<title>业务交接系统</title>
</head>
<body>
	<div class="page-content">
		<div class="row">
			<div class="col-sm-6">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="first-slide" src="/static/images/home_1.png" alt="First slide">
							<div class="container">
								<div class="carousel-caption">
									<h1>天堂寨</h1>
									<p>2015自动化技术部畅游天堂寨</p>
								</div>
							</div>
						</div>
						<div class="item">
							<img class="second-slide" src="/static/images/index_2.png"
								alt="Second slide">
							<div class="container">
								<div class="carousel-caption">
									<h1>烟花三月下扬州</h1>
									<p>故人西辞黄鹤楼, 烟花三月下扬州. 孤帆远影碧空尽, 唯见长江天际流.</p>
								</div>
							</div>
						</div>
						<div class="item">
							<img class="third-slide" src="/static/images/index_3.png" alt="Third slide">
							<div class="container">
								<div class="carousel-caption">
									<h1>足球赛</h1>
									<p>2015足球赛激烈进行中</p>
								</div>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="widget-box ">
					<div class="widget-header">
						<h4 class="lighter smaller">Daily Report(<fmt:formatDate value="${yesterDate}" type="both" pattern="yyyy-MM-dd"/>)</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main no-padding">
							<div class="dialogs">
								<table class="table table-bordered table-condensed">
									<thead class="thin-border-bottom">
										<tr>
											<th width="20%">问题类型</th>
											<th width="60%">问题标题</th>
											<th width="20%">处理人</th>
										</tr>
									</thead>

									<tbody>
									<c:forEach items="${resolvingList}" var="obj"  varStatus="status">
										<c:set var="questionType" value="${obj.questionType}"></c:set>
										<tr class="danger">
											<td>${questionTypeMap[questionType]}</td>
											<td><a href="javascript:void(0)" onclick="openNewWin({url:'/dailyreport/view?reportId=${obj.reportId}',width:1000,height:600,winName:'add'});">${obj.questionTitle}</a></td>
											<td>${obj.answerUser}</td>
										</tr>
									</c:forEach>
									<c:forEach items="${resolvedList}" var="obj"  varStatus="status">
										<c:set var="questionType" value="${obj.questionType}"></c:set>
										<tr>
											<td>${questionTypeMap[questionType]}</td>
											<td><a href="javascript:void(0)" onclick="openNewWin({url:'/dailyreport/view?reportId=${obj.reportId}',width:1000,height:600,winName:'add'});">${obj.questionTitle}</a></td>
											<td>${obj.answerUser}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-6">
				<div class="widget-box ">
					<div class="widget-header">
						<h4 class="lighter smaller">Chart Example</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main no-padding">
							<div class="dialogs">
								<div id="chart1" style="width: 100%; height: 280px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="widget-box ">
					<div class="widget-header">
						<h4 class="lighter smaller">Chart Example</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main no-padding">
							<div class="dialogs">
								<div id="container" style="width: 100%; height: 280px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.dialogs').slimScroll({
				height : '300px'
			});
			
			$('#chart1').highcharts({
	            
			    chart: {
			        polar: true,
			        type: 'line'
			    },
			    
			    title: {
			        text: '2015年 Complete Develop',
			        x: -80
			    },
			    
			    pane: {
			    	size: '80%'
			    },
			    
			    xAxis: {
			        categories: ['Array 分厂', 'CF 分厂', 'Cell 分厂', 'Module 分厂', '其他'],
			        tickmarkPlacement: 'on',
			        lineWidth: 0
			    },
			        
			    yAxis: {
			        gridLineInterpolation: 'polygon',
			        lineWidth: 0,
			        min: 0
			    },
			    
			    tooltip: {
			    	shared: true,
			        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
			    },
			    
			    legend: {
			        align: 'right',
			        verticalAlign: 'top',
			        y: 70,
			        layout: 'vertical'
			    },
			    
			    series: [{
			        name: 'Develop',
			        data: [18, 20, 58, 150, 38],
			        pointPlacement: 'on'
			    }]
			
			});
			$('#container').highcharts({
				title : {
					text : '2015年自动化技术部',
					x : -20
				//center
				},
				subtitle : {
					text : 'Skill Up',
					x : -20
				},
				xAxis : {
					categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
							'May', 'Jun', 'Jul', 'Aug', 'Sep',
							'Oct', 'Nov', 'Dec' ]
				},
				yAxis : {
					title : {
						text : '数量'
					},
					plotLines : [ {
						value : 0,
						width : 1,
						color : '#808080'
					} ]
				},
				tooltip : {
					valueSuffix : '个'
				},
				legend : {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle',
					borderWidth : 0
				},
				series : [
					{
						name : '改善提案',
						data : [ 9, 0, 8, 19, 36, 7, 27,20, 16, 4, 18, 6 ]
					},
					{
						name : '读书会',
						data : [ 3, 4, 4, 4, 8, 6, 8, 6, 8, 5, 6, 9 ]
					},
					{
						name : '技术交流会',
						data : [ 5, 4, 4, 4, 6, 6, 7, 4, 4, 4, 4, 4 ]
					}
				]
			});
		});
	</script>
</body>
</html>