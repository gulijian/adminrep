<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
	try {
		ace.settings.check('sidebar', 'fixed');
	} catch (e) {
	}
</script>

<ul class="nav nav-list">
	<li class="active">
		<a href="index.html">
			 <i class="menu-icon fa fa-tachometer"></i> 
			 <span class="menu-text">Dashboard </span>
		</a> 
		<b class="arrow"></b>
	</li>
	<li class="">
		<a href="#" class="dropdown-toggle">
			 <i class="menu-icon fa fa-desktop"></i> 
			 <span class="menu-text">UI &amp; Elements </span>
			 <b class="arrow fa fa-angle-down"></b>
		</a> 
		<b class="arrow"></b>
		<ul class="submenu">
			<li class="">
				<a href="#" class="dropdown-toggle"> 
					<i class="menu-icon fa fa-caret-right"></i> Layouts 
					<b class="arrow fa fa-angle-down"></b>
				</a>
			    <b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="top-menu.html"> 
							<i class="menu-icon fa fa-caret-right"></i> Top Menu
						</a> 
						<b class="arrow"></b>
					</li>
				</ul>
			</li>
			<li class="">
				<a href="treeview.html"> 
					<i class="menu-icon fa fa-caret-right"></i> Treeview
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
				<a href="/home/user/treeview"> 
					<i class="menu-icon fa fa-caret-right"></i> treeview
				</a> 
				<b class="arrow"></b>
			</li>
			<li class="active">
				<a href="/home/user/jqgrid" id="jqgrid"> 
					<i class="menu-icon fa fa-caret-right"></i> jqGrid
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
				<a href="form-elements.html"> 
					<i class="menu-icon fa fa-caret-right"></i> Form Elements
				</a>
			    <b class="arrow"></b>
			</li>
			<li class="">
				<a href="form-elements-2.html">
					 <i class="menu-icon fa fa-caret-right"></i> Form Elements 2
				</a>
			    <b class="arrow"></b>
			</li>
		</ul>
	</li>

	<li class="">
		<a href="widgets.html"> 
			<i class="menu-icon fa fa-list-alt"></i>
		    <span class="menu-text">Widgets </span>
		</a> 
	    <b class="arrow"></b>
	</li>

	<li class="">
		<a href="calendar.html"> 
			<i class="menu-icon fa fa-calendar"></i> 
			<span class="menu-text">Calendar <!-- #section:basics/sidebar.layout.badge --> 
				<span class="badge badge-transparent tooltip-error" 	title="2 Important Events"> 
					<i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
				</span> <!-- /section:basics/sidebar.layout.badge -->
			</span>
		</a> 
		<b class="arrow"></b>
	</li>

	<li class="">
		<a href="#" class="dropdown-toggle">
			 <i class="menu-icon fa fa-file-o"></i>
			 <span class="menu-text">Other Pages <!-- #section:basics/sidebar.layout.badge -->
			 	 <span class="badge badge-primary">5</span> <!-- /section:basics/sidebar.layout.badge -->
			 </span> 
			<b class="arrow fa fa-angle-down"></b>
		</a>
	    <b class="arrow"></b>
		<ul class="submenu">
			<li class=""><a href="error-404.html"> <i
					class="menu-icon fa fa-caret-right"></i> Error 404
			</a> <b class="arrow"></b></li>
	
			<li class="">
				<a href="error-500.html">
					 <i class="menu-icon fa fa-caret-right"></i> Error 500
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
