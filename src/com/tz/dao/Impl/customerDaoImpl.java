package com.tz.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.tz.dao.customerDao;
import com.tz.domain.Customer;
@Repository("customerDao")
public class customerDaoImpl extends baseDaoImpl<Customer> implements customerDao{

	@Resource(name="sessionFactory")
	public void setSession(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public List<Customer> findList() {
		DetachedCriteria dc = DetachedCriteria.forClass(Customer.class);
		List<Customer> list = (List<Customer>) getHibernateTemplate().findByCriteria(dc);
		return list;
	}

	/*  
	 * <p>描述: 统计行业  </p>  
	 * 日期：2018年8月26日 
	 * @author: liyicheng
	 */ 
	@Override
	public List<Object[]> getIndustyCount() {
		
		@SuppressWarnings("unchecked")
		List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql ="select b.dict_tz_name,count(1) from cst_customer c,base_dict b  where c.cust_level=b.dict_id GROUP BY c.cust_level";
			@Override
			public List doInHibernate(Session session) throws HibernateException {
				 SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		return list;
	}

	/*  
	 * <p>描述: </p>  
	 * 日期：2018年8月26日 
	 * @author: liyicheng
	 */ 
	@Override
	public List<Object[]> getSourceCount() {
		@SuppressWarnings("unchecked")
		List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql ="select b.dict_tz_name,count(1) from cst_customer c,base_dict b where c.cust_source=b.dict_id GROUP BY c.cust_source";
			@Override
			public List doInHibernate(Session session) throws HibernateException {
				 SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		return list;
	}
	
	
	
}
