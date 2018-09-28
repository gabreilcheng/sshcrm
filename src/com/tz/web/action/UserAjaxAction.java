package com.tz.web.action;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tz.domain.User;
import com.tz.service.UserService;
@Controller("userAjaxAction")
@Scope("prototype")
public class UserAjaxAction extends ActionSupport{

	private String user_code;
	@Resource(name="userService")
	private UserService userService;
	/**
	 * @Title: ajax 
	 * @Description: TODO( 注册前检测  ) 
	 * @param @return
	 * @param @throws IOException    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String ajax() throws IOException{
		DetachedCriteria dc = DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("user_code", user_code));
		Boolean a  = userService.getCode(dc);
		String text="";
		if(a){
			text ="可以注册！";
		}else {
			text ="账号已经注册！";
		}
		ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(text);
		
		return null;
	}
	
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
