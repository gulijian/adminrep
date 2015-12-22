<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html">
<html>
<head>
   	<title>ztree</title>
   	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  	<%@include file="/WEB-INF/pages/include/public.jsp" %>
  	<!-- page css -->
  	<link rel="stylesheet" href="${basePath}/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
  	<!-- page js -->
  	<script  type="text/javascript" src="${basePath}/static/zTree/js/jquery.ztree.core-3.5.js"></script>
  	<script  type="text/javascript" src="${basePath}/static/zTree/js/jquery.ztree.excheck-3.5.js"></script>
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
							<div class="zTreeDemoBackground left">
								<ul id="permission" class="ztree"></ul>
							</div>
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
	
	<script>
	var setting = {
			check: {
				enable: true,
				autoCheckTrigger: true,
				chkStyle: "checkbox"
			},
			callback: {
				onCheck: zTreeOnCheck
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		function zTreeBeforeCheck(treeId, treeNode) {
			alert(treeId+"==="+treeNode.id+treeNode.pId+treeNode.name);
		    return true;
		};

		function zTreeOnCheck(event, treeId, treeNode) {
			  var treeObj=$.fn.zTree.getZTreeObj("permission"),
	            nodes=treeObj.getCheckedNodes(true),
	            v="";
	            for(var i=0;i<nodes.length;i++){
		            v+=nodes[i].name + ",";
		            alert(nodes[i].id+"=="+nodes[i].name+nodes[i].pId); //获取选中节点的值
	            }
		  //  alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
		};


		var code;
		function setCheck() {
			var zTree = $.fn.zTree.getZTreeObj("permission"),
			py = $("#py").attr("checked")? "p":"",
			sy = $("#sy").attr("checked")? "s":"",
			pn = $("#pn").attr("checked")? "p":"",
			sn = $("#sn").attr("checked")? "s":"",
			type = { "Y":py + sy, "N":pn + sn};
			zTree.setting.check.chkboxType = type;
			showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
		}
		function showCode(str) {
			//alert(str);
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>"+str+"</li>");
		}
		
		$(document).ready(function(){
			guAjax.request({
				path:adminPath,
				model:"permission",
				method:"menu",
				success:function(data){
					$.fn.zTree.init($("#permission"), setting, data);
					setCheck();
					$("#py").bind("change", setCheck);
					$("#sy").bind("change", setCheck);
					$("#pn").bind("change", setCheck);
					$("#sn").bind("change", setCheck);
				}
			});
		});
	</script>
	<script type="text/javascript">
		
	
	</script>
</body>
</html>
