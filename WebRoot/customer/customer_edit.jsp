<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!doctype html>
<html>
<head>
<TITLE>添加客户</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- //引入ajax 加载下拉选-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/myBase.js""></script>	
    <!-- //引入 jQuery 核心库，这里采用的是 2.0-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.5.6/jquery.min.js"></script>
	<!--//引入 jQuery EasyUI 核心库，这里采用的是 1.3.6-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.5.6/jquery.easyui.min.js"></script>
	<!--//引入 EasyUI 中文提示信息-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-easyui-1.5.5.6/locale/easyui-lang-zh_CN.js"></script>
	<!--//引入 EasyUI 核心 UI 文件 CSS-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.5.5.6/themes/default/easyui.css" />
	<!-- //引入 EasyUI 图标文件-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jquery-easyui-1.5.5.6/themes/icon.css" />
	
	<script>
	$(document).ready(function(){
		  // 在这里写你的代码...
		loadselect("006","industry","cust_industry.dict_id",<s:property value='#customer.cust_industry.dict_id' />);  
		loadselect("002","source","cust_source.dict_id",<s:property value='#customer.cust_source.dict_id' />);		 
		loadselect("001","level","cust_level.dict_id",<s:property value='#customer.cust_level.dict_id' />); 
		
		$('select').change(function(){ 
			/* alert($(this).children('option:selected').val()); */
			var id =$(this).children('option:selected').val();
			if($(this).parent().is("#industry")){
				$('.industry').val(id);
			}
			if($(this).parent().is("#source")){
				$('.source').val(id);
			}
			if($(this).parent().is("#level")){
				$('.level').val(id);
			}
		}); 
	});
		
		//点击submitName选择按钮触发一个窗口
		function submitName(){
			$('#custDiv').window('open'); 
		}
	</script>
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
	.cust_div{
		width:150px;
		height:40px;
		font-size:26px;
		margin:40px;
		border:0;
	}
</style>

</HEAD>
<BODY>
	<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
		<TBODY>
			<TR>
			<FORM name="form1" action="${pageContext.request.contextPath }/customer_update" method="post">
				<!-- id隐藏  -->
				<input type="hidden" name="cust_id" value="${customer.cust_id }"/>
				<input type="hidden" class="industry" name="cust_industry.dict_id" value="${customer.cust_industry.dict_id}"/>
				<input type="hidden" class="source" name="cust_source.dict_id" value="${customer.cust_source.dict_id}"/>
				<input type="hidden" class="level" name="cust_level.dict_id" value="${customer.cust_level.dict_id}"/>
				<TABLE cellSpacing=0 cellPadding=5 id="iTable">
					<TR>
						<%-- <td style="width:166px;">客户名称:</td>
						<td>
							<INPUT style="width:150px" maxLength="50" value="${customer.cust_name }" name="cust_name" />
							<input style="width:90px;height:40px;line-height: 40px;" onclick="submitName()" type="button" value="选择" />
						</td> --%>
						<td style="width:166px;">客户名称:</td>
						<td>
							<INPUT maxLength="50" value="${customer.cust_name }" name="cust_name" />
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
							<INPUT maxLength=50 name="cust_linkman" value="${customer.cust_linkman  }" />
						</td>
					</TR>
					<TR>
						<td>固定电话:</td>
						<td>
							<INPUT maxLength=50 name="cust_phone" value="${customer.cust_phone  }"/>
						</td>
						<td>移动电话:</td>
						<td>
							<INPUT maxLength=50  name="cust_mobile" value="${customer.cust_mobile  }" />
						</td>
					</TR>
					<TR>
						<td>联系地址:</td>
						<td>
							<INPUT maxLength=50 name="cust_Address" value="${customer.cust_Address  }" />
						</td>
						<td>客户所属行业:</td>
						<td id="level">
							 
						</td>
					</TR>
					<TR>
						<td>客户传真:</td>
						<td>
							<INPUT maxLength=50 name="cust_Fax" value="${customer.cust_Fax  }" />
						</td>
						<td>客户网址:</td>
						<td>
							<INPUT maxLength=50 name="cust_Website" value="${customer.cust_Website  }" />
						</td>
					</TR>
					<tr>
						<td></td>
						<td colspan="2">
							<INPUT style="margin-right:90px; font-size:28px; height:45px;" class=button id=sButton2 type=submit value=" 更 新  " name=sButton2>
						</td>
						<td></td>
					</tr>
				</TABLE>
				</FORM>
			</TR>
		</TBODY>
	</TABLE>

	
	<!-- 客户修改 打开一个窗口 -->
	<!-- <div class="easyui-dialog" id="custDiv" title="所属客户"
		style="width: 800px; height: 500px; max-width: 800px;"
		data-options="
			iconCls:'icon-save',
			onResize:function(){
				$(this).dialog('center');
			},closed:true">
		
	</div>
	 -->
	
</BODY>
</HTML>
