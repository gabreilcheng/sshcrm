/**  
  
 * @Title: SaleVisitAction.java 
  
 * @Package com.tz.web.action 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年8月24日 上午10:09:02 
  
 * @version V1.0  
  
 */ 
package com.tz.web.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tz.domain.SaleVisit;
import com.tz.domain.User;
import com.tz.domain.pageBean;
import com.tz.service.SaleVisitService;

/**   
 * @ClassName: SaleVisitAction   
 * @Description: TODO( 拜访人 )   
 * @author liyicheng   
 * @date 2018年8月24日 上午10:09:02      
 */
@Controller("saleVisitAction")
@Scope("prototype")
public class SaleVisitAction extends ActionSupport implements ModelDriven<SaleVisit>{

	private SaleVisit sVisit= new SaleVisit();
	@Resource(name="saleVIsitImpl")
	private SaleVisitService svs;
	
	private Integer currentPage;
	private Integer pageSize;
	
	/**
	 * 项目名：ssh_crm
	 * @Title: save
	 * @time：下午12:15:43 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String  save(){
		System.out.println(sVisit);
		User user = (User) ActionContext.getContext().getSession().get("user");
		sVisit.setUser(user);
		svs.save(sVisit);
		return "list";
	}
	/**
	 * 项目名：ssh_crm
	 * @Title: pageList
	 * @time：下午12:15:39 
	 * @author: 李意成
	 * @param @return
	 * @param @throws Exception    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String pageList() throws Exception{
		//离线查询
		DetachedCriteria dc  = DetachedCriteria.forClass(SaleVisit.class);
		if(StringUtils.isNotBlank(sVisit.getVisit_interviewee())){
			dc.add(Restrictions.like("visit_interviewee", "%"+sVisit.getVisit_interviewee()+"%"));
		}
		pageBean pb = svs.getPageBean(dc, pageSize , currentPage);
		ActionContext.getContext().put("pageBean", pb);
		return "pageBean";
	} 
	/**
	 * 回显
	 * 项目名：ssh_crm
	 * @Title: updateShow
	 * @time：下午5:08:03 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String updateShow(){
		SaleVisit c = svs.getById(sVisit.getVisit_id());
		ActionContext.getContext().put("saleV", c);
		return "show";
	}
	/**
	 * 更新
	 * 项目名：ssh_crm
	 * @Title: update
	 * @time：下午5:19:38 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String update(){
		svs.update(sVisit);
		return "list";
	}
	
    public  String delete(){
		svs.delete(sVisit.getVisit_id());
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
	public void setSvs(SaleVisitService svs) {
		this.svs = svs;
	}




	/*  
	 * <p>描述: </p>  
	 * 日期：2018年8月24日 
	 * @author: liyicheng
	 */ 
	@Override
	public SaleVisit getModel() {
		return sVisit;
	}



	
	
	
	
	
}
