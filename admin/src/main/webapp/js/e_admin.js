/* jquery ajax 封装*/
var guAjax = {
	request: function(options,params){
		//继承参数
		var opts = $.extend({},{
			path:"",
			type:"post",
			model:"",
			method:"",
			params:"",
			dataType:"json",
			before:function(){},
			success:function(){},
			error:function(){}
		},options);
		//url拼接
		if(!opts.url){
			opts.url = opts.path+"/"+opts.model+"/"+opts.method+(opts.params?"?"+opts.params:"");
		}
		$.ajax({
			type:opts.type,
			url:opts.url,
			dataType:opts.dataType,
			beforeSend:opts.before,
			error:opts.error,
			data:params,
			success:function(data){
				if(opts.success)opts.success(data);
			}
		});
	}
}