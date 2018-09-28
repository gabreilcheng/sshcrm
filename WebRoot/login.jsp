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
        * {margin: 0;padding: 0;}
        .clearfix:after{content: '';display: block;clear: both;}
        .fl-L{ float:left;}
        .fl-R{ float:right;}
        #login_top{
            height:70px;
            width:100%;
            background:#426374 ;
            position: absolute;
            left: 0;
            right: 0;
            z-index: 99;
        }
        #login_top img{
            height:70px;
        }

        #login_center{
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
            bottom: 0;
            right: 0;
            z-index: 1;
            background: #3283AC url(images/admin/admin-login-bg.jpg) no-repeat center;
        }
        #login_center .login_form{
            position: absolute;
            width: 617px;
            height: 330px;
            background: url(images/admin/admin-loginform-bg.png) no-repeat;
            left: 50%;
            top: 50%;
            margin-left: -309px;
            margin-top: -184px;
            padding-top: 38px;
        }
        #login_table td{
            padding-top: 15px;
        }
        input{
            margin-left: 10px;
        }
        #login_table .btn_login{
            width: 80px;
            height: 40px;
            margin-left: 20px;
            border: 0;
            color: #ffffff;
            font-size: 18px;
            background:	#008B00;
        }
        #login_table .btn_login:hover{
            background:#00EE00;
        }

        #login_table .admin-tb{
            width: 45px;
        }

        #login_table .btn_che{
            margin-left: 10px;
        }
        .input-text{
            width: 300px;
            font-size: 18px;
            text-indent:5px;

            height: 41px;
        }
        #login_button{
            position: fixed;
            bottom:0;
            right: 0;
            width: 100%;
            z-index: 99;
            border-top: 1px solid #e8e8e8;
            padding: 10px 0;
            font-family: tahoma,Arial;
            height: 30px;
            line-height: 30px;
            text-align: center;
            color: #fff;
            font-size: 18px;
            background-color: #426374;
        }
		.div_submit{
			width:425px;
			height:50px;
			margin:0px auto;
		}
		.div_submit input{
			width:150px;
			height:45px;
			font-size:24px;
			color:#000000;
			margin:0px 25px;
			border:0;
			
		}
		#div_input{
			color:#fff;
		
		}
		
		.input-is{
			color:#fff;
			font-size:20px;
			width:300px;background:none; border:0;border-bottom: 2px #fff solid;
			text-indent: 10px;
		}
		
		/* 设置placeholder字体颜色  */
		.input-is::-webkit-input-placeholder { /* WebKit browsers */ 
			color: #D5CACA; 
		} 
		
		.input-is:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ 
			color: #D5CACA; 
		} 
		.input-is::-moz-placeholder { /* Mozilla Firefox 19+ */ 
			color: #D5CACA; 
		} 
		.input-is:-ms-input-placeholder { /* Internet Explorer 10+ */ 
			color: #D5CACA; 
		} 
		.window-shadow{
			border:0px;
		}
		.panel{
			border:0px;
			background:#000;
		}
		.div_submit input{
			background:none;
			color:#fff;
			border-bottom:1px #fff solid;
		}
		.div_submit input:hover{
			border:1px #E8E3E3 solid;
			background:;
		}
		#login_top{text-align: center;}
		#login_top span {font-size:32px; 
			color:white; font-weight:bold; 
			line-height:70px;text-align: center;
			letter-spacing: 4px;font-family: "宋体";
		}
    </style>
</head>
<body>
<div id="login_top">
    <img alt="" src=""  />
    <span >登录页面</span>
