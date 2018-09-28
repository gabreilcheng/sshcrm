<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传</title>
<style>
	ul, ol{ list-style: none;}
	a {border: none;text-decoration: none;color: inherit;}
	* {margin: 0;padding: 0; }
	div{
        margin: 30px auto;
        border: 1px #000000 solid;
        width: 400px;height: 400px;
    }
    img{
        width: 390px;
        height: 360px;
        margin: 5px;
    }
</style>
</head>

<body>
<!-- 
	前台文件上传要求：
		1 表单必须是post 提交
		2 表单提供的类型enctype ,必须多段式
		3.文件上传是用 tpye="file"
 -->
	<form action="${pageContext.request.contextPath }/upload" method="post" enctype="multipart/form-data" >
		<div style="border:2px dashed #000000;">
		    <p style="height: 20px; padding: 5px;  border-bottom: 2px #000000 dashed; font-size: 16px;">
		       	 图片上传前预览：<input type="file" id="xdaTanFileImg" name="upload" onchange="xmTanUploadImg(this)" accept="image/*"/>
		    </p>
		    <img id="xmTanImg" style="border:0;" />
		    <input type="submit" value=" 上 传  " style=" width:150px; height:40px; margin:2px; font-size:20px; border:0; "  />
		</div>
		
	</form>
	<script type="text/javascript">
		if (typeof FileReader == 'undefined') {
	        document.getElementById("xmTanDiv").InnerHTML = "<h1>当前浏览器不支持FileReader接口</h1>";
	        document.getElementById("xdaTanFileImg").setAttribute("disabled", "disabled");
	    }
	    //选择图片，马上预览
	    function xmTanUploadImg(obj) {
	        var file = obj.files[0];
	        var reader = new FileReader();
	        //读取文件过程方法
	        reader.onloadstart = function (e) {
	            console.log("开始读取....");
	        }
	        reader.onprogress = function (e) {
	            console.log("正在读取中....");
	        }
	        reader.onabort = function (e) {
	            console.log("中断读取....");
	        }
	        reader.onerror = function (e) {
	            console.log("读取异常....");
	        }
	        reader.onload = function (e) {
	            console.log("成功读取....");
	            var img = document.getElementById("xmTanImg");
	            img.src = e.target.result;
	            //或者 img.src = this.result;  //e.target == this
	        }
	        reader.readAsDataURL(file)
	    }
	</script>
</body>
</html>