package com.tz.service.Impl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tz.dao.UserDao;
import com.tz.domain.User;
import com.tz.service.UserService;
import com.tz.util.Md5Util;

@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name="userDao")
	private UserDao ud;
	
	@Override
	public void save(User user) {
		user.setUser_password(Md5Util.generate(user.getUser_password()));
		ud.save(user);
	}
	
	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	@Override
	public Boolean getCode(DetachedCriteria dc) {
		User user = ud.getByCode(dc);
		if(user==null){
			return true;
		}
		return false;
	}

	/**
	 * 查找用户
	 */
	@Override
	public User findUser(User user) {
		User exitUser = ud.loginByCode(user.getUser_code());
//		if(exitUser==null){
//		throw new RuntimeException("用户名不存在！");
		/*if(!exitUser.getUser_password().equals(Md5Util.MD5(user.getUser_password()))){
			throw new RuntimeException("用户或密码错误！");
		}*/
		if(!Md5Util.verify(user.getUser_password(),exitUser.getUser_password())){
			throw new RuntimeException("用户或密码错误！");
		}
		return exitUser;
	}

	/*  
	 * 描述:( 用户修改密码  )  
	 * 日期：2018年8月26日 
	 * @author: liyicheng
	 */ 
	@Override
	public Boolean isUpdate(User user) {
		User loginByCode = ud.loginByCode(user.getUser_code());
		if(!Md5Util.verify(user.getUser_password(),loginByCode.getUser_password())){
			throw new RuntimeException("密码错误！");
		}else{
			loginByCode.setUser_password(Md5Util.generate(user.getUser_repassword()));
			ud.update(loginByCode);
			return true;
		}
	}
	
}