</div>
<div id="login_center">
    <div class="login_form">
        <form action="${pageContext.request.contextPath }/user_login" method="post">
            <table id="login_table" border="0">
                <tr>
                    <td style="width: 150px; text-align:right;"><img class="admin-tb" src="images/admin/admin-user.png"></td>
                    <td style="width: 300px;"><input name="user_code" id="user_codeForm" type="text" onblur="loginForm()" placeholder="账户" class="input-text"></td>
                    <td class="user_codeFormTd" style="width: 100px; text-align:left;color:red; padding-left:8px;"></td>
                </tr>
                <tr>
                    <td style="text-align:right;"><img class="admin-tb"   src="images/admin/admin-password.png"></td>
                    <td><input name="user_password" type="password" placeholder="密码" class="input-text"></td>
                     <%--<td  style="width: 100px; text-align:right;"><s:property value="error" /></td> --%>
                  	<td  style="width: 120px; text-align:left;font-size:14px;color:red;"><s:property value="exception.message" /></td>
                </tr>
                <tr>
                    <td style="text-align:right;"><img class="admin-tb" src="images/admin/admin-code.png"></td>
                    <td>
                        <input class="input-text" type="text" placeholder="验证码" onblur="" onclick="" style="width:150px;">
                        <img src=""><a id="kanbuq" href="javascript:;">看不清，换一张</a>
                        <img src="" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-bottom: 5px;">
                        <input style="width: 15px; height: 15px;" type="checkbox" name="online" class="btn_che" value="" /><i style=" font-size:20px;">使我保持登录状态</i></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input name="" class="btn_login" type="submit" value="登 录 ">
                        <input name="" class="btn_login" id="register" type="reset" value=" 注 册 ">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="login_button">Copyright 李意成-cheng.admin.v1.0</div>
    
    <!-- 客户修改 打开一个窗口 -->
	<div class="easyui-dialog easyui-window" id="custDiv" 
		style="width: 700px; border:0; height: 500px; background-image:url('images/register_bj.jpg'); max-width: 800px;"
		data-options="iconCls:'icon-save',
		striped: true,
			onResize:function(){
				$(this).dialog('center');
			},closed:true">
		<div style="height:330px;" id="div_input">	
			<form id="sbumitForm" action="${pageContext.request.contextPath }/user_save" method="post">
			<%-- <input type="hidden" name="roles.role_id" value="${1}"/> --%>
			<table style="margin:20px auto;">
				<tr style="height:70px;">
                    <td style="width: 300px;">
                    	<input type="text" name="user_code" id="user_codeRegist" value="" placeholder="请用户名" onblur="registerForm()" class="input-is input-text">
                    </td>
                    <td class="input_td" style="color:#00FF00; width:160px;"></td>
                </tr>
                <tr style="height:70px;">
                    <td style="width: 300px;">
                    	<input name="user_name" type="text" placeholder="请输入用户昵称" class="input-is input-text">
                    </td>
                    <td style="color:red; width:160px;" ></td>
                </tr>
                <tr style="height:70px;">
                    <td>
                    	<input type="password" name="user_password" placeholder="请输入密码" class="input-is input-text regist_passwd">
                    </td>
                    <td style="color:red; width:160px;"></td>
                </tr>
                <tr style="height:70px;">
                    <td>
                    	<input type="password"  placeholder="确认密码"  onblur="passwdTest()" class="input-is input-text regist_repasswd" />
                    </td>
                    <td class="input_pd" style="color:red; width:160px;"></td>
                </tr>
			
			</table>
			</form>
		</div>
		<div class="div_submit" >
			<input type="button" onclick="submitForm()" value=" 注  册  "/>
			<input type="button" id="btn_Div" value=" 取  消  "/>
		</div>
	</div>
    
    
    
    
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#register").click(function(){
			$("#custDiv").window("open");	
			$('#custDiv').window('center');
			
		});
		//点击取消 关闭窗口
		$("#btn_Div").click(function(){
			//拿到input表单 
			//console.log($(".input-is"));
			//点击取消按钮情况表单数据
			$(".input-is").val('');
			$('#custDiv').window('close');
		});
		
	});
	
	//user_code 当鼠标移开  触发事件
	function registerForm(){
		//1.获取用户注册账号值  
		var $user_codeRegist = $("#user_codeRegist").val();
		//判断输入的是否为空
		if($user_codeRegist === ""){
			$("#user_codeRegist").focus();
			$(".input_td").text("请输入用户名");
		}else{
			$.get("${pageContext.request.contextPath }/userAjax_ajax",
				{ "user_code": $user_codeRegist},
				  function(data){
				    //调用该方法之前，先删除内容
				    $(".input_td").empty();
				    if(data==="账号已经注册！"){
				    	$("#user_codeRegist").focus();
				    }
				    //添加到提示位置
				    $(".input_td").append(data);
				  },"text");
		}
	}
	//密码验证
	function passwdTest(){
		var p1 =$(".regist_passwd").val();
		var p2 =$(".regist_repasswd").val();
		if(p1!=p2){
			$(".regist_passwd").focus();
			$(".input_pd").text("两次密码不一致！");
		}
	}
	//点击提交按钮 
	function submitForm(){
		$("#sbumitForm").submit();
	}

	///用户登录检测
	function loginForm(){
		//1.获取用户值
		var $user_codeFomr = $("#user_codeForm").val();
		console.log($user_codeFomr);
		//判断输入的是否为空
		if($user_codeFomr === ""){
			$("#user_codeForm").focus();
			$(".user_codeFormTd").text("请输入用户名");
		}else{
			$.get("${pageContext.request.contextPath }/userAjax_ajax",
				{ "user_code": $user_codeFomr},
				  function(data){
				    $(".user_codeFormTd").empty();
				    //添加到提示位置
					if(data==="可以注册！"){
						data ="此用户未注册";
					}else if(data==="账号已经注册！"){
						data = " ";
					}				    
				    $(".user_codeFormTd").append(data);
				  },"text");
		}
	}
	
	
</script>
</body>
</html>