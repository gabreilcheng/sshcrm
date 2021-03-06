package com.tz.domain;

import java.util.HashSet;
import java.util.Set;

public class Customer {
	/**
	 */
	private Long   cust_id;
	private String cust_name;
	
	private BaseDict cust_source;
	private BaseDict cust_industry;
	private BaseDict cust_level;
	
	private String cust_linkman;
	private String cust_phone;
	private String cust_mobile;
	
	private String cust_Address;
	private String cust_Fax;
	private String cust_Website;
	
	private Set<linkman> linkmans = new HashSet<linkman>();
	private Set<SaleVisit> saleVisits = new HashSet<SaleVisit>();
	
	public Set<SaleVisit> getSaleVisits() {
		return saleVisits;
	}
	public void setSaleVisits(Set<SaleVisit> saleVisits) {
		this.saleVisits = saleVisits;
	}
	public Set<linkman> getLinkmans() {
		return linkmans;
	}
	public void setLinkmans(Set<linkman> linkmans) {
		this.linkmans = linkmans;
	}
	public Long getCust_id() {
		return cust_id;
	}
	public void setCust_id(Long cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	
	public BaseDict getCust_source() {
		return cust_source;
	}
	public void setCust_source(BaseDict cust_source) {
		this.cust_source = cust_source;
	}
	public BaseDict getCust_industry() {
		return cust_industry;
	}
	public void setCust_industry(BaseDict cust_industry) {
		this.cust_industry = cust_industry;
	}
	public BaseDict getCust_level() {
		return cust_level;
	}
	public void setCust_level(BaseDict cust_level) {
		this.cust_level = cust_level;
	}
	public String getCust_linkman() {
		return cust_linkman;
	}
	public void setCust_linkman(String cust_linkman) {
		this.cust_linkman = cust_linkman;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}
	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}
	public String getCust_Address() {
		return cust_Address;
	}
	public void setCust_Address(String cust_Address) {
		this.cust_Address = cust_Address;
	}
	public String getCust_Fax() {
		return cust_Fax;
	}
	public void setCust_Fax(String cust_Fax) {
		this.cust_Fax = cust_Fax;
	}
	public String getCust_Website() {
		return cust_Website;
	}
	public void setCust_Website(String cust_Website) {
		this.cust_Website = cust_Website;
	}
	@Override
	public String toString() {
		return "Customer [cust_id=" + cust_id + ", cust_name=" + cust_name
				+ ", cust_source=" + cust_source + ", cust_industry="
				+ cust_industry + ", cust_level=" + cust_level
				+ ", cust_linkman=" + cust_linkman + ", cust_phone="
				+ cust_phone + ", cust_mobile=" + cust_mobile
				+ ", cust_Address=" + cust_Address + ", cust_Fax=" + cust_Fax
				+ ", cust_Website=" + cust_Website + "]";
	}
	
}
