/**  
  
 * @Title: SaleVisitDaoImpl.java 
  
 * @Package com.tz.dao.Impl 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年8月24日 上午10:19:10 
  
 * @version V1.0  
  
 */ 
package com.tz.dao.Impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tz.dao.SaleVisitDao;
import com.tz.domain.SaleVisit;

/**   
 * @ClassName: SaleVisitDaoImpl   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年8月24日 上午10:19:10      
 */
@Repository("saleVisitDao")
public class SaleVisitDaoImpl extends baseDaoImpl<SaleVisit> implements SaleVisitDao{

	@Resource(name="sessionFactory")
	public void setSession(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
}
