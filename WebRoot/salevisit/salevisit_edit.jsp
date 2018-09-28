<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<TITLE>添加联系人</TITLE> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- //引入ajax 加载下拉选-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/myBaseDict.js"></script>
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
	<link href="${pageContext.request.contextPath }/css/calendar.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath }/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/es6.js"></script>

<style>
	body{
		height:90%;
	}
	.iTable{
		margin:40px 100px;
		border:1 red solid;
		
	}
	
	.iTable td{
		text-align: right;
	}
	
	.iTable input{
		height:40px;
		width:300px;	
		text-indent:10px;	
		font-size:20px;
		 background:none;
		 border:0;
		 border-bottom: 2px #000 solid;
	}
	.iTable TR{
		height:80px;
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
	.btn_customer{
		background:#CDC5BF;
		transition:1s;
	}
	.btn_customer:hover{
		background:#000;
		color:#fff;
	}
	#btnSubmit{
		background:#000; width:200px;height:50px;margin-right:40px; margin-top:10px; color:#fff;transition:1s;
	}
	#btnSubmit:hover{
		background:#006400;
		color:#EE0000;
	}
</style>
</HEAD>
<BODY>
	<TABLE cellSpacing="0" cellPadding="5" border="0"  class="iTable">
		<form action="${pageContext.request.contextPath }/salevisit_update.action" method="post">
			<TR>
				<td>所属客户：</td>
				<td>
					<input type="hidden" name="customer.cust_id" id="custId" value="${saleV.customer.cust_id }" />
					<!-- 用户id不需要设置 因为能进到action就表示已经登录了 所以我们在后台取得当前用户的id  -->
					<input type="hidden" name="user.user_id" value="${saleV.user.user_id }" />
					<input type="hidden" name="visit_id" value="${saleV.visit_id }" />
					<input type="text"  id="custName" value="${saleV.customer.cust_name }" disabled="disabled"/>
				</td>
				<td style="width:150px; text-align: left; ">
					<input type="button" class="btn_customer" style="width:100px;text-indent:0px;" id="nameDiv" value="选择客户"/>
				</td>
			</TR>
			<TR>
				<td>拜访时间 ：</td>
				<td>
					<INPUT id="visit_time" placeholder="格式:2018-08-22" type="text" maxLength="50" name="visit_time" value="${saleV.visit_time }" > 
				</td>
				<td></td>
			</TR>
			<TR>
				<td>被拜访人 ：</td>
				<td >
					<INPUT type="text" maxLength="50" name="visit_interviewee" value="${saleV.visit_interviewee }" autocomplete="off" disableautocomplete>
				</td>
				<td></td>
			</TR>
			<TR>
				<td>拜访地址：</td>
				<td>
					<INPUT type="text" maxLength="50" name="visit_addr" value="${saleV.visit_addr }" autocomplete="off" disableautocomplete>
				</td>
				<td></td>
			</TR>
			<TR>
				<td>拜访详情 ：</td>
				<td colspan="2" >
					<textarea name="visit_detail" style="text-align: left; resize: none; font-size:18px;" rows="9" cols="49" maxlength="200" placeholder="最多两百字">${saleV.visit_detail }</textarea>
					<!-- <INPUT maxLength=50 name="visit_detail" value=""> -->
				</td>
				
			</TR>
			<TR>
				<td>下次拜访时间：</td>
				<td>
					<INPUT type="text" maxLength="50" placeholder="格式:2018-08-22" name="visit_nexttime" value="${saleV.visit_nexttime }"> 
				</td>
				<td></td>
			</TR>
			<tr>
				<td></td>
				<td >
					<INPUT id="btnSubmit" type="submit" value="保存 " />
				</td>
				<td></td>
			</tr>
		</form>
	</TABLE>
	
	<!-- 客户修改 打开一个窗口 -->
	<div class="easyui-dialog" id="custDiv" title="所属客户"
		style="width: 800px; height: 500px; max-width: 800px;"
		data-options="
			iconCls:'icon-save',
			onResize:function(){
				$(this).dialog('center');
			},closed:true">
		<div style="height:400px;">	
		<TABLE cellSpacing="0" cellPadding="5" border="1" id="name_Div" >
		</TABLE>
		</div>
		<div class="div_submit">
			<input type="button" value="上一页"/>
			<input type="button" value="下一页"/>
		</div>
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
			   $.post("${pageContext.request.contextPath }/customer_custAjax", 
			   function(data){
				   //遍历
				   $.each(data,function(i,json){
					   //console.log(json['cust_id']+","+json['cust_name']);
					   var $option = $("<TR><TD>"+json['cust_id']+"</TD><TD>"+json['cust_name']+"</TD><TD>"+json['cust_linkman']+"</TD><TD>"+json['cust_phone']+"</TD><TD>"+json['cust_Website']+"</TD><TD><input type='button' value='确认' onclick=custSubmit('"+json['cust_name']+"',"+json['cust_id']+") style='width:100px;height:30px; font-size:20px; border:0;' /></TD></TR>");
					   $("#name_Div").append($option);	   
				   });
			   },"json");
			   //点击弹窗
				$("#custDiv").window("open");		   
		   };
		   
		   $('#singleDateRange').val(<s:property value="#sale.visit_time"/>);
		   $('#modalmode').val(<s:property value="#sale.visit_nexttime"/>);
		});
	</script>
	
</BODY>
</HTML>
    