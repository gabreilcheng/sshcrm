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
    <title>修改密码</title>
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
    <link rel="stylesheet" type="text/css" href="css/index.css" />
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
            width: 120px;
            height: 40px;
            margin-right: 20px;
            border: 0;
            color: #ffffff;
            font-size: 18px;text-align: center;border-radius:6px;
            background:	#2b61c5;letter-spacing: 4px;
        }
        #login_table .tohome{
        	color: #ffffff;
            font-size: 18px;
            width: 120px;letter-spacing: 4px;border-radius:6px;
            height: 40px;background:#2b61c5;float:right;text-align: center;line-height: 40px;
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
		#editPwd{
			font-size:26px;
			font-weight:400;
			color:#25e268;
			line-height:60px;
			text-align:center;
			letter-spacing: 4px;
			
		}
    </style>
</head>
<body>
<div id="login_top">
   <!--  <img alt="" src="images/admin/admin_top.png" /> -->
   <p id="editPwd">修改密码</p>
</div>
<div id="login_center">
    <div class="login_form">
        <form action="${pageContext.request.contextPath }/useredit_editPwd" method="post">
            <table id="login_table" border="0">
            	<input type="hidden" name="user_id" value="${user.user_id }"/>
                <tr>
                    <td style="width: 150px; text-align:right;"><img class="admin-tb" src="images/admin/admin-user.png"></td>
                    <td style="width: 300px;"><input name="user_code" id="user_codeForm" type="text" onblur="loginForm()"  value='${user.user_code}' class="input-text" readonly="readonly"></td>
                    <td class="user_codeFormTd" style="width: 100px; text-align:left;color:red; padding-left:8px;"></td>
                </tr>
                <tr>
                    <td style="text-align:right;"><img class="admin-tb"   src="images/admin/admin-password.png"></td>
                    <td><input name="user_password" type="password" placeholder="原始密码" class="input-text"></td>
                     <%--<td  style="width: 100px; text-align:right;"><s:property value="error" /></td> --%>
                  	<td  style="width: 120px; text-align:left;font-size:14px;color:red;"><s:property value="exception.message" /></td>
                </tr>
                <tr>
                    <td style="text-align:right;"><img class="admin-tb"   src="images/admin/admin-password.png"></td>
                    <td><input name="user_repassword" type="password" placeholder="新密码" class="input-text"></td>
                  	<td  style="width: 120px; text-align:left;font-size:14px;color:red;"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input name="" class="btn_login" type="submit" value="确认修改 ">
                        <div class="tohome"><a href="index.jsp">返回首页</a></div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="login_button">Copyright 李意成-liyicheng.admin.v1.0</div>
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
</script>
</body>
</html>