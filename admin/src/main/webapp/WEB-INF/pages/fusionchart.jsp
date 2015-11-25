<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html">
<html>
  	<head>
    	<title>首页</title>
    	<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
   	 	<%@include file="/WEB-INF/pages/include/public.jsp" %>
   	 	<script type="text/javascript" src="${ctxStatic}/fusionCharts/FusionCharts.js"></script>
   	 	
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
 		 	<%@include file="/WEB-INF/pages/include/head.jsp" %>  
		</div>
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive">
				<%@include file="/WEB-INF/pages/include/sidebar.jsp" %>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<div class="ace-settings-container" id="ace-settings-container">
							<%@include file="/WEB-INF/pages/include/setting.jsp" %>
						</div><!-- /.ace-settings-container -->

						<!-- /section:settings.box -->
						<div class="page-header">
							<h1>
								Dashboard
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- page content starts -->
									<div id="chart_div" style="border:1px solid red; width:650px;height:400px;margin:10px auto;"></div>
								<!-- page content ends -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		
		
		<script type="text/javascript">
			var dataXml = "<?xml version='1.0' encoding='UTF-8' ?><graph caption='每月销售额柱形图' xAxisName='月份' yAxisName='Units' showNames='1' decimalPrecision='0' formatNumberScale='0'><set name='一月' value='462' color='AFD8F8' /><set name='二月' value='857' color='F6BD0F' /><set name='三月' value='671' color='8BBA00' /><set name='四月' value='494' color='FF8E46' /><set name='五月' value='761' color='008E8E' /><set name='六月' value='960' color='D64646' /><set name='七月' value='629' color='8E468E' /><set name='八月' value='622' color='588526' /><set name='九月' value='376' color='B3AA00' /><set name='十月' value='494' color='008ED6' /><set name='十一月' value='761' color='9D080D' /><set name='十二月' value='960' color='A186BE' /></graph>";
			var myChart2 = new FusionCharts(basePath+"/static/fusionCharts/Pie3D.swf","chatPieId", "600","250");
			myChart2.setDataXML(dataXml);
			myChart2.render("chart_div");
		</script>
	</body>
</html>
