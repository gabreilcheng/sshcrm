package com.tz.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

/**
 * @ClassName: baseDao   
 * @Description: TODO( 通用的增删改查接口类 )   
 * @author liyicheng   
 * @date 2018年8月15日 下午6:47:41
 */
public interface  baseDao<T>{
	
	/**
	 * @Title: save 
	 * @Description: TODO( 保存方法 ) 
	 * @param @param t    设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public void  save(T t);
	
	/**
	 * @Title: delete  
	 * @Description: TODO( 通过id删除 ) 八大基本数据类型及包装类都实现了Serializable
	 * @param @param id    设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public void delete(Serializable id);
	/**
	 * @Title: delete 
	 * @Description: TODO( 通过对象删除 ) 
	 * @param @param t    设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public  void delete(T t);
	/**
	 * @Title: update 
	 * @Description: TODO( 更新 ) 
	 * @param @param t    设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public  void update(T t);
	
	/**
	 * @Title: getById 
	 * @Description: TODO( 根据id查  ) 
	 * @param @param id
	 * @param @return    设定文件 
	 * @return T    返回类型 
	 * @throws
	 */
	public T getById(Serializable id);
	
	/**
	 * @Title: getTotalCount 
	 * @Description: TODO( 获取总记录数   ) 
	 * @param @param dc
	 * @param @return    设定文件 
	 * @return T    返回类型 
	 * @throws
	 */
	public Integer getTotalCount(DetachedCriteria dc);
	
	/**
	 * @Title: getList 
	 * @Description: TODO( 根据分页获取列表  ) 
	 * @param @param dc
	 * @param @param firstPage
	 * @param @param pageSize
	 * @param @return    设定文件 
	 * @return List<T>    返回类型 
	 * @throws
	 */
	List<T> getList(DetachedCriteria dc,Integer firstPage,Integer pageSize);
	
}
