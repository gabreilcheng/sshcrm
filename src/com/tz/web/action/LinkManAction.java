package com.tz.web.action;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tz.domain.linkman;
import com.tz.domain.pageBean;
import com.tz.service.linkmanService;
@Controller("linkManAction")
@Scope("prototype")
public class LinkManAction extends ActionSupport implements ModelDriven<linkman>{
	
	private linkman lkm = new linkman();
	@Resource(name="linkmanService")
	private linkmanService lms;
	
	private Integer currentPage;
	private Integer pageSize;
	
	public String add(){
		System.out.println(lkm);
		lms.save(lkm);
		return "list";
	}
	
	/**
	 * @Title: pageList 
	 * @Description: TODO( 分页查询  ) 
	 * @param @return
	 * @param @throws Exception    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String pageList() throws Exception{
		//离线查询
		DetachedCriteria dc  = DetachedCriteria.forClass(linkman.class);
		if(StringUtils.isNotBlank(lkm.getLkm_name())){
			System.out.println(lkm.getLkm_name());
			dc.add(Restrictions.like("lkm_name", "%"+lkm.getLkm_name()+"%"));
		}
		
		pageBean pb = lms.getPageBean(dc, pageSize , currentPage);
		ActionContext.getContext().put("pageBean", pb);
		System.out.println(pb);
		return "pageBean";
	} 
	
	/**
	 * @Title: updateCustomer 
	 * @Description: TODO( 根据id查找customer回显  ) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String lkmshow(){
		linkman c = lms.getById(lkm.getLkm_id());
		ActionContext.getContext().put("linkMan", c);
		return "update";
	}
	/**
	 * @Title: update 
	 * @Description: TODO( 更新操作  ) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String update(){
		lms.update(lkm);
		return "list";
	}
	
	public String delete(){
		lms.delete(lkm.getLkm_id());
		return "list";
	}
	
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setLms(linkmanService lms) {
		this.lms = lms;
	}

	@Override
	public linkman getModel() {
		return lkm;
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
