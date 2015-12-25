<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<%@include file="/WEB-INF/pages/include/public.jsp" %>
<style type="text/css">
    body{background:white;}
	#userform{height:34px;border-bottom: 1px solid #EAC7C7;margin-top:5px;}
	#userform div{float:left;margin-left: 16px;}
	#userform div input[type='text']{width:130px;height:25px;}
	#usershow{margin-top:5px;}
	#btnBox{position:fixed;bottom:10px;right:15px;}
	#pageBox{position: relative; left: 10px;top:-30px;}

</style>
<!-- 用户列表框 -->
<div id="userDialog">
	<div id="userform">
		<form action="${basePath}/admin/permission/distribute" method="post" id="searchForm">
			 <input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}"/>
   			 <input id="pageSize" name="pageSize" type="hidden" value="${pageInfo.pageSize}"/>
			<div>
				<label>用户名:</label>	
				<input type="text" id="username" placeholder="用户名">
			</div>
			<div>
				<label>手机号:</label>
				<input type="text" id="mobile" placeholder="手机号">
			</div>
			<div>
				<button class="btnSearch">搜索</button>
			</div>
		</form>
	</div>	
	<div id="usershow">
		<table class="table table-bordered table-striped table-condensed">
			<thead>
			      <tr>
			      	 <th class="center">
						 <input type="checkbox"  id="chkAll">
					 </th>
			         <th>编号</th>
			         <th>用户名</th>
			         <th>手机号</th>
			      </tr>
	  	   </thead>
		   <tbody>
		   		<c:forEach var="user" items="${pageInfo.list}">
		   			 <tr>
				      	 <td class="center">
							<input type="checkbox"  value="${user.id}">
						 </td>
				         <td>${user.id}</td>
				         <td>${user.username}</td>
				         <td>${user.mobile}</td>
		     		 </tr>
		   		</c:forEach>
		     </tbody>
		</table>
	</div>
	<div id="pagebox">
		 ${gu:pageStr(pageInfo)}
	</div>
	<div id="btnBox">
		<button type="button" class="btn btn-info btn-xs" onclick="btnSure(this);">确定</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-info btn-xs" onclick="btnCancel(this);">取消</button>
	</div>
</div>
<script type="text/javascript">
	function page(n, s) {
		  $("#pageNum").val(n);
          $("#pageSize").val(s);
          $("#searchForm").submit();
          return false;
	}
</script>
<script type="text/javascript">
	var index = parent.layer.getFrameIndex(window.name); //得到当前iframe层的索引
    //确定，保存角色分配给用户
	function btnSure(obj){
		var id_array  = [];
		$("input[type='checkbox']:checked").each(function(){
			id_array.push($(this).val());
		});
		var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
		$.ajax({
			type:"post",
			url:adminPath+"/permission/roleDistributeUser",
			data:{"roleId":"${roleId}","userIds":idstr},
		    success:function(data){
		    	parent.layer.close(index); //再执行关闭     
		    }
		});
	}
	
    //取消，关闭iframe层
	function btnCancel(obj){
		parent.layer.close(index); //再执行关闭     
	}
</script>



