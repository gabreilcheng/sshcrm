<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<TITLE>客户拜访记录列表</TITLE> 
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
	
<SCRIPT language=javascript>
	function pageForm(pageName){
		$('#currentPageInput').val(pageName);
		$('#linkManForm').submit();
	}
	function changPageSize(pageSize){
		$('#PageSizeInput').val(pageSize);
		$('#linkManForm').submit();
	}
</SCRIPT>
<style type="text/css">
	#grid{
		BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; 
		BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; 
		BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; 
		FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px;
		TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
	
	}
	.textbox{
		width:150px; height:30px; text-indent: 5px;
	}
	#submitBtn{
		width:60px; height:30px; border:0;
	}
</style>
</HEAD>
<BODY>
	
		<TBODY>
			<FORM id="linkManForm"
			action="${pageContext.request.contextPath }/salevisit_pageList.action" method="post">
			<TR style="margin:10px;">
				<TD>被拜访人：</TD>
				<TD>
					<INPUT class="textbox" name="visit_interviewee" value="${param.visit_interviewee }">
					<input type="button" value="请选择" />
				</TD>
				<TD>
					<INPUT id="submitBtn" type="submit" value=" 筛 选  ">
				</TD>
			</TR>
		    <!-- 隐藏域，当前页码  -->
			<input type="hidden" id="currentPageInput" name="currentPage"
				value="<s:property value='#pageBean.currentPage' />" />
			<!-- 隐藏域，每页显示条数  -->
			<input type="hidden" id="PageSizeInput" name="pageSize"
				value="<s:property value='#pageBean.pageSize' />" />
			</FORM>
			<TR>
				<TD>
					<TABLE id="grid" cellSpacing="1" cellPadding="2" rules="all" border=0>
						<TBODY style="text-align: center;">
							<TR
								style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
								<TD>所属客户</TD>
								<TD>被拜访人</TD>
								<TD>拜访时间</TD>
								<TD>拜访地址</TD>
								<TD>拜访详情</TD>
								<TD>下次拜访时间</TD>
								<TD>操作</TD>
							</TR>
							<s:iterator value="#pageBean.list" var="sale">
								<TR
									style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
									<TD><s:property value="#sale.customer.cust_name" /></TD>
									<TD><s:property value="#sale.visit_interviewee" /></TD>
									<TD><s:property value="#sale.visit_time"/></TD>
									<TD><s:property value="#sale.visit_addr" /></TD>
									<TD><s:property value="#sale.visit_detail" /></TD>
									<TD><s:property value="#sale.visit_nexttime" /></TD>
									<TD>
										<a style="font-size: 18px;" 
										href="${pageContext.request.contextPath }/salevisit_updateShow?visit_id=<s:property value="#sale.visit_id" />">修改</a> &nbsp;&nbsp;
										<a style="font-size: 18px;" 
										href="${pageContext.request.contextPath }/salevisit_delete.action?visit_id=<s:property value="#sale.visit_id" />">删除</a>
									</TD>
								</TR>
							</s:iterator>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD><SPAN id=pagelink>
					<DIV
						style="line-height: 20px; margin-top: 10px; font-size: 18px; height: 20px; TEXT-ALIGN: right">
						共[<B style="font-size: 18px;"> <s:property
								value="#pageBean.totalCount" />
						</B>]条记录, 共[<B style="font-size: 18px;"> <s:property
								value="#pageBean.totalPage" />
						</B>]页 ,每页显示 <select name="pageSize" style="font-size: 18px;"
							onchange="changPageSize($('#pageSizeSelect option:selected').val())"
							id="pageSizeSelect">
							<option value="5"
								<s:property value="#pageBean.pageSize == 5 ?'selected':''"/>>5</option>
							<option value="10"
								<s:property value="#pageBean.pageSize == 10 ?'selected':''"/>>10</option>
						</select> 条 [<A style="font-size:18px;" onclick="pageForm(<s:property value="#pageBean.currentPage-1"/>)"
							href="javascript:void(0)">前一页</A>] <B> <s:property
								value="#pageBean.currentPage" />
						</B> [<A style="font-size: 18px;" onclick="pageForm(<s:property value="#pageBean.currentPage+1"/>)"
							href="javascript:void(0)">后一页</A>] 到 <input type="text"
							class="current" size="3" maxLength=5 id="page" value="" /> 页
						<input type="button"
							style="height: 25px; width: 50px; font-size: 18px;"
							onclick="pageForm($('#page').val())" value="Go" />
					</DIV>
				</TD>
				</TD>
			</TR>
		</TBODY>
	
</BODY>
</HTML>
    