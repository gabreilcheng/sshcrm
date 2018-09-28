package com.tz.domain;

import java.util.List;

public class pageBean {

	private List  list;
	//每页显示的条数
	private Integer pageSize;
	//当前页数
	private Integer currentPage;
	//总记录数
	private Integer totalCount;
	//总页数
	private Integer totalPage;
	
	//初始化值
	public pageBean(Integer pageSize, Integer currentPage, Integer totalCount) {
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		//默认每页6条数据
		if(this.pageSize==null){
			this.pageSize = 5;
		}
		//默认为第一页
		if(this.currentPage == null){
			this.currentPage = 1;
		}
		//总页数的计算
		this.totalPage = (int) Math.ceil(this.totalCount*1.0/this.pageSize);
		//this.totalPage = (this.totalCount + this.pageSize -1)/this.pageSize;
		System.out.println(totalPage);
		//边界判断
		if(this.currentPage <1){
			this.currentPage =1;
		}
		if(this.currentPage > this.totalPage){
			this.currentPage = this.totalPage;
		}
		
	}
	//计算起始索引
	public Integer getFirstIndex(){
		return (this.currentPage -1)*this.pageSize;
	}
	
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
}
