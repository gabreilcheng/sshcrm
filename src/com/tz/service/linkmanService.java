package com.tz.service;

import org.hibernate.criterion.DetachedCriteria;

import com.tz.domain.linkman;
import com.tz.domain.pageBean;

public interface linkmanService {

	public void save(linkman lkm);

	public pageBean getPageBean(DetachedCriteria dc, Integer pageSize,
			Integer currentPage);

	public linkman getById(Long lkm_id);

	public void update(linkman lkm);

	public void delete(Long long1);
}
