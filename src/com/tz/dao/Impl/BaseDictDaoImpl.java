package com.tz.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.tz.dao.BaseDictDao;
import com.tz.domain.BaseDict;
@Repository("baseDictDao")
public class BaseDictDaoImpl extends baseDaoImpl<BaseDict> implements BaseDictDao{

	@Resource(name="sessionFactory")
	public void setSession(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	@Override
	public List<BaseDict> getListByType(String dict_type_code) {
		DetachedCriteria dc = DetachedCriteria.forClass(BaseDict.class);
		dc.add(Restrictions.eq("dict_type_code", dict_type_code));
		
		List<BaseDict> list = (List<BaseDict>) getHibernateTemplate().findByCriteria(dc);
		return list;
	}

	
}
