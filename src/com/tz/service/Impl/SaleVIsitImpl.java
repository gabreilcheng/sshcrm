/**  
  
 * @Title: SaleVIsitImpl.java 
  
 * @Package com.tz.service.Impl 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年8月24日 上午10:16:46 
  
 * @version V1.0  
  
 */ 
package com.tz.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tz.dao.SaleVisitDao;
import com.tz.domain.SaleVisit;
import com.tz.domain.pageBean;
import com.tz.service.SaleVisitService;

/**   
 * @ClassName: SaleVIsitImpl   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年8月24日 上午10:16:46      
 */
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
@Service("saleVIsitImpl")
public class SaleVIsitImpl implements SaleVisitService{
	@Resource(name="saleVisitDao")
	private SaleVisitDao svd;
	/*  
	 * <p>描述: 保存 </p>  
	 * 日期：2018年8月24日 
	 * @author: liyicheng
	 */ 
	@Override
	public void save(SaleVisit sv) {
		svd.save(sv);
	}
	
	public void setSvd(SaleVisitDao svd) {
		this.svd = svd;
	}

	/*  
	 * <p>描述: </p>  
	 * 日期：2018年8月24日 
	 * @author: liyicheng
	 */ 
	@Override
	public pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage) {
		//调用dao层
		Integer totalCount = svd.getTotalCount(dc);
		//封装pageBean
		pageBean pb = new pageBean(pageSize, currentPage, totalCount);
		//调用dao层获取list
		List<SaleVisit> list = svd.getList(dc,pb.getFirstIndex(),pb.getPageSize());
		pb.setList(list);
		return pb;
	}

	/*  
	 * <p>描述: </p>  
	 * 日期：2018年8月24日 
	 * @author: liyicheng
	 */ 
	@Override
	public SaleVisit getById(String visit_id) {
		SaleVisit byId = svd.getById(visit_id);
		return byId;
	}

	/*  
	 * <p>描述: </p>  
	 * 日期：2018年8月24日 
	 * @author: liyicheng
	 */ 
	@Override
	public void update(SaleVisit sVisit) {
		svd.update(sVisit);
	}

	/*  
	 * <p>描述: </p>  
	 * 日期：2018年8月24日 
	 * @author: liyicheng
	 */ 
	@Override
	public void delete(String visit_id) {
		svd.delete(visit_id);
	}
}
