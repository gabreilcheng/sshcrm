package com.tz.dao;

import org.hibernate.criterion.DetachedCriteria;

import com.tz.domain.User;

public interface UserDao extends baseDao<User>{
	//根据用户名查询对象
	User getByCode(DetachedCriteria dc);

	User loginByCode(String user_code);
}
