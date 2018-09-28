<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="/struts-tags" prefix="s" %>
<!doctype html>
<html>
<head>
<TITLE>客户列表</TITLE> 
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="jquery-easyui-1.5.5.6/jquery.min.js"></script>
<SCRIPT language=javascript>
	function pageForm(pageName){
		$('#currentPageInput').val(pageName);
		$('#customerForm').submit();
	}
	
	function changPageSize(pageSize){
		$('#PageSizeInput').val(pageSize);
		$('#customerForm').submit();
	}
	
	
</SCRIPT>
<style type="text/css">
	#mask{
		width:100%;
		height:100%;
	    position: fixed;
	    left: 0;
	    right: 0;
	    top: 0;
	    bottom: 0;
	    background: rgba(0, 0, 0, .3);
	    z-index: 100;
	}
	.current{
		height:20px; width:30px; font-size:18px;
	}

</style>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
		<TBODY>
			<TR>	
			<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
				width="100%" align=center border=0>
				<TBODY>
					<TR>
						<TD height=25>
							<TABLE cellSpacing=0 cellPadding=2 border=0>
								<form id="customerForm" name="customerForm" action="${pageContext.request.contextPath }/customer_pageList.action"
									method="post">
									<TBODY>
										<!-- 隐藏域，当前页码  -->
										<input type="hidden" id="currentPageInput" name="currentPage" value="<s:property value='#pageBean.currentPage' />"  />
										<!-- 隐藏域，每页显示条数  -->
										<input type="hidden" id="PageSizeInput"  name="pageSize" value="<s:property value='#pageBean.pageSize' />" />
										<TR>
											<TD>客户名称：</TD>
											<TD>
												<INPUT class=textbox id=sChannel2 value="${param.cust_name }" style="width: 160px;height:25px; font-size:20px; text-indent:5px;" maxLength=50 name="cust_name" />
											</TD>
											<TD>
												<INPUT class=button id=sButton2 type="submit" style="width:60px;height:30px;" value="筛 选 " />
											</TD>
										</TR>
									</TBODY>
								</form>
							</TABLE>
						</TD>
					</TR>
					
					<TR>
						<TD>
							<TABLE id=grid
								style="BORDER-TOP-WIDTH: 0px; text-align:center; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
								cellSpacing=1 cellPadding=2 rules=all border=0>
								<TBODY>
									<TR
										style="FONT-WEIGHT:bold; FONT-STYLE:normal; BACKGROUND-COLOR:#eeeeee; TEXT-DECORATION:none">
										<TD>客户名称</TD>
										<TD>信息来源</TD>
										<TD>客户级别</TD>
										<TD>客户所属行业</TD>
										<TD>联系人</TD>
										<TD>固定电话</TD>
										<TD>移动电话</TD>
										<TD>联系地址</TD>
										<TD>客户传真</TD>
										<TD>客户网址</TD>
										<TD>操作</TD>
									</TR>
									<s:iterator value="#pageBean.list" var="cust">
									<TR
										style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
										<TD><s:property value="#cust.cust_name"/></TD>
										
										<TD><s:property value="#cust.cust_source.dict_tz_name"/></TD>
										<TD><s:property value="#cust.cust_industry.dict_tz_name"/></TD>
										<TD><s:property value="#cust.cust_level.dict_tz_name"/></TD>
										
										<TD><s:property value="#cust.cust_linkman"/></TD>
										<TD><s:property value="#cust.cust_phone"/></TD>
										
										<TD><s:property value="#cust.cust_mobile"/></TD>
										<TD><s:property value="#cust.cust_Address"/></TD>

										<TD><s:property value="#cust.cust_Fax"/></TD>
										<TD><s:property value="#cust.cust_Website"/></TD>
										<TD>
										<a style="font-size:18px;" href="${pageContext.request.contextPath }/customer_updateCustomer?cust_id=<s:property value="#cust.cust_id"/>">修改</a>
										&nbsp;&nbsp;
										<a style="font-size:18px;"  href="${pageContext.request.contextPath }/customer_delete?cust_id=<s:property value="#cust.cust_id"/>">删除</a>
										</TD>
									</TR>
									</s:iterator>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					
					<TR>
						<TD>
							<SPAN id=pagelink>
								<DIV style="line-height:20px; margin-top:10px; font-size:18px; height:20px; TEXT-ALIGN: right">
									共[<B style="font-size:18px;"> <s:property value="#pageBean.totalCount"/> </B>]条记录,
									共[<B style="font-size:18px;"> <s:property value="#pageBean.totalPage"/> </B>]页
									,每页显示     
									<select name="pageSize"  style="font-size:18px;" onchange="changPageSize($('#pageSizeSelect option:selected').val())" id="pageSizeSelect" >
										<option value="5" <s:property value="#pageBean.pageSize == 5 ?'selected':''"/> >5</option>
										<option value="10" <s:property value="#pageBean.pageSize == 10 ?'selected':''"/>>10</option>
									</select>
									条
									[<A style="font-size:18px;" onclick="pageForm(<s:property value="#pageBean.currentPage-1"/>)" href="javascript:void(0)">前一页</A>]
									<B> <s:property value="#pageBean.currentPage"/> </B>
									[<A style="font-size:18px;" onclick="pageForm(<s:property value="#pageBean.currentPage+1"/>)" href="javascript:void(0)" >后一页</A>] 
									到
									<input type="text"class="current"size="3" maxLength=5  id="page"  value="" />
									页
									<input type="button" style="height:25px;  width:50px; font-size:18px;" onclick="pageForm($('#page').val())" value="Go"/>
								</DIV>
							</SPAN>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</TD>
	</TR>
	</TBODY>
	</TABLE>
		
</BODY>
</HTML>