<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    <title>找回密码-验证账号</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

        <link href="${pageContext.request.contextPath }/css/forgetpwd-account.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath }/css/setnewpwd.css" rel="stylesheet">

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>

  </head>
  
  <body>

  <div class="navbar">
      <span class="navbar-img"><img src="../img/logo-big.jpg" width="160" height="31"></span>
      <span class="navbar-item"><a>帮助中心</a></span>
      <span class="navbar-item"><a>给我们建议</a></span>
      <span class="navbar-item"><a>注册</a></span>
      <span class="navbar-item"><a>登录</a></span>
  </div>
  <div class="navbar-body-head">
      <div class="singlepage securityimg">
          <dl class="steps">
              <dt>找回密码</dt>
              <dd class="firset_selected">输入账号</dd>
              <dd class="steps-gray">重设密码</dd>
              <dd class="steps-gray-finish">完成</dd>
          </dl>
      </div>
  </div>

  <div class="navbar-body">
	  <form method="post" action="${pageContext.request.contextPath }/user_accountIfExist.action">
		  <div class="find-pwd">
			  <div class="find-pwd-content">
				  <ul class="safe-data-box">
					  <%--<li><label>请选择您要找回登录账号的方式</label>
						  <p class="radio-choice">
							  <input type="radio" checked="checked"><label>认识你账号</label>
							  <input type="radio" name="phone"><label>电话号码</label>
							  <input type="radio"><label>其它方式</label>
						  </p>
					  </li>--%>
                      <li>${msg }</li>
					  <li style="position: relative">
						  <label>手机号: </label><input class="input-text" type="text" name="tele" id="tele">
						  <span id="teleError" style="position: absolute;top: 11px;"><img/></span>
						  <span id="teleErrorDesc" style="position: absolute;top: 10px;left: 663px;font-size: 14px;"></span><br>
					  </li>
					  <li class="icode"><input class="captcha-type" type="hidden">
						  <img src="${pageContext.request.contextPath }/img/logo.png" alt="" style="cursor: pointer;vertical-align: middle" height="60" width="145">
						  <span class="captcha-btn"><a >换一张</a></span>
					  </li>
					  <li>
						  <label for="validate_code" style="font-size: 14px">请输入验证码: </label>
						  <input id="validate_code" class="input-txt" type="text" name="captcha">
					  </li>
					  <li class="btn-box">
						  <%--<a href="javascript:void(0);" class="safe-color-btn" style="border: 1px solid #1B6AAE">
							  确定
						  </a>
						  <a class="safe-gray-btn">取消</a>--%>
						  <input type="submit" class="safe-color-btn" style="border: 1px solid #1B6AAE" value="确定"/>
						  <input type="reset" class="safe-color-btn" style="border: 1px solid #1B6AAE" value="取消"/>
					  </li>
				  </ul>
			  </div>
		  </div>
	  </form>

  </div>

  </body>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/info-verification.js?version=1.0"></script>

</html>
