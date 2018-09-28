package com.tz.dao.Impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.tz.dao.baseDao;

public class baseDaoImpl<T> extends HibernateDaoSupport implements baseDao<T>{

	private Class clz;
	//获取当前类的带有泛型的父类的类型
	public baseDaoImpl() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		clz = (Class) pt.getActualTypeArguments()[0] ;
	}
	
	@Override
	public void save(T t) {
		getHibernateTemplate().save(t);
	}

	@Override
	public void delete(Serializable id) {
		T t = getById(id);
		getHibernateTemplate().delete(t);
	}

	@Override
	public void delete(T t) {
		getHibernateTemplate().delete(t);
	}

	@Override
	public void update(T t) {
		getHibernateTemplate().update(t);
	}

	@Override
	public T getById(Serializable id) {
		T object = (T) getHibernateTemplate().get(clz, id);
		return object;
	}

	@Override
	public Integer getTotalCount(DetachedCriteria dc) {
		
		DetachedCriteria count = dc.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) getHibernateTemplate().findByCriteria(dc);
		//清空聚合函数条件
		dc.setProjection(null);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return null;
	}

	@Override
	public List<T> getList(DetachedCriteria dc, Integer firstPage,
			Integer pageSize) {
		
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(dc, firstPage, pageSize);
		return list;
	}

	
}
