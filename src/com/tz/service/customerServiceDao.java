package com.tz.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.tz.domain.Customer;
import com.tz.domain.pageBean;

public interface customerServiceDao {

	public pageBean getPageBean(DetachedCriteria dc,Integer pageSize,Integer currentPage);
	
	public void saveAll(Customer customer);

	public Customer getById(Long cust_id);

	public void update(Customer customer);

	public List<Customer> find();

	public void delete(Long cust_id);
	
	public List<Object[]>  getIndustyCount();

	/** 
	 * 项目名：ssh_crm
	 * @Title: getSourceCount
	 * @time：上午9:54:17 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return List<Object[]>    返回类型 
	 * @throws 
	  
	 */
	public List<Object[]> getSourceCount();
}
