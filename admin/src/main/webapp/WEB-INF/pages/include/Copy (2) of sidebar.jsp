<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
	try {
		ace.settings.check('sidebar', 'fixed');
	} catch (e) {
	}
</script>

<ul class="nav nav-list">
	<li class="">
		<a href="#" class="dropdown-toggle">
			 <i class="menu-icon fa fa-desktop"></i> 
			 <span class="menu-text">Chart &amp; </span>
			 <b class="arrow fa fa-angle-down"></b>
		</a> 
		<b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="${basePath}/admin/fusionchart" > 
					<i class="menu-icon fa fa-caret-right"></i> fusionchart 
				</a>
			    <b class="arrow"></b>
			</li>
			<li class="">
				<a href="${basePath}/admin/echart"> 
					<i class="menu-icon fa fa-caret-right"></i> echart
				</a> 
				<b class="arrow"></b>
			</li>
	 	</ul>
	</li>

	<li class="active open">
		<a href="#" class="dropdown-toggle"> 
			<i class="menu-icon fa fa-list"></i> 
			<span class="menu-text">Tables </span>
		    <b class="arrow fa fa-angle-down"></b>
		</a>
		<b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="${basePath}/admin/treeview"> 
					<i class="menu-icon fa fa-caret-right"></i> treeview
				</a> 
				<b class="arrow"></b>
			</li>
			<li class="active">
				<a href="${basePath}/admin/jqgrid" id="jqgrid"> 
					<i class="menu-icon fa fa-caret-right"></i> jqGrid
				</a> 
				<b class="arrow"></b>
			</li>
			<li>
				<a href="${basePath}/admin/table" id="jqgrid"> 
					<i class="menu-icon fa fa-caret-right"></i> table
				</a> 
				<b class="arrow"></b>
			</li>
		</ul>
	</li>

	<li class="">
		<a href="#" class="dropdown-toggle">
			 <i class="menu-icon fa fa-pencil-square-o"></i>
			 <span class="menu-text">Forms </span> 
			 <b class="arrow fa fa-angle-down"></b>
		</a>
	    <b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="${basePath}/admin/form"> 
					<i class="menu-icon fa fa-caret-right"></i> form
				</a>
			    <b class="arrow"></b>
			</li>
			<li class="">
				<a href="${basePath}/admin/email">
					 <i class="menu-icon fa fa-caret-right"></i>email
				</a>
			    <b class="arrow"></b>
			</li>
		</ul>
	</li>
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

<script type="text/javascript">
	
	
	
	
</script>





