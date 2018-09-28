/**  
  
 * @Title: RoleServiceImpl.java 
  
 * @Package com.tz.service.Impl 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年9月1日 上午11:54:25 
  
 * @version V1.0  
  
 */ 
package com.tz.service.Impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tz.dao.RoleDao;
import com.tz.domain.Customer;
import com.tz.domain.Role;
import com.tz.domain.pageBean;
import com.tz.service.RoleService;

/**   
 * @ClassName: RoleServiceImpl   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年9月1日 上午11:54:25      
 */
@Service
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleDao rd;
	
	@Override
	public void add(Role role) {
		rd.save(role);
	}

	/*  
	 * 描述:()  
	 * 日期：2018年9月1日 
	 * @author: liyicheng
	 */ 
	@Override
	public pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage) {
		//调用dao层
		Integer totalCount = rd.getTotalCount(dc);
		//封装pageBean
		pageBean pb = new pageBean(pageSize, currentPage, totalCount);
		//调用dao层获取list
		List<Role> list = rd.getList(dc,pb.getFirstIndex(),pb.getPageSize());
		pb.setList(list);
		return pb;
	}

	/*  
	 * 描述:()  
	 * 日期：2018年9月28日 
	 * @author: liyicheng
	 */ 
	@Override
	public void delRole(Long role_id) {
		rd.delete(role_id);
	}
}
