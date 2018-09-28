/**  
  
 * @Title: RoleAction.java 
  
 * @Package com.tz.web.action 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年9月1日 上午11:49:21 
  
 * @version V1.0  
  
 */ 
package com.tz.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.classfile.Code;
import com.tz.domain.Customer;
import com.tz.domain.Role;
import com.tz.domain.User;
import com.tz.domain.pageBean;
import com.tz.service.RoleService;

/**   
 * @ClassName: RoleAction   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年9月1日 上午11:49:21      
 */
@Controller
@Scope("prototype")
public class RoleAction extends ActionSupport implements ModelDriven<Role>{

	private Role role = new Role();
	@Autowired
	private RoleService rs;
	
	private Integer currentPage;
	private Integer pageSize;
	/**
	 * 保存用户
	 * 项目名：ssh_crm
	 * @Title: save
	 * @time：上午11:50:43 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String save(){
		rs.add(role);
		return "save";
	}
	
	
	@Override
	public Role getModel() {
		return role;
	}
	
	/**
	 * @Title: pageList 
	 * @Description: TODO( 分页查询  ) 
	 * @param @return
	 * @param @throws Exception    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String pageList() throws Exception{
		//离线查询
		DetachedCriteria dc  = DetachedCriteria.forClass(Role.class);
		if(StringUtils.isNotBlank(role.getRole_name())){
			dc.add(Restrictions.eq("role_name", role.getRole_name()));
		}
		pageBean pb = rs.getPageBean(dc, pageSize , currentPage);
		ActionContext.getContext().put("pageBean", pb);
		List<String> code = new ArrayList<String>();
		List<Role> list = pb.getList();
		System.out.println(list);
		for (Role role : list) {
			Set<User> users = role.getUsers();
			for (User user : users) {
				code.add(user.getUser_code());
			}
		}
		System.out.println(code);
		ActionContext.getContext().put("code", code);
		return "pageBean";
	}
	//删除
	public String delRole() throws Exception{
		
		rs.delRole(role.getRole_id());
		return "delete";
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	} 
	
}
