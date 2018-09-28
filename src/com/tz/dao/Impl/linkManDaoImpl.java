package com.tz.dao.Impl;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.tz.dao.linkmanDao;
import com.tz.domain.linkman;
@Repository("linkManDao")
public class linkManDaoImpl extends baseDaoImpl<linkman> implements linkmanDao{

	@Resource(name="sessionFactory")
	public void setSession(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
}
