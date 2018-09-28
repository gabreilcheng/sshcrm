<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<TITLE>客户列表</TITLE>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

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
	
<style type="text/css">
#mask {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .3);
	z-index: 100;
}


</style>
</HEAD>
<BODY>
	
	<TABLE id=grid
		style="BORDER-TOP-WIDTH: 0px; text-align: center; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
		cellSpacing=1 cellPadding=2 rules=all border=0>
			<TR
				style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
				<TD>客户来源</TD>
				<TD>统计数量</TD>
			</TR>
			<s:iterator value="#sourceCount" var="arr">
				<TR
					style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
					<TD><s:property value="#arr[0]" /></TD>
					<TD><s:property value="#arr[1]" /></TD>
				</TR>
			</s:iterator>
	</TABLE>
</BODY>
</HTML>