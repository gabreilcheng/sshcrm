<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<TITLE>添加客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.5.6/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/myBase.js""></script>
<style type="text/css">
	#iTable{
		margin:10px 0px;
		border:0px;
	}
	#iTable td{
		text-align: right;
	}
	
	#iTable input{
		height:35px;
		width:250px;	
		text-indent:10px;	
		font-size:20px;
	}
	#iTable TR{
	}
	#sButton2{
		width:150px;
		height:35px;
		font-size:25px;
		
	}
	

</style>
<script type="text/javascript">
	
	$(document).ready(function(){
		loadselect("006","industry","cust_industry.dict_id");
		loadselect("002","source","cust_source.dict_id");	 
		loadselect("001","level","cust_level.dict_id");	
	});
	
</script>


<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<TABLE cellSpacing=0 cellPadding=0 width="98%" border="0" >
		<TBODY>
			<TR>
				<TD vAlign=top width="100%" bgColor=#ffffff>
					<form id=form1 name=form1                                
						action="${pageContext.request.contextPath }/customer_saveAll"
						method=post>
					<TABLE cellSpacing=0 cellPadding=5 id="iTable">
						<TR>
							<td style="width:166px;">客户名称:</td>
							<td>
								<INPUT class=textbox  maxLength=50 name="cust_name" />
							</td>
							<td style="width:166px;">客户级别:</td>
							<td id="industry">
							</td>
						</TR>
						<TR>
							<td>信息来源:</td>
							<td id="source">
							</td>
							<td>联系人:</td>
							<td>
								<INPUT class=textbox maxLength=50 name="cust_linkman" />
							</td>
						</TR>
						<TR>
							<td>固定电话:</td>
							<td>
								<INPUT class=textbox maxLength=50 name="cust_phone" />
							</td>
							<td>移动电话:</td>
							<td>
								<INPUT class=textbox maxLength=50  name="cust_mobile" />
							</td>
						</TR>
						<TR>
							<td>联系地址:</td>
							<td>
								<INPUT class=textbox maxLength=50 name="cust_Address" />
							</td>
							<td>客户所属行业:</td>
							<td id="level">
							</td>
						</TR>
						<TR>
							<td>客户传真:</td>
							<td>
								<INPUT class=textbox maxLength=50 name="cust_Fax" />
							</td>
							<td>客户网址:</td>
							<td>
								<INPUT class=textbox maxLength=50 name="cust_Website" />
							</td>
						</TR>
						<tr>
							<td></td>
							<td colspan="2">
								<INPUT style="margin-right:90px; font-size:28px; height:45px;" class=button id=sButton2 type=submit value="保 存 " >
							</td>
							<td></td>
						</tr>
					</TABLE>
					</form>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</BODY>
</HTML>
