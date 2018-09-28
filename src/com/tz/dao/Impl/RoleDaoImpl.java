/**  
  
 * @Title: RoleDaoImpl.java 
  
 * @Package com.tz.dao.Impl 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年9月1日 上午11:57:17 
  
 * @version V1.0  
  
 */ 
package com.tz.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.tz.dao.RoleDao;
import com.tz.domain.Role;

/**   
 * @ClassName: RoleDaoImpl   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年9月1日 上午11:57:17      
 */
@Repository
public class RoleDaoImpl extends baseDaoImpl<Role> implements RoleDao{

	@Resource(name="sessionFactory")
	public void setSession(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

}
