package com.tz.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tz.dao.customerDao;
import com.tz.domain.Customer;
import com.tz.domain.pageBean;
import com.tz.service.customerServiceDao;
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
@Service("customerService")
public class customerServiceImpl implements customerServiceDao{
	@Resource(name="customerDao")
	private customerDao cd;
	/**
	 *  分页列表
	 */
	@Override
	public pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage) {
		//调用dao层
		Integer totalCount = cd.getTotalCount(dc);
		//封装pageBean
		pageBean pb = new pageBean(pageSize, currentPage, totalCount);
		//调用dao层获取list
		List<Customer> list = cd.getList(dc,pb.getFirstIndex(),pb.getPageSize());
		
		pb.setList(list);
		return pb;
	}
	
	/**
	 * 保存用户
	 */
	@Override
	public void saveAll(Customer customer) {
		cd.save(customer);
	}
	/**
	 * 根据id 查找用户
	 */
	@Override
	public Customer getById(Long cust_id) {
		Customer c = cd.getById(cust_id);
		return c;
	}
	/**
	 *  更新客户
	 */
	@Override
	public void update(Customer customer) {
		cd.update(customer);
	}
	
	@Override
	public List<Customer> find() {
		List<Customer> list = cd.findList();
		return list;
	}
	/**
	 * 删除客户
	 */
	@Override
	public void delete(Long cust_id) {
		cd.delete(cust_id);
	}
	
	public void setCd(customerDao cd) {
		this.cd = cd;
	}

	/*  
	 * <p>描述: 客户行业统计</p>  
	 * 日期：2018年8月26日 
	 * @author: liyicheng
	 */ 
	@Override
	public List<Object[]> getIndustyCount() {
		List<Object[]> industyCount = cd.getIndustyCount();
		return industyCount;
	}

	/*  
	 * <p>描述: 客户来源统计</p>  
	 * 日期：2018年8月26日 
	 * @author: liyicheng
	 */ 
	@Override
	public List<Object[]> getSourceCount() {
		List<Object[]> source = cd.getSourceCount();
		return source;
	}
}
