<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<TITLE>添加联系人</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	

<style>
	.iTable{
		margin:10px 200px;
		border:1;
	}
	
	.iTable td{
		text-align: right;
	}
	
	.iTable input{
		height:35px;
		width:250px;	
		text-indent:10px;	
		font-size:20px;
	}
	.iTable TR{
	}
	#sButton2{
		width:150px;
		height:35px;
		font-size:25px;
	}
	i{
		border:1px red solid;
		line-height: 20px;
	}
	#name_Div{
		margin:20px;
	}
	#name_Div td{
		width:129px;
		 text-align:center;
	}
	#name_Div input{
		width:100px;height:30px; font-size:20px; border:0;
	}

	.div_submit{
		border:1px red solid; width:420px; height:30px;
		margin:0px auto; 
	}
	.div_submit input{
			width:100px;
			height:30px;
			font-size:20px;
			margin:0px 50px;
			line-height:30px;
			border:0;
	}
</style>
</HEAD>
<BODY>
	
	<FORM id=form1 name=form1
		action="${pageContext.request.contextPath }/linkman_update.action"
		method="post">
		<div>
		<input type="hidden" name="lkm_id" value="${linkMan.lkm_id}"/>
		<TABLE cellSpacing="0" cellPadding="5" class="iTable">
			<tr>
				<td style="width:200px;">联系人姓名：</td>
				<td style="width:300px; text-align:left;">
					<input type="text" name="lkm_name" value="${linkMan.lkm_name }" />
				</td>
				<td style="width:200px;">所属客户：</td>
				<td style="width:300px; text-align:left;">
					<input type="hidden" id="custId" name="customer.cust_id" value="${linkMan.customer.cust_id }"   />
					<input type="text" id="custName"  style="WIDTH: 150px"  value="${linkMan.customer.cust_name }" disabled placeholder="请选择" />
					<input type="button" style="width:100px; height:42px; border:0;"id="nameDiv"  value="选择" />
				</td>
			</tr>
			<tr>
				<td>联系人备注：</td>
				<td style="text-align:left;">
					<INPUT class="textbox" maxLength="50" name="lkm_memo" value="${linkMan.lkm_memo }">
				</td>
				<td>联系人性别：</td>
				<td style="text-align:left;">
				
					<input style="width:20px;" <c:if test="${linkMan.lkm_phone==1 }">checked</c:if> type="radio"  value="1" name="lkm_gender" ><i>男</i>
					<input style="width:20px;" <c:if test="${linkMan.lkm_phone==2 }">checked</c:if> type="radio" value="2" name="lkm_gender" ><i>女</i>
				</td>
			</tr>
			<tr>
				<td>联系人办公电话 ：</td>
				<td style="text-align:left;">
					<INPUT class="textbox" maxLength="50" name="lkm_phone" value="${linkMan.lkm_phone }">
				</td>
				<td>联系人手机 ：</td>
				<td style="text-align:left;">
					<INPUT class="textbox" maxLength="50" name="lkm_mobile" value="${linkMan.lkm_mobile }">
				</td>
			</tr>
			<tr>
				<td>联系人邮箱 ：</td>
				<td style="text-align:left;">
					<INPUT class="textbox" maxLength="50" name="lkm_email" value="${linkMan.lkm_email }">
				</td>
				<td>联系人qq ：</td>
				<td style="text-align:left;">
					<INPUT class="textbox" maxLength="50" name="lkm_qq" value="${linkMan.lkm_qq }">
				</td>
			</tr>
			<tr>
				<td>联系人职位 ：</td>
				<td style="text-align:left;">
					<INPUT class="textbox" maxLength="50" name="lkm_position" value="${linkMan.lkm_position }">
				</td>
				<td>联系人图片：</td>
				<td style="text-align:left;">
					省略
					<!-- <INPUT class="textbox" maxLength="50" name="lkmMobile"> -->
				</td>
			</tr>
			
		</TABLE>
		<div style="border:1px red solid; margin:10px 500px; width:150px; height:40px; ">
			<INPUT style="width:150px; height:40px;font-size:20px; " class="button" type="submit" value="保存 " >
		</div>
					
	</div>		
	</FORM>
	
	<!-- 客户修改 打开一个窗口 -->
	<div class="easyui-dialog" id="custDiv" title="所属客户"
		style="width: 800px; height: 400px; max-width: 800px;"
		data-options="
			iconCls:'icon-save',
			onResize:function(){
				$(this).dialog('center');
			},closed:true">
		<div style="height:340px;overflow-y:auto;">	
		<TABLE cellSpacing="0" cellPadding="5" border="1" id="name_Div" >
			<!-- <TR style="">
				<TD>tz</TD>
				<TD>信息来源</TD>
				<TD>客户级别</TD>
				<TD>客户所属行业</TD>
				<TD>联系人</TD>
				<TD><input type="button" value="确认" onclick="custSubmit('1','tz')" style="width:100px;height:30px; font-size:20px; border:0;" /></TD>
			</TR> -->
		</TABLE>
		</div>
		<!-- <div class="div_submit">
			<input type="button" value="上一页"/>
			<input type="button" value="下一页"/>
		</div> -->
	</div>
	
	<script type="text/javascript">
	//点击确认按钮
	function custSubmit(custName,custId){
		//点击确认键 ，将值赋值到custId value上
		$("#custId").val(custId);
		$("#custName").val(custName);
		//点击确认后，关闭当前窗口
		$('#custDiv').window('close');
	}
	//nameDiv
	$(document).ready(function(){
	  // 在这里写你的代码...\\
	   var nameDiv = document.getElementById("nameDiv");
	   nameDiv.onclick = function(){
			//问题：因为连续点击 出现数据叠加     删除
			$("#name_Div").empty();		   
		   var $topTr = $("<TR><TD>id</TD><TD>客户名称</TD><TD>联系人</TD><TD>规定电话</TD><TD>客户网址</TD><TD>操作</TD></TR>");
		   $("#name_Div").append($topTr);
		   //异步请求
		   $.get("${pageContext.request.contextPath }/customer_custAjax", 
		   function(data){
			   //遍历
			   $.each(data,function(i,json){
				   //console.log(json['cust_id']+","+json['cust_name']);
				   var $option = $("<TR><TD>"+json['cust_id']+"</TD><TD>"+json['cust_name']+"</TD><TD>"+json['cust_linkman']+"</TD><TD>"+json['cust_phone']+"</TD><TD>"+json['cust_Website']+"</TD><TD><input type='button' value='确认' onclick=custSubmit('"+json['cust_name']+"',"+json['cust_id']+") style='width:100px;height:30px; font-size:20px; border:0;' /></TD></TR>");
				   $("#name_Div").append($option);	   
			   })
		   },"json");
		   //点击弹窗
			$("#custDiv").window("open");		   
		   
	   }
	});
	</script>
	 
	 
	
</BODY>
</HTML>
