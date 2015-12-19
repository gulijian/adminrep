<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html">
<html>
<head>
   	<title>table</title>
   	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  	<%@include file="/WEB-INF/pages/include/public.jsp" %>
</head>

<body class="no-skin">
	<!-- 头部开始-->
	<div id="navbar" class="navbar navbar-default">
		<%@include file="/WEB-INF/pages/include/head.jsp" %>  
	</div>
	<!-- 头部结束-->
	
	<!-- 主容器开始 -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>

		<!-- 左侧菜单开始-->
		<div id="sidebar" class="sidebar responsive">
			<%@include file="/WEB-INF/pages/include/sidebar.jsp" %>
		</div>
		<!-- 左侧菜单结束-->
		
		<!-- 内容容器开始 -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- 标题导航开始 -->
				<%@include file="/WEB-INF/pages/include/breadCrumb.jsp" %>
				<!-- 标题导航结束 -->
				
				<!-- 页面内容开始 -->
				<div class="page-content">
					<!-- 肤色设置开始 -->
					<div class="ace-settings-container" id="ace-settings-container">
						<%@include file="/WEB-INF/pages/include/setting.jsp" %>
					</div>
				    <!-- 肤色设置结束 -->
				    <!-- 内容主体开始 -->
					<div class="row">
						<div class="col-xs-12">
						
						   页面模板
						
						</div>
					</div>
					<!-- 内容主体结束 -->
				</div>
				<!-- 页面内容结束 -->
		    </div>
	    </div>
	    <!-- 内容容器结束 -->
		
		<!-- 尾部开始 -->
		<div class="footer">
			
		</div>
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- 主容器结束 -->
</body>
</html>
