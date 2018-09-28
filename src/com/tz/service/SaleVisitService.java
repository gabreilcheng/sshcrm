/**  
  
 * @Title: SaleVisitService.java 
  
 * @Package com.tz.service 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年8月24日 上午10:15:56 
  
 * @version V1.0  
  
 */ 
package com.tz.service;

import org.hibernate.criterion.DetachedCriteria;

import com.tz.domain.SaleVisit;
import com.tz.domain.pageBean;

/**   
 * @ClassName: SaleVisitService   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年8月24日 上午10:15:56      
 */

public interface SaleVisitService {

	void save(SaleVisit sv);

	/** 
	 * 项目名：ssh_crm
	 * @Title: getPageBean
	 * @time：下午12:17:19 
	 * @author: 李意成
	 * @param @param dc
	 * @param @param pageSize
	 * @param @param currentPage
	 * @param @return    设定文件  
	 * @return pageBean    返回类型 
	 * @throws 
	  
	 */
	pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage);

	/** 
	 * 项目名：ssh_crm
	 * @Title: getById
	 * @time：下午5:06:49 
	 * @author: 李意成
	 * @param @param visit_id
	 * @param @return    设定文件  
	 * @return SaleVisit    返回类型 
	 * @throws 
	  
	 */
	SaleVisit getById(String visit_id);

	/** 
	 * 项目名：ssh_crm
	 * @Title: update
	 * @time：下午5:20:27 
	 * @author: 李意成
	 * @param @param sVisit    设定文件  
	 * @return void    返回类型 
	 * @throws 
	  
	 */
	void update(SaleVisit sVisit);

	/** 
	 * 项目名：ssh_crm
	 * @Title: delete
	 * @time：下午6:19:15 
	 * @author: 李意成
	 * @param @param visit_id    设定文件  
	 * @return void    返回类型 
	 * @throws 
	  
	 */
	void delete(String visit_id);

}
