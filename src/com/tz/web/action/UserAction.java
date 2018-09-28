package com.tz.web.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tz.domain.User;
import com.tz.service.UserService;
@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{

	private User user= new User();
	@Resource(name="userService")
	private UserService us;
	
	
	/**
	 * 项目名：ssh_crm  注册用户
	 * @Title: save
	 * @time：下午4:11:31 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String save(){
		us.save(user);
		return "toLogin";
	}
	/**
	 * @Title: login 
	 * @Description: TODO( 用户登录 ) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String login(){
		User u = us.findUser(user);
		ActionContext.getContext().getSession().put("user", u);
		return "toHome";
	}
	/**
	 * 项目名：ssh_crm
	 * @Title: nologin 注销
	 * @time：下午4:04:35 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String nologin(){
		ActionContext.getContext().getSession().remove("user");
		return "toLogin";
	}
	/**
	 * 项目名：ssh_crm
	 * @Title: editPwd  修改密码
	 * @time：下午4:13:15 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String editPwd(){
		Boolean flag = us.isUpdate(user);
		if(flag){
			ActionContext.getContext().getSession().remove("user");
		}
		return "toLogin";
	}
	
	
	@Override
	public User getModel() {
		return user;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUs(UserService us) {
		this.us = us;
	}

	
	
}
