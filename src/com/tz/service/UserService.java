package com.tz.service;

import org.hibernate.criterion.DetachedCriteria;

import com.tz.domain.User;
public interface UserService {
    /**
     * 用户注册
     * @Title: save 
     * @Description: TODO(这里用一句话描述这个方法的作用) 
     * @param @param user    设定文件 
     * @return void    返回类型 
     * @throws
     */
	void save(User user);

	//检测账号是否重复
	Boolean getCode(DetachedCriteria dc);
	/**
	 * @Title: findUser 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param user
	 * @param @return    设定文件 
	 * @return User    返回类型 
	 * @throws
	 */
	//用户登录
	User findUser(User user);

	/** 
	 * 项目名：ssh_crm
	 * @Title: isUpdate
	 * @time：下午4:16:52 
	 * @author: 李意成
	 * @param @param user
	 * @param @return    设定文件  
	 * @return Boolean    返回类型 
	 * @throws 
	  
	 */
	Boolean isUpdate(User user);
	
}
