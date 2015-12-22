<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<%@include file="/WEB-INF/pages/include/public.jsp" %>
<!-- page css -->
<link rel="stylesheet" href="${basePath}/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!-- page js -->
<script  type="text/javascript" src="${basePath}/static/zTree/js/jquery.ztree.core-3.5.js"></script>
<script  type="text/javascript" src="${basePath}/static/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<!-- treebox -->
<div class="treebox left">
	<ul id="permission" class="ztree"></ul>
</div>

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