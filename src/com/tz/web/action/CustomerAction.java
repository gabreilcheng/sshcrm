package com.tz.web.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tz.domain.Customer;
import com.tz.domain.pageBean;
import com.tz.service.customerServiceDao;
@Controller("customerAction")
@Scope("prototype")
public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{

	private Customer customer = new Customer();
	@Resource(name="customerService")
	private customerServiceDao cs;
	
	private Integer currentPage;
	private Integer pageSize;
	
	
	/**
	 * 项目名：ssh_crm
	 * @Title: getSourceCount  客户来源统计
	 * @time：上午9:53:53 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String  getSourceCount(){
		List<Object[]> sourceCount = cs.getSourceCount();
		ActionContext.getContext().put("sourceCount", sourceCount);
		return "sourceCount";
	}
	
	/**
	 * 项目名：ssh_crm
	 * @Title: getIndustyCount  行业统计
	 * @time：上午9:52:46 
	 * @author: 李意成
	 * @param @return    设定文件  
	 * @return String    返回类型 
	 * @throws
	 */
	public String  getIndustyCount(){
		List<Object[]> industyCount = cs.getIndustyCount();
		ActionContext.getContext().put("industyCount", industyCount);
		return "industyCount";
	}
	/**
	 * @Title: save 
	 * @Description: TODO( 客户保存 ) 
	 * @param     设定文件 
	 * @return void    返回类型 
	 * @throws
	 */
	public String saveAll(){
		cs.saveAll(customer);
		System.out.println(customer);
		return "suceess";
	}
	/**
	 * @Title: updateCustomer 
	 * @Description: TODO( 根据id查找customer回显  ) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String updateCustomer(){
		Customer c = cs.getById(customer.getCust_id());
		System.out.println(c);
		ActionContext.getContext().put("customer", c);
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
		cs.update(customer);
		System.out.println(customer);
		return "suceess";
	}
	
	/**
	 * @Title: delete 
	 * @Description: TODO( 删除用户  ) 
	 * @param @return    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public  String delete(){
		
		cs.delete(customer.getCust_id());
		return "suceess";
	}
	
	
	
	/**
	 * @Title: custAjax 
	 * @Description: TODO( ajax查询customer ) 
	 * @param @return
	 * @param @throws IOException    设定文件 
	 * @return String    返回类型 
	 * @throws
	 */
	public String custAjax() throws IOException{
		List<Customer> list = cs.find();
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
			@Override
			public boolean apply(Object arg0, String arg1, Object arg2) {
				if(arg1.equals("linkmans")||arg1.equals("cust_source")|| arg1.equals("cust_industry")|| arg1.equals("cust_level")|| arg1.equals("saleVisits")) return true;
				return false;
			}
		});
		String json  = JSONArray.fromObject(list,config).toString();
		ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
		ServletActionContext.getResponse().getWriter().write(json);
		//不需要进行结果处理
		return null;
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
		DetachedCriteria dc  = DetachedCriteria.forClass(Customer.class);
		if(StringUtils.isNotBlank(customer.getCust_name())){
			System.out.println(customer.getCust_name());
			dc.add(Restrictions.like("cust_name", "%"+customer.getCust_name()+"%"));
		}
		
		pageBean pb = cs.getPageBean(dc, pageSize , currentPage);
		
		ActionContext.getContext().put("pageBean", pb);
		
		System.out.println(pb);
		
		return "pageBean";
	} 
	
	

	
	
	
	
	public void setCs(customerServiceDao cs) {
		this.cs = cs;
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

	@Override
	public Customer getModel() {
		return customer;
	}
	
	
	

	
}
