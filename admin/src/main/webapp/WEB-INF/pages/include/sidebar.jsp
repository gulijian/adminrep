<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	try {
		ace.settings.check('sidebar', 'fixed');
	} catch (e) {
	}
</script>

<ul class="nav nav-list">
	<c:forEach var="pmenu" items="${pmenuList}">
			<li class="" >
			<a href="#" class="dropdown-toggle"> 
				<i class="menu-icon fa ${pmenu.icon}"></i> 
				<span class="menu-text">${pmenu.name} </span>
			    <b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<c:forEach var="submenu" items="${smenuList}">
					<c:if test="${submenu.model==pmenu.model}"><!-- 子菜单属于父菜单模块 -->
						<li class="" id="${submenu.name}">
							<a href="${basePath}/${submenu.url}"> 
								<i class="menu-icon fa fa-caret-right"></i> 
								<span>${submenu.name}</span>
							</a> 
							<b class="arrow"></b>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>
<!-- /.nav-list -->

<!-- #section:basics/sidebar.layout.minimize -->
<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
	<i  class="ace-icon fa fa-angle-double-left"
		data-icon1="ace-icon fa fa-angle-double-left"
		data-icon2="ace-icon fa fa-angle-double-right">
	</i>
</div>

<!-- /section:basics/sidebar.layout.minimize -->
<script type="text/javascript">
	try {
		ace.settings.check('sidebar', 'collapsed')
	} catch (e) {
	}
</script>






