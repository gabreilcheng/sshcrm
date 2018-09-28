package com.tz.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tz.domain.BaseDict;
import com.tz.service.BaseDictService;
@Controller("baseDictAction")
@Scope("prototype")
public class BaseDictAction extends ActionSupport{
	
	private String dict_type_code;
	@Resource(name="baseDictService")
	private BaseDictService bdc;
	
	public String execute() throws IOException{
		List<BaseDict> list = bdc.getListByType(dict_type_code);
		String json  = JSONArray.fromObject(list).toString();
		
		ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(json);
		
		//不需要进行结果处理
		return null;
	}
	
	
	public String getDict_type_code() {
		return dict_type_code;
	}

	public void setDict_type_code(String dict_type_code) {
		this.dict_type_code = dict_type_code;
	}


	public void setBdc(BaseDictService bdc) {
		this.bdc = bdc;
	}
	

}
