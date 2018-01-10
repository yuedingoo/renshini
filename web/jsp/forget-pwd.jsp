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
    <form action="${pageContext.request.contextPath }/user_modifyPwd.action">
    	<div id="fpwd1" style="display: block;">
	    	手机号：<input type="text" name="tele"/><br><!-- 手机号 --><!-- 加上失去焦点事件，判断手机号格式 -->
	    	<input type="button" value="下一步" onclick="nextStep()">
    	</div>
    	<div id="fpwd2" style="display: none;">
    		新密码：<input type="password"/><br>
	    	新密码：<input type="password" name="password"/><br><!-- 新密码-->
	    	手机验证码：<input type="text" name="code"/><br><!-- 获取手机验证码 -->
	    	<input type="submit" value="提交"/>
    	</div>
    </form>
  </body>
  
  <script type="text/javascript">
  	function nextStep(){
  		/* alert($("input[name='tele']").val()); */
  		var valueTele = $('input[name="tele"]').val();
  		var url = "${pageContext.request.contextPath }/user_fpwd1.action";
  		var param = {'tele' : valueTele};
  		$.post(url,param,function(data){
  			if(data == "账号存在"){
  				$('#fpwd1').css('display','none');
  				$('#fpwd2').css('display','block');
  			}
  		},"text");
  	}
  </script>
</html>
