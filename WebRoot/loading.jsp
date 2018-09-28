<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>潭州后台-登录</title>
	<!-- //引入 jQuery 核心库，这里采用的是 2.0-->
    <script type="text/javascript" src="jquery-easyui-1.5.5.6/jquery.min.js"></script>
    <!--//引入 jQuery EasyUI 核心库，这里采用的是 1.3.6-->
    <script type="text/javascript" src="jquery-easyui-1.5.5.6/jquery.easyui.min.js"></script>
    <!--//引入 EasyUI 中文提示信息-->
    <script type="text/javascript" src="jquery-easyui-1.5.5.6/locale/easyui-lang-zh_CN.js"></script>
    <!--//引入 EasyUI 核心 UI 文件 CSS-->
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.5.6/themes/default/easyui.css" />
    <!-- //引入 EasyUI 图标文件-->
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.5.6/themes/icon.css" />
	<script type="text/javascript">
		window.onload=function(){
			if(window.parent != window){// 如果是在框架中
				//就让框架页面跳转到登陆页面
				window.parent.location.href = "${pageContext.request.contextPath}/login.jsp";
			}
		};
	</script>
    <style>
        ul, ol { list-style: none;}
        a {border: none;text-decoration: none;color: inherit;}
        }d
    </style>
</head>
<body>
</body>
</html>