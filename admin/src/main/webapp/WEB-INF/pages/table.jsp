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
  	<!-- 页面 js -->
  	<script  type="text/javascript" src="${basePath}/static/My97DatePicker/WdatePicker.js"></script>
	<script  type="text/javascript" src="${basePath}/static/layer-2.x/layer.js"></script>
	<style type="text/css">
		#con_table #con_table_tbody tr:hover{background:#B5B7B9;}
		#con_table input[type="checkbox"]{width: 19px;height: 19px;background: white;color: green;}
		#con_table input[type="checkbox"]:hover{border:1px solid red;}
		.tr_active{background:#B5B7B9}
	</style>
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
				    <!-- 搜索框 开始 -->
				    <div class="page-header">
			    		<div class="row">
			    			<div class="col-xs-12">
			    				<form class="form-inline">
									  <div class="form-group">
									     <label for="name">姓名</label>
									     <input type="text" class="form-control" id="name" placeholder="姓名">
									  </div>
									  <div class="form-group">
									     <label for="mobile">手机号:</label>
									     <input type="text" class="form-control" id="mobile" placeholder="手机号">
									  </div>
									  <div class="form-group">
									     <label for="sex">性别:</label>
									     <select class="form-control">
									     	  <option>--请选择--</option>
											  <option value="0">男</option>
											  <option value="1">女</option>
									  	</select>
									  </div>
									  <div class="form-group">
									     <label for="startDate">开始日期:</label>
									     <input style="height:32px;" class="Wdate form-control" id="startDate" type="text" onClick="WdatePicker()">~
									     <label for="endDate">结束日期:</label>
									     <input style="height:32px;" class="Wdate form-control" id="startDate" type="text" onClick="WdatePicker()">
									  </div>
									  <button type="button" class="btn btn-primary btn-xs">
									  	 <i class="ace-icon fa fa-search bigger-120"></i>查询
									   </button> 
									  <button type="button" class="btn btn-primary btn-xs">
									  	 <i class="ace-icon fa fa-road bigger-120"></i>重置
									  </button>
								</form>
			    			</div>
			    		</div>
			    		<div class="row">
			    			<div class="col-xs-12">
			    				<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
			    					<i class="ace-icon fa  fa-plus bigger-120"></i>新增 
			    				</button>
			    				<button type="button" class="btn btn-primary btn-xs">
			    					<i class="ace-icon fa fa-pencil bigger-120"></i>修改
			    				</button>
			    				<button type="button" class="btn btn-danger btn-xs" onclick= "adminUser.del(this);">
			    					<i class="ace-icon fa fa-trash-o bigger-120"></i>删除
			    				</button>
			    				<button type="button" class="btn btn-danger btn-xs">
			    					<i class="ace-icon fa fa-trash-o bigger-120"></i>批量删除
			    				</button>
								<button type="button" class="btn btn-info btn-xs">
									<i class="ace-icon fa fa-sign-in bigger-120"></i>导出 
								</button>
			    			</div>
			    		</div>
					</div>
				    <!-- 搜索框 end -->
				    <!-- 内容主体开始 -->
					<div class="row">
						<div class="col-xs-12">
							<table id="con_table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">
											<input type="checkbox" value="" id="chkAll">
										</th>
										<th>域名</th>
										<th>价格</th>
										<th>姓名</th>
										<th>地址</th>
										<th class="hidden-480">点击数</th>
										<th>
											<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
											更新时间
										</th>
										<th class="hidden-480">状态</th>
										<th class="hidden-480">手机号</th>
									</tr>
								</thead>
								<tbody id="con_table_tbody">
									<tr>
										<td class="center">
											<input type="checkbox" value="1">
										</td>
										<td>
											<a href="#">ace.com</a>
										</td>
										<td>$45</td>
										<td>顾立剑</td>
										<td>江苏宿迁</td>
										<td class="hidden-480">3,330</td>
										<td>Feb 12</td>
										<td class="hidden-480">
											<span class="label label-sm label-warning">Expiring</span>
										</td>
										<td class="hidden-480">3,330</td>
									</tr>
									<tr>
										<td class="center">
											<input type="checkbox" value="1">
										</td>

										<td>
											<a href="#">ace.com</a>
										</td>
										<td>$45</td>
										<td>顾立剑</td>
										<td>江苏宿迁</td>
										<td class="hidden-480">3,330</td>
										<td>Feb 12</td>
										<td class="hidden-480">
											<span class="label label-sm label-warning">Expiring</span>
										</td>
										<td class="hidden-480">3,330</td>
									</tr>
									<tr>
										<td class="center">
											<input type="checkbox" value="1">
										</td>

										<td>
											<a href="#">ace.com</a>
										</td>
										<td>$45</td>
										<td>顾立剑</td>
										<td>江苏宿迁</td>
										<td class="hidden-480">3,330</td>
										<td>Feb 12</td>
										<td class="hidden-480">
											<span class="label label-sm label-warning">Expiring</span>
										</td>
										<td class="hidden-480">3,330</td>
									</tr>
									<tr>
										<td class="center">
											<input type="checkbox" value="1">
										</td>

										<td>
											<a href="#">ace.com</a>
										</td>
										<td>$45</td>
										<td>顾立剑</td>
										<td>江苏宿迁</td>
										<td class="hidden-480">3,330</td>
										<td>Feb 12</td>
										<td class="hidden-480">
											<span class="label label-sm label-warning">Expiring</span>
										</td>
										<td class="hidden-480">3,330</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 分页 start -->
						<div class="col-xs-12">
							<nav>
							  <ul class="pagination">
							    <li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							  </ul>
							</nav>
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
	
	
	<!-- 新增模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增用户</h4>
	      </div>
	      <div class="modal-body">
        	<form>
	          <div class="form-group">
	            <label for="recipient-name" class="control-label">Recipient:</label>
	            <input type="text" class="form-control" id="recipient-name">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">Message:</label>
	            <textarea class="form-control" id="message-text"></textarea>
	          </div>
      		</form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary btn-xs">确定</button>
	        <button type="button" class="btn btn-primary btn-xs" data-dismiss="modal">取消</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		var adminUser = {
				add:function(){
					
				},
				del:function(){
					var index = layer.open({
							title:'删除提示',
						    content: '你确认删除吗？',
						    btn: ['确认', '取消'],
						    shadeClose: false,
						    yes: function(){
						    	layer.close(index);
						    }, no: function(){
						    	
						    }
					});
				}
		}
		$(function(){
			//checkbox 全选，取消
			$("#con_table #chkAll").click(function(){
				var chedAll = $(this).attr("checked");
				if(chedAll == "checked"){
					$(this).removeAttr("checked");
					$("#con_table_tbody").find("tr").find(":checkbox").removeAttr("checked");
					$("#con_table_tbody").find("tr").removeClass("tr_active");
				}else{
					$(this).attr("checked","checked");
					$("#con_table_tbody").find("tr").find(":checkbox").attr("checked","checked");
					$("#con_table_tbody").find("tr").addClass("tr_active");
				}
			});
			//行样式和checkbox样式
			$("#con_table_tbody").find("tr").bind("click",function(){
				  var chked =  $(this).find(":checkbox").attr("checked");
				  if(chked == "checked"){//选中状态
					  $(this).find(":checkbox").removeAttr("checked");
					  $(this).removeClass("tr_active");
				  }else{
					  $(this).find(":checkbox").attr("checked","checked");
				  	  $(this).addClass("tr_active");
				  }
			})
		})
	</script>
</body>
</html>
