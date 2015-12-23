<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html">
<html>
<head>
   	<title>用户列表</title>
   	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  	<%@include file="/WEB-INF/pages/include/public.jsp" %>
  	<!-- 页面 css -->
  	<link rel="stylesheet" href="${basePath}/js/page/e-page.css" >
  	<!-- 页面 js -->
  	<script  type="text/javascript" src="${basePath}/static/My97DatePicker/WdatePicker.js"></script>
	<script  type="text/javascript" src="${basePath}/static/layer-2.x/layer.js"></script>
	<script  type="text/javascript" src="${basePath}/js/page/e-page.js"></script>
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
										<th>编号</th>
										<th>账号</th>
										<th>姓名</th>
										<th>手机号</th>
										<th>地址</th>
										<th>
											<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
											创建时间
										</th>
										<th class="hidden-480">状态</th>
									</tr>
								</thead>
								<tbody id="con_table_tbody">
									<c:forEach var="user" varStatus="userIndex" items="${userLst}">
										<tr>
											<td class="center">
												<input type="checkbox" value="1">
											</td>
											<td>
												<a href="#">${user.id}</a>
											</td>
											<td>${user.account}</td>
											<td>${user.username}</td>
											<td>${user.mobile}</td>
											<td class="hidden-480">${user.address}</td>
											<td>${user.createTime}</td>
											<td class="hidden-480">${user.isDelete}</td>
									    </tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 分页  -->
						<div class="epage"></div>
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
				var chedAlled = $(this).attr("checked");
				if(chedAlled == "checked"){
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
		<script type="text/javascript">
		$(function(){
			$(".epage").tzPage("50", {
				num_edge_entries : 1, //边缘页数
				num_display_entries :4, //主体页数
				num_edge_entries:5,
				current_page:0,
				showGo:true,
				showSelect:true,
				items_per_page : 10, //每页显示X项
				prev_text : "前一页",
				next_text : "后一页",
				callback : function(pageNo,psize){//回调函数
					alert(pageNo+psize);
				}
			});
		});
	
	</script>
</body>
</html>
