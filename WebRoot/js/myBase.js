function loadselect(typeCode,optionId,selectName,selectedId){
		//创建标签
		var $select = $("<select class="+optionId+" name="+selectName+"></select>");
		$select.append("<option >----请选择----</option>");
		$select.css({"width":"254px","height":"40px","font-size":"20px"});
		$.post("${pageContext.request.contextPath }/baseDict", { dict_type_code : typeCode },
			  function(data){
			    //4.返回json数组对象  对其遍历
				  $.each(data, function(i, json){
					  var $option = $("<option value='"+json['dict_id']+"'>"+json['dict_tz_name']+"</option>");
					  //判断是否是回显
					  if(json['dict_id'] == selectedId){
						  $option.attr("selected","selected");
					  }
					  //添加
					  $select.append($option);
					});
			  },
			  "json");
		$("#"+optionId).append($select);
	}