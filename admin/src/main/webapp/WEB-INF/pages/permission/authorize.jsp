<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<%@include file="/WEB-INF/pages/include/public.jsp" %>
<!-- page css -->
<link rel="stylesheet" href="${basePath}/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!-- page js -->
<script  type="text/javascript" src="${basePath}/static/zTree/js/jquery.ztree.core-3.5.js"></script>
<script  type="text/javascript" src="${basePath}/static/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<style type="text/css">
	#btnBox{position:fixed;bottom:10px;right:15px;}
</style>
<!-- treebox -->
<div class="treebox left">
	<ul id="permission" class="ztree"></ul>
</div>
<div id="btnBox">
	<button type="button" class="btn btn-info btn-xs" onclick="btnSure(this);">确定</button>
	&nbsp;&nbsp;&nbsp;
	<button type="button" class="btn btn-info btn-xs" onclick="btnCancel(this);">取消</button>
</div>

<script>
	var setting = {
			check: {
				enable: true,
				autoCheckTrigger: true,
				chkStyle: "checkbox",
				chkboxType:{ "Y" : "ps", "N" : "ps" }
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
		$(document).ready(function(){
			guAjax.request({
				path:adminPath,
				model:"permission",
				method:"menu",
				success:function(data){
					$.fn.zTree.init($("#permission"), setting, data);
				}
			});
		});
	
		function zTreeBeforeCheck(treeId, treeNode) {
			//alert(treeId+"==="+treeNode.id+treeNode.pId+treeNode.name);
		    return true;
		};

		function zTreeOnCheck(event, treeId, treeNode) {
			  var treeObj=$.fn.zTree.getZTreeObj("permission"),
	            nodes=treeObj.getCheckedNodes(true),
	            v="";
	            for(var i=0;i<nodes.length;i++){
		            v+=nodes[i].name + ",";
		            //alert(nodes[i].id+"=="+nodes[i].name+nodes[i].pId); //获取选中节点的值
	            }
		  //  alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
		};
		
		
	</script>
	<script type="text/javascript">
		var index = parent.layer.getFrameIndex(window.name); //得到当前iframe层的索引
		//角色分配权限
		function btnSure(){
			var treeObj = $.fn.zTree.getZTreeObj("permission");
			var nodes = treeObj.getCheckedNodes(true);
			var roleId = "${roleId}";
			var menuIdStr = "";
			for(var i=0;i<nodes.length;i++){
				menuIdStr+=nodes[i].id + ","; //各个节点的id值
	         }
			roleAuthorize(roleId,menuIdStr);
		}
		//角色授权保存操作
		function roleAuthorize(roleId,menuIdStr){
			$.ajax({
				type:"post",
				url:adminPath+"/permission/roleAuthorize",
				data:{"roleId":roleId,"menuIds":menuIdStr},
			    success:function(data){
			    	parent.layer.close(index); //再执行关闭     
			    }
			});
		}
		
		//取消，关闭当前的iframe层
		function btnCancel(){
			parent.layer.close(index); //关闭当前的iframe层
		}
	</script>
	
	
