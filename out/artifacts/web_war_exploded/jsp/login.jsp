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

  </head>
  
  <body>
    <form action="${pageContext.request.contextPath }/user_login.action">
    	<span>${msg }</span><!-- 登录错误信息显示 -->
    	手机号：<input type="text" name="tele" value="${cookie.tele.value }"/>
    	密码：<input type="password" name="password"/>
    	<input type="submit" value="登录"><br><!-- 登录，手机号、密码、然后提交 -->
    	
    	<input type="checkbox" name="remember" value="ok"/>记住登录名
    	<a href="${pageContext.request.contextPath }/jsp/register.jsp">免费注册</a>
    	<a href="${pageContext.request.contextPath }/jsp/forget-pwd.jsp">忘记密码</a>
    </form>
  </body>
</html>
