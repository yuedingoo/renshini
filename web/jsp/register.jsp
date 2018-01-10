<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>

  </head>
  
  <body>
    <form action="${pageContext.request.contextPath }/user_regist.action">
    	姓名：<input type="text" name="name"/><!-- 真实姓名 -->
    	<span id="nameError"><img/></span><span id="nameErrorDesc"></span><br><!--  -->
    	
    	密码：<input type="password"/><br>
    	密码：<input type="password" name="password"/><!-- 两次输入密码 -->
    	<span id="pwdError"><img/></span><span id="pwdErrorDesc"></span><br><!-- 判断两次账号是否一致 -->
    	
    	手机号：<input type="text" name="tele" id="tele"/><!-- 手机号 -->
    	<span id="teleError"><img/></span><span id="teleErrorDesc"></span><br><!-- 验证手机号的格式 -->
    	
    	验证码：<input type="text" name="code" id="code"/>
    	<span onclick="getCode()">获取短信验证码</span><span id="codeError"><img/></span><br><!-- 获取手机验证码 -->
    	
    	<input type="submit"/>
    </form>
  </body>
  
  <script type="text/javascript">
  	/* 验证姓名 */
  	$("input[name='name']").blur(function(){
  		if($(this).val().length < 6){
  			$('#nameError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
  			$('#nameErrorDesc').html('');
  		}else{
  			$('#nameError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
  			$('#nameErrorDesc').html('输出账号太长');
  		}
  	});
  	function getCode(){
  		var valueTele = $('#tele').val();
  		var url = "${pageContext.request.contextPath }/user_getSMSCode.action";
  		var param = {'tele' : valueTele};
  		$.post(url,param,function(data){
  			alert(data);
  		},"json");
  	}
  	/* 	1、前端当验证码失去焦点时触发一函数
  		2、发送ajax调用后台方法进行验证
  		3、返回验证后的信息（正确或是错误）
  		4、正确的话在对应行后面显示一个小勾图片（verifycode_success）；不正确的话显示一个警告图片（verifycode_valid）后面再显示错误的信息提示（如：输入的短信验证码不正确）
  		注：这个错误正确的提示信息 可以应用在每个地方*/
  	$('#code').blur(function(){
  		var valueCode = $('#code').val();
  		var url = "${pageContext.request.contextPath }/user_verificationSMS.action";
  		var param = {'vcode' : valueCode};
  		alert(param);
  		$.post(url,param,function(data){
  			alert(data);
  		},"text");//返回的中文需要使用text，可以直接输出，json不行
  	});
  </script>
  
</html>
