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

	<link href="${pageContext.request.contextPath }/css/register.css?version=2.0" rel="stylesheet">

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
					  <span id="nameError"><img/></span>
					  <span id="nameErrorDesc" style="font-size: 14px;"></span><br>
				  </div>
				  <div class="next-form-item">
					  <input type="password" value="" placeholder="请设置你的登录密码" id="pwd">
				  </div>
				  <div class="next-form-item">
					  <input type="password" value="" placeholder="请确定你的登录密码" name="password" id="pwd1">
					  <span id="pwdError"><img/></span>
					  <span id="pwdErrorDesc" style="font-size: 14px;"></span>
				  </div>
				  <div class="next-form-item-phone">
					  <span style="border-right: 1px solid  #c3c5c6;width:40px;height: 100%;float: left;line-height: 40px">+86</span><input type="text" value="" placeholder="输入手机号码" id="tele" name="tele" maxlength="11">
					  <span id="teleError" style="position: absolute;top: 10px;left: 336px;"><img/></span>
					  <span id="teleErrorDesc" style="position: absolute;top: 10px;left: 357px;width: 200px;text-align: left;font-size: 14px;"></span><br>
				  </div>
				  <div class="next-form-item">
					  <input type="text" class="code" name="icode" id="code" placeholder="输入校验码"/>
					  <span class="getCode" onclick="getCode()">获取短信验证码</span>
					  <span id="codeErrorDesc">${msg}</span><!-- 获取手机验证码 -->
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

  <script type="text/javascript" src="${pageContext.request.contextPath }/js/info-verification.js?version=1.0"></script>
  
</html>
