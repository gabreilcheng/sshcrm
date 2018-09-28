/**  
  
 * @Title: RoleService.java 
  
 * @Package com.tz.service 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年9月1日 上午11:53:08 
  
 * @version V1.0  
  
 */ 
package com.tz.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.tz.domain.Role;
import com.tz.domain.pageBean;

/**   
 * @ClassName: RoleService   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年9月1日 上午11:53:08      
 */

public interface RoleService {

	void add(Role role);

	/** 
	 * 项目名：ssh_crm
	 * @Title: getPageBean
	 * @time：下午12:50:31 
	 * @author: 李意成
	 * @param @param dc
	 * @param @param pageSize
	 * @param @param currentPage
	 * @param @return    设定文件  
	 * @return pageBean    返回类型 
	 * @throws 
	  
	 */
	pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage);

	/** 
	 * 项目名：ssh_crm
	 * @Title: delRole
	 * @time：上午11:39:32 
	 * @author: 李意成
	 * @param @param role_id    设定文件  
	 * @return void    返回类型 
	 * @throws 
	  
	 */
	void delRole(Long role_id);

	
}
