<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
 	<title>登陆页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${basePath}/static/assets/css/bootstrap.css" />
	<script src="${basePath}/static/assets/js/jquery.js"></script>
	<script src="${basePath}/static/assets/js/bootstrap.js"/></script>
	<style type="text/css">
		.content{height:45%;position:absolute;margin:180px 600px;border:1px solid red;padding:10px 10px;;}
		.row{margin:15px 0px;}
		.msgTip{border:1px solid red;margin:0px 10px;height:40px; line-height:40px;text-align:center;color:red;}
		.form-control{height:40px;}
		.msgAddon{padding:2px;}
		#changeMsgCode{display:block;position:absolute;width:50px;margin-top:10px;margin-left:15px;text-decoration:none;}
		#btnLogin{width:100%;margin-top:10px;}
	</style>
  </head>
  <body >
   		<div class="container-fluid">
   			<div class="content">
   					<form class="form-inline">
   						<div class="row">
   							<div class="msgTip">提示</div>
   						</div>
   						<div class="row">
   							<div class="col-md-12 ">
   						  	 	<div class="input-group">
							     		<div class="input-group-addon">用户名</div>
							      		<input type="text" class="form-control" id="username" placeholder="username">
							    </div>
   						    </div>
   						</div>
   						<div class="row">
   							<div class="col-md-12 ">
   								<div class="input-group">
							     		<div class="input-group-addon">密&nbsp;&nbsp;&nbsp;码</div>
							      		<input type="text" class="form-control" id="password" placeholder="password">
							    </div>
   						    </div>
   						</div>
   						<div class="row">
   							<div class="col-md-9">
   								<div class="input-group">
							      		<input type="text" class="form-control" id="msgcode" placeholder="msgcode">
							      		<div class="input-group-addon msgAddon">
							      			<img src="${basePath}/images/pic1.jpg"  width="60px" >
							      		</div>
							      		<a href="#" id="changeMsgCode">换一张</a>
							    </div>
   						    </div>
   						</div>
   						<div class="row">
   							<div class="col-md-12">
   						  	 	<button id="btnLogin" type="button"  class="btn btn-primary" >登&nbsp;陆</button>
   						    </div>
   						</div>
					</form>
				</div>
   			</div>
   	<script type="text/javascript">
   		$(function(){
   			$(document).keydown(function(e){
				if(e.keyCode === 13){
					login();
				}
			});
   			
   			
   			$("#btnLogin").click(function(){
   				var username = $("#username").val();
	   			var password = $("#password").val();
	   			$.ajax({
	   				url:"${basePath}/sys/logined",
	   				type:"post",
	   				data:{"username":username,"password":password},
	   				success:function(data){
	   					alert(data);
	   				},
	   				error:function(){
	   					
	   				}
	   			});
   			});
   				
   			
   			
   		});
   	
   		
   	</script>
  </body>
</html>
