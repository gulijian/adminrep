<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html">
<html>
<head>
   	<title>角色列表</title>
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
										<th>编号</th>
										<th>名称</th>
										<th>描述</th>
										<th>
											<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
											创建时间
										</th>
										<th>
											操作
										</th>
									</tr>
								</thead>
								<tbody id="con_table_tbody">
									<c:forEach var="role" varStatus="roleindex" items="${roleLst}">
										<tr>
											<td class="center">
												<input type="checkbox" value="${role.id}">
											</td>
											<td>
												<a href="#">${role.id}</a>
											</td>
											<td>${role.name}</td>
											<td>${role.description}</td>
											<td>${role.createTime}</td>
											<td>
												<a href="javascript:void(0)" data-opid="${role.id}" onclick="adminRole.distributeUser(this);">分配用户</a>
												<a href="javascript:void(0)" data-opid="${role.id}" onclick="adminRole.authorize(this);">授权</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
		var adminRole = {
				add:function(){
					
				},
				del:function(){
					var index = layer.open({
							title:'删除提示',
						    content: '你确认删除吗？',
						    offset: [($(window).height() - 700)/2+'px', ''], //上下垂直居中
						    btn: ['确认', '取消'],
						    shadeClose: false,
						    yes: function(){
						    	layer.close(index);
						    }, no: function(){
						    	
						    }
					});
				},
				distributeUser:function(obj){//角色分配给用户
				    var tr_roleId = $(obj).data("opid");
					layer.open({
						 type: 2,
					     title: '用户列表',
					     offset:'100px',
					     shadeClose: true,
					     shade: 0.8,
					     scrollbar:false,
					     area: ['670px', '510px'],
					     content: 'distribute?roleId='+tr_roleId, //iframe的url
					     success:function(layero,index){//iframe页面回调函数
					    	/*  //iframeWin 对象
					    	 var iframeWin = window[layero.find('iframe')[0]['name']];
					    	 iframeWin.roleId=tr_roleId;//父页面roleId值传递给iframe页面
					    	 console.log(layero, index); */
					     }
					}); 
					
				},
				authorize:function(obj){//角色授权
					var tr_roleId = $(obj).data("opid");
					layer.open({
						 type: 2,
					     title: '角色授权',
					     offset:'100px',
					     shadeClose: true,
					     shade: 0.8,
					     scrollbar:false,
					     area: ['350px', '420px'],
					     content: 'authorize?roleId='+tr_roleId //iframe的url
					}); 
					
				}
		}
		
	</script>

</body>
</html>
