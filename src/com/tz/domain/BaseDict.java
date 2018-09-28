package com.tz.domain;

public class BaseDict {

	private String dict_id;
	private String dict_type_code;
	private String dict_type_name;
	private String dict_tz_name;
	private String dict_tz_code;
	private String dict_memo;
	
	private Integer dict_sort;
	private Character dict_enable;
	
	public String getDict_id() {
		return dict_id;
	}
	public void setDict_id(String dict_id) {
		this.dict_id = dict_id;
	}
	public String getDict_type_code() {
		return dict_type_code;
	}
	public void setDict_type_code(String dict_type_code) {
		this.dict_type_code = dict_type_code;
	}
	public String getDict_type_name() {
		return dict_type_name;
	}
	public void setDict_type_name(String dict_type_name) {
		this.dict_type_name = dict_type_name;
	}
	public String getDict_tz_name() {
		return dict_tz_name;
	}
	public void setDict_tz_name(String dict_tz_name) {
		this.dict_tz_name = dict_tz_name;
	}
	public String getDict_tz_code() {
		return dict_tz_code;
	}
	public void setDict_tz_code(String dict_tz_code) {
		this.dict_tz_code = dict_tz_code;
	}
	public String getDict_memo() {
		return dict_memo;
	}
	public void setDict_memo(String dict_memo) {
		this.dict_memo = dict_memo;
	}
	public Integer getDict_sort() {
		return dict_sort;
	}
	public void setDict_sort(Integer dict_sort) {
		this.dict_sort = dict_sort;
	}
	public Character getDict_enable() {
		return dict_enable;
	}
	public void setDict_enable(Character dict_enable) {
		this.dict_enable = dict_enable;
	}
	
}
