package com.tz.service;

import java.util.List;

import com.tz.domain.BaseDict;

public interface BaseDictService {

	List<BaseDict> getListByType(String dict_type_code);
}
