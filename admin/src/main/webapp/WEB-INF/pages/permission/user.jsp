<%@ page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!doctype html>
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
		#con_table #template_body tr:hover{background:#ECEFF3;}
		#con_table input[type="checkbox"]{width: 19px;height: 19px;background: white;color: green;}
		#con_table input[type="checkbox"]:hover{border:1px solid red;}
		.tr_active{background:#ECEFF3;}
		.epage{position:relative;top:-15px;}
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
									     <input  style="height:32px;" class="Wdate form-control" type="text" name="startDate" id="startDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})"    placeholder="请输入开始日期"/>~
									     <label for="endDate">结束日期:</label>
									     <input  style="height:32px;" class="Wdate form-control" type="text" name="endDate" id="endDate" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}'})"    placeholder="请输入结束日期"/>
									  </div>
									  <button type="button" class="btn btn-primary btn-xs" onclick="search();">
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
											<input type="checkbox" id="chkAll" onclick="chkAllCheck();">
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
								<tbody id="template_body">
									<c:forEach var="user" varStatus="userIndex" items="${userLst}">
										<tr>
											<td class="center">
												<input type="checkbox" name="chkItem" value="${user.id}">
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
		$(function(){
			//页面初始化
			initPage("${itemCount}");
		});
	
		var adminUser = {
				add:function(){
					
				},
				del:function(){
					delIndex = layer.open({
							title:'删除提示',
						    content: '你确认删除吗？',
						    btn: ['确认', '取消'],
						    shadeClose: false,
						    yes: function(){
						    	del();
						    }, no: function(){
						    	
						    }
					});
				}
		}
		
		//初始化页面
		function initPage(itemCount){
			$(".epage").tzPage(itemCount, {
				num_edge_entries : 1, //边缘页数
				num_display_entries :4, //主体页数
				num_edge_entries:5,
				current_page:0,
				showGo:true,
				showSelect:true,
				items_per_page : 12, //每页显示X项
				prev_text : "前一页",
				next_text : "后一页",
				callback : function(pageNo,psize){//回调函数
					loadingTemplate(pageNo,psize);
				}
			});
		}
		
		//点击分页加载回调函数,
		//如果一个ajax,访问一个同步url
		function loadingTemplate(pno,psize,callback){
			var username = $("#name").val();
			var mobile = $("#mobile").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			$.ajax({
				type:"post",
				data:{
					  "pageNo":(pno*psize),
					  "pageSize":psize,
					  "account":username,
					  "mobile":mobile,
					  "startDate":startDate,
					  "endDate":endDate
					 },
				url:adminPath+"/permission/usertemplate",
				success:function(data){
					$("#template_body").html(data);
					hh();
					var itemcount = $("#template_body").find("#itemCount").val();
					if(callback){//回调函数，搜索
					   callback(itemcount);
					}
				}
			});
		}
		//搜索
		function search(){
			loadingTemplate(0,12,function(itemcount){
				initPage(itemcount);
			});
		}
		
		function del(){
			var id_array  = [];
			$("input[type='checkbox']:checked").each(function(){
				id_array.push($(this).val());
			});
			var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
			alert(idstr);  
			
			
			layer.close(delIndex);
		}
	</script>
	
	<script type="text/javascript">
	 //全反选
	 function chkAllCheck(){
		 $("[name = chkItem]:checkbox").each(function () {
             $(this).prop("checked", !$(this).prop("checked"));
             if($(this).prop("checked")){
            	 $(this).parents("tr").addClass("tr_active");
             }else{
            	 $(this).parents("tr").removeClass("tr_active");
             }
         });
	 }
	 
	 function hh(){
		 $("#template_body").find("tr").click(function(){
			  var chked =  $(this).find(":checkbox").prop("checked");
			  if(chked){//选中状态
				  $(this).find(":checkbox").prop("checked",false);
				  $(this).removeClass("tr_active");
			  }else{
				  $(this).find(":checkbox").prop("checked",true);
			  	  $(this).addClass("tr_active");
			  }
			  return false;
		 });
	 }
	
	 hh();
	</script>
	
	
	
	
</body>
</html>
