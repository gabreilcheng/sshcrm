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
    <link rel="stylesheet" type="text/css" href="css/index.css"" />
    <style>
        ul, ol { list-style: none;}
        a {border: none;text-decoration: none;color: inherit;}
        * {margin: 0;padding: 0;}
        body{
            width:100%;height:100%;
        }
        .clearfix:after{content: '';display: block;clear: both;}
        .fl-L{ float:left;}
        .fl-R{ float:right;}
        div{
            background-color: rgba(238,238,238,0.98);
        }
        .easyui-linkbutton{
            background: #cccccc; height: 30px; line-height: 30px;
            width:190px; font-size: 18px;
        }
    </style>
    <title>人力管理系统</title>
</head>
<body>
<div id="divBody" class="easyui-layout" style="height:1000px;">
    <!-- 上 -->
    <div data-options="region:'north',border:false" style="height:60px;">
		<div class="Tlogin">
			<span>人力资源管理系统</span>
		</div>
    </div>
    <!-- 中 左 -->
    <div id="divWest" class="easyui-accordion  "  data-options="region:'west',border:false ,split:true" title="菜单栏" style="width:200px;">
        <div title="客户管理" >
            <!-- data-options="selected:true" 设置默认打开的折叠面板-->
            <ul>
                <li><a class="easyui-linkbutton" data-title="新增客户" onclick="addTab('新增客户','customer/customer_add.jsp')" href="javascript:void(0)">新增客户</a></li>
                <li><a class="easyui-linkbutton" data-title="客户列表" onclick="addTab('客户列表','customer_pageList.action')" href="javascript:void(0)">客户列表</a></li>
            </ul>
        </div>

        <div title="联系人管理">
            <ul>
                <li><a class="easyui-linkbutton" data-title="新增联系人" onclick="addTab('新增联系人','linkman/linkman_add.jsp')" href="javascript:void(0)"> 新增联系人</a></li>
                <li><a class="easyui-linkbutton" data-title="联系人列表" onclick="addTab('联系人列表','linkman_pageList.action')" href="javascript:void(0)"> 联系人列表</a></li>
            </ul>
        </div>
        <div title="客户拜访管理">
            <ul>
                <li><a class="easyui-linkbutton" data-title="新增客户拜访" onclick="addTab('新增客户拜访','salevisit/salevisit_add.jsp')" href="javascript:void(0)"> 新增客户拜访</a></li>
                <li><a class="easyui-linkbutton" data-title="客户拜访列表" onclick="addTab('客户拜访列表','salevisit_pageList')" href="javascript:void(0)"> 客户拜访列表</a></li>
            </ul>
        </div>
       <!--  <div title="综合查询">
            <ul>
                <li><a class="easyui-linkbutton"  data-title="客户贡献分析" onclick="addTab('客户信息','login.html')" href="javascript:;"> 客户信息查询</a></li>
                <li><a class="easyui-linkbutton" data-title="客户贡献分析" onclick="addTab('联系人信息','login.html')" href="javascript:;"> 联系人信息查询</a></li>
                <li><a class="easyui-linkbutton" data-title="客户贡献分析" onclick="addTab('客户拜访记录','login.html')" href="javascript:;"> 客户拜访记录查询</a></li>
            </ul>
        </div> -->
        <div title="统计分析">
            <ul>
                <li><a class="easyui-linkbutton" data-title="行业统计" onclick="addTab('行业统计','customer_getIndustyCount')" href="javascript:;"> 客户行业统计</a></li>
                <li><a class="easyui-linkbutton" data-title="产品信息" onclick="addTab('来源统计','customer_getSourceCount')"href="javascript:;"> 客户来源统计</a></li>
            </ul>
        </div>
        <div title="系统管理">
            <ul>
                <li><a class="easyui-linkbutton" data-title="添加角色"  onclick="addTab('新建职位','user/addRole.jsp')"href="javascript:void(0)"> 添加角色</a></li>
                <li><a class="easyui-linkbutton" data-title="角色列表" onclick="addTab('角色列表','role_pageList')" href="javascript:void(0)"> 角色列表</a></li>
                <li><a class="easyui-linkbutton" data-title="用户列表" onclick="addTab('用户列表','')" href="javascript:void(0)"> 用户列表</a></li>
            </ul>
        </div>
       <!--  <div title="系统管理">
            <a class="easyui-linkbutton" onclick="addTab('login','login.html')" href="javascript:void(0)">管理员列表</a>
            <a class="easyui-linkbutton" onclick="addTab('easyui','login.html')" href="javascript:void(0)">系统注意事项</a>
            <a class="easyui-linkbutton" onclick="addTab('index','index.html')" href="javascript:void(0)">easyui</a>
        </div> -->
    </div>
    <!-- 中 右 -->
   <div id="tt" class="easyui-tabs" style="width:100%;height:90%;" data-options="region:'center',border:false">
       <div title="Home" data-options="border:false,title:'我的桌面'" style="background:url('images/admin/admin-login-bg.jpg');"></div>
   </div>
   <div class="lg_un">
   		<b>
   			<c:if test="${user!=null}" var="nouser">
   				<span>你好,<b>${sessionScope.user.user_code}</b></span>
   				<a href="userEdit.jsp">修改</a>
   			</c:if>
   			<c:if test="${!nouser}">
   				<a href="login.jsp">登录</a>
   			</c:if>
   		</b> | <b><a href="${pageContext.request.contextPath }/user_nologin">注销</a></b>
   </div>

    <script>

    $('#divWest').resizable({
        disabled:false,
        maxWidth:200
    });
    $('#divWest').accordion({
        collapsible: true
    });
    function addTab(title, url){
        if ($('#tt').tabs('exists', title)){
            $('#tt').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tt').tabs('add',{
                title:title,
                content:content,
                closable:true
            });
        }
    };
    window.onload=function(){
		if(window.parent != window){// 如果是在框架中
			window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
		}
	};

    </script>
</body>
</html>