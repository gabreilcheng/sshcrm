package com.tz.dao;

import java.util.List;

import com.tz.domain.Customer;

public interface customerDao extends baseDao<Customer>{

	@Override
	public void save(Customer t);

	public List<Customer> findList();
	
	public List<Object[]>  getIndustyCount();

	/** 
	 * 项目名：ssh_crm
	 * @Title: getSourceCount
	 * @time：上午9:55:30 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return List<Object[]>    返回类型 
	 * @throws 
	  
	 */
	public List<Object[]> getSourceCount();
}
