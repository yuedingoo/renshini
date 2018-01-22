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

	<link href="${pageContext.request.contextPath }/css/register.css?version=1.0" rel="stylesheet">

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>

  </head>
  
  <body>

  <div class="register-2018-header">

	  <a href="/" class="register-2018-header-logo"><img src="${pageContext.request.contextPath }/img/logo-big.jpg"></a>

	  <a href="${pageContext.request.contextPath }/index.jsp" class="register-2018-header-home">首页</a>

  </div>

  <div class="register-2018-body">
	  <div class="register-2018-body-container">
		  <div class="content">
			  <div class="head">欢迎注册认识你网站</div>
			  <div class="tips"><span>已有认识你账号?</span><a class="tips-link" href="${pageContext.request.contextPath }/index.jsp">&nbsp;快捷登录></a></div>
			  <form action="${pageContext.request.contextPath }/user_regist.action" class="next-form">
				  <div class="next-form-item">
					  <input type="text" value="" placeholder="请设置用户名" name="name">
					  <span id="nameError"><img/></span><span id="nameErrorDesc"></span><br>
				  </div>
				  <div class="next-form-item">
					  <input type="password" value="" placeholder="请设置你的登录密码" id="pwd">
				  </div>
				  <div class="next-form-item">
					  <input type="password" value="" placeholder="请确定你的登录密码" name="password" id="pwd1">
					  <span id="pwdError"><img/></span><span id="pwdErrorDesc"></span>
				  </div>
				  <div class="next-form-item-phone">
					  <span style="border-right: 1px solid  #c3c5c6;width:40px;height: 100%;float: left;line-height: 40px">+86</span><input type="text" value="" placeholder="输入手机号码" id="tele" name="tele" maxlength="11">
					  <span id="teleError"><img/></span><span id="teleErrorDesc"></span><br>
				  </div>
				  <div class="next-form-item">
					  <input type="text" class="code" name="code" id="code" placeholder="输入校验码"/>
					  <span class="getCode" onclick="getCode()">获取短信验证码</span>
					  <span id="codeError"><img/></span><span id="codeErrorDesc"></span><!-- 获取手机验证码 -->
				  </div>
				  <div class="next-form-item-submit">
					  <input type="submit" value="同意条款并注册" >
				  </div>
				  <div class="next-form-item-receive">
					  点击完成注册表示您接收<span><a>认识你网服务条款</a></span>
				  </div>
			  </form>
		  </div>

	  </div>

  </div>

  </body>
  
  <script type="text/javascript">

  	/* 验证注册姓名的填写（这里只实现了长度必须小于6位） */
  	$("input[name='name']").blur(function(){
  		if($(this).val().length < 6){
  			$('#nameError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
  			$('#nameErrorDesc').html('');
  		}else{
  			$('#nameError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
  			$('#nameErrorDesc').html('输出账号太长');
  		}
  	});

  	/* 判断两次输入的密码是否一致 */
  	$('#pwd1').blur(function(){
  	    if($(this).val() == $('#pwd').val()){
            $('#pwdError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
            $('#pwdErrorDesc').html('');
        }else{
            $('#pwdError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
            $('#pwdErrorDesc').html('两次密码输入不一样');
        }
	});

  	/* 判断输入的手机号格式是否正确 */
    $('#tele').blur(function(){
        if($(this).val().match('^1[3|4|5|8][0-9]\\d{4,11}$')){
            $('#teleError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
            $('#teleErrorDesc').html('');
        }else{
            $('#teleError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
            $('#teleErrorDesc').html('请输入正确的手机号');
        }
    });

  	/* 点击得到校验码（这里使用弹出框的方式提示） */
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
  		$.post(url,param,function(data){
  			alert(data);
			if(data == "验证码输入正确"){
                $('#codeError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
                $('#codeErrorDesc').html('');
            }else{
                $('#codeError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
                $('#codeErrorDesc').html('输出的验证码不正确');
            }
  		},"text");//返回的中文需要使用text，可以直接输出，json不行
  	});

  	/** 按提交按钮之前需要判断表单中是否存在不正确的输入（可以根据后面的提示信息），先禁止后打开 */

  </script>
  
</html>
