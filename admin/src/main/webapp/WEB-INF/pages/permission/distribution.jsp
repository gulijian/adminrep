<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<%@include file="/WEB-INF/pages/include/public.jsp" %>
<style type="text/css">
    body{background:white;}
	#userform{height:34px;border-bottom: 1px solid #EAC7C7;margin-top:5px;}
	#userform div{float:left;margin-left: 16px;}
	#userform div input[type='text']{width:130px;height:25px;}
	#usershow{margin-top:5px;}

</style>
<!-- 用户列表框 -->
<div id="userDialog">
	<div id="userform">
		<form action="#" method="post">
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
		<table class="table table-bordered">
			<thead>
			      <tr>
			      	 <th class="center">
						 <input type="checkbox" value="" id="chkAll">
					 </th>
			         <th>编号</th>
			         <th>用户名</th>
			         <th>手机号</th>
			      </tr>
	  	   </thead>
		   <tbody>
		   		<c:forEach var="user" items="${userLst}">
		   			 <tr>
				      	 <td class="center">
							<input type="checkbox" value="1">
						 </td>
				         <td>${user.id}</td>
				         <td>${user.username}</td>
				         <td>${user.mobile}</td>
		     		 </tr>
		   		</c:forEach>
		     </tbody>
		</table>
	</div>
</div>
