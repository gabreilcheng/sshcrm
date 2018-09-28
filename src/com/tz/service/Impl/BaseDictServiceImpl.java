package com.tz.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tz.dao.BaseDictDao;
import com.tz.domain.BaseDict;
import com.tz.service.BaseDictService;
@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService{

	@Resource(name="baseDictDao")
	private BaseDictDao bd;
	
	@Override
	public List<BaseDict> getListByType(String dict_type_code) {
		List<BaseDict> list = bd.getListByType(dict_type_code);
		return list;
	}

	public void setBd(BaseDictDao bd) {
		this.bd = bd;
	}
 
}
