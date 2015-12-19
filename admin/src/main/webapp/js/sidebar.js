$(function(){
	//标题名称必须和子菜单名称相同
	var title = $("title").html();
	//父级菜单下子菜单的样式
	$("#"+title+"").addClass("active").siblings("li").removeClass("active");
	//父级菜单的样式
	$("#"+title+"").parents("li").addClass("open").addClass("active").siblings("li").removeClass("open").removeClass("active");
	//导航标题
	var pmenu_name = $("#"+title+"").parents("ul").prev().prev().find("span").html();
	//父菜单名称
	$("#pmenu_name").html(pmenu_name);
	//子菜单名称
	$("#smenu_name").html(title)
	
	//退出
	$("#logOut").click(function(){
		window.location.href=basePath+"/loginOut";
	});
});
