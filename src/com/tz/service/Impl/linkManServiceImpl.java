package com.tz.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tz.dao.linkmanDao;
import com.tz.domain.linkman;
import com.tz.domain.pageBean;
import com.tz.service.linkmanService;
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED,readOnly=false)
@Service("linkmanService")
public class linkManServiceImpl implements linkmanService{
	@Resource(name="linkManDao")
	private linkmanDao lkd;
	@Override
	public void save(linkman lkm) {
		lkd.save(lkm);
	}
	
	
	
	public void setLkd(linkmanDao lkd) {
		this.lkd = lkd;
	}



	@Override
	public pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage) {
		Integer totalCount = lkd.getTotalCount(dc);
		//封装pageBean
		pageBean pb = new pageBean(pageSize, currentPage, totalCount);
		//调用dao层获取list
		List<linkman> list = lkd.getList(dc,pb.getFirstIndex(),pb.getPageSize());
		pb.setList(list);
		return pb;
	}



	@Override
	public linkman getById(Long lkm_id) {
		linkman byId = lkd.getById(lkm_id);
		return byId;
	}


	@Override
	public void update(linkman lkm) {
		lkd.update(lkm);
	}


	@Override
	public void delete(Long long1) {
		lkd.delete(long1);
	}
	
	
	
}
