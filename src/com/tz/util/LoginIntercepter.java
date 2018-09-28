package com.tz.util;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.tz.domain.User;

public class LoginIntercepter extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("user");
		//判断登录标识
		if(user==null){
			return "toLogin";  //没有登录
		}else {
			return invocation.invoke();  //放行
		}
	}

	
}
