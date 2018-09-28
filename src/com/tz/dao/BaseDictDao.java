package com.tz.dao;

import java.util.List;

import com.tz.domain.BaseDict;

public interface BaseDictDao extends baseDao<BaseDict>{

	List<BaseDict> getListByType(String dict_type_code);
}
