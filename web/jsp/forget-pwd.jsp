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

	  <link href="${pageContext.request.contextPath }/css/forgetpwd-account.css" rel="stylesheet">
	  <link href="${pageContext.request.contextPath }/css/setnewpwd.css" rel="stylesheet">
	  <link href="${pageContext.request.contextPath }/css/setnewpwdsuccess.css" rel="stylesheet">

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>

  </head>
  
  <body>

  <div class="navbar">
	  <span class="navbar-img"><img src="${pageContext.request.contextPath }/img/logo-big.jpg" width="160" height="31"></span>
	  <span class="navbar-item"><a href="#">帮助中心</a></span>
	  <span class="navbar-item"><a href="#">给我们建议</a></span>
	  <span class="navbar-item"><a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a></span>
	  <span class="navbar-item"><a href="${pageContext.request.contextPath }/jsp/login.jsp">登录</a></span>
  </div>

  <div class="navbar-body">

	  <%-- navbar --%>
	  <div class="navbar-body-head">
		  <div class="singlepage">
			  <span><img src="${pageContext.request.contextPath }/img/secur-center-logo.jpg" width="132" height="47"></span>
			  <dl class="steps">
				  <dt>找回密码</dt>
				  <dd class="firset_selected">输入账号</dd>
				  <dd class="steps-gray">重设密码</dd>
				  <dd class="steps-gray">完成</dd>
			  </dl>
		  </div>
	  </div>

	  <%-- content --%>
	  <form method="post" action="${pageContext.request.contextPath }/user_modifyPwd.action">
		  <%-- 第一步，使用手机号验证身份 --%>
		  <div class="find-pwd" id="fpwd1" style="display: block;">
			  <div class="find-pwd-content">
				  <ul class="safe-data-box">
					  <li><label>请选择您要找回登录账号的方式</label>
						  <p class="radio-choice">
							  <input type="radio" checked="checked"><label>认识你账号</label>
							  <input type="radio" name="phone"><label>电话号码</label>
							  <input type="radio"><label>其它方式</label>
						  </p>
					  </li>
					  <li>
						  <label>手机号: </label><input class="input-text" type="text" name="tele" id="tele">
						  <span id="teleError"><img/></span><span id="teleErrorDesc"></span><br>
					  </li>
					  <li class="icode"><input class="captcha-type" type="hidden"><img src="${pageContext.request.contextPath }/img/logo.png" alt="" style="cursor: pointer" height="60" width="145"><span class="captcha-btn"><a >换一张</a></span></li>
					  <li><label for="validate_code" style="font-size: 14px">请输入验证码: </label><input id="validate_code" class="input-txt" type="text" name="captcha"></li>
					  <li class="btn-box"><a href="javascript:void(0);" onclick="ifPhone()" class="safe-color-btn" style="border: 1px solid #1B6AAE">确定</a><a class="safe-gray-btn">取消</a></li>
				  </ul>
			  </div>
		  </div>

		  <%-- 第二步，设置新密码 --%>
		  <div class="find-pwd" id="fpwd2" style="display: none;">
			  <div class="find-pwd-content">
				  <div class="setnewpwd" style="padding-left: 45px">
					  <div >
						  新密码:&nbsp;<input placeholder="请输入密码" id="pwd" type="password" style="color: rgb(136, 136, 136); width: 361px;height: 45px;margin-left: 20px;" name="newpwd" class="input-newpwd" >
					  </div>
					  <div  >
						  确定密码:&nbsp;<input placeholder="请确定密码" id="pwd1" type="password" style="color: rgb(136, 136, 136);width: 361px;height: 45px;" name="renewpwd" class="reinput-newpwd">
					  </div>
					  <div >
						  短信验证码:&nbsp;<input type="test" style="color: rgb(136, 136, 136);width: 180px;height: 45px" name="icode" class="input-icode" placeholder="请输入验证码"><input style="height: 34px;width: 150px;margin-right: 34px" class="geticode-btn" type="button" value="免费获取验证码">
					  </div>
					  <div class="submit-newpwd" style="margin-left: 20px">

						  <input type="button" class="previous-btn" value="上一步" style="width: 160px;height: 43px;border-radius: 3px;cursor: pointer;border:none;font-size: 18px;color: #fff;">


						  <input type="button" class="next-btn" value="下一步" style="width: 160px;height: 43px;border-radius: 3px;cursor: pointer;border:none;font-size: 18px;color: #fff;background-color: #308EE6">

					  </div>
				  </div>
			  </div>
		  </div>

		  <%-- 第三步，密码设置完成，可以进行保存 --%>
		  <div class="find-pwd" id="fpwd3" style="display: none;">
			  <div class="back">
				  <div class="back-img">
					  <img src="${pageContext.request.contextPath }/img/gou.jpg" width="150" height="150" >
					  <span><a href="${pageContext.request.contextPath }/index.jsp">点此处返回登录页面</a></span>
				  </div>
				  <div class="back-time">
					  <a class="link" href="/" onclick="history.go(-1)"><span id="sec">5</span> 秒后返回登录</a>
				  </div>
			  </div>
		  </div>
	  </form>

  </div>

  </body>
  
  <script type="text/javascript">

	/* 第一步需要判断账号（手机号）是否存在，存在才进入下一步，否则将错误信息提示 */
  	function ifPhone(){
  		/* alert($("input[name='tele']").val()); */
  		var valueTele = $('#tele').val();
  		var url = "${pageContext.request.contextPath }/user_fpwd1.action";
  		var param = {'tele' : valueTele};
  		$.post(url,param,function(data){
  			if(data == "账号存在"){
  				$('#fpwd1').css('display','none');
  				$('#fpwd2').css('display','block');
  			}else{
                $('#teleError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
                $('#teleErrorDesc').html('此账号不存在，请注册后登录');
			}
  		},"text");
  	}

    /* 判断两次输入的密码是否一致 */
    $('#pwd1').blur(function(){
        if($(this).val() == $('#pwd').val()){
            <%--$('#pwdError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');--%>
            <%--$('#pwdErrorDesc').html('');--%>
			$('#pwd1').append("<style>#pwd1::after{background-image: '${pageContext.request.contextPath }/img/verifycode_success.png'}<style>")
        }else{
            $('#pwdError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
            $('#pwdErrorDesc').html('两次输入的密码不一致');
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

	/* 判断校验码是否正确 */
    $('#code').blur(function(){
        var valueCode = $('#code').val();
        var url = "${pageContext.request.contextPath }/user_verificationSMS.action";
        var param = {'vcode' : valueCode};
        $.post(url,param,function(data){
//  			alert(data);
            if(data == "验证码输入正确"){
                $('#codeError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
                $('#codeErrorDesc').html('');
            }else{
                $('#codeError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
                $('#codeErrorDesc').html('输出的验证码不正确');
            }
        },"text");//返回的中文需要使用text，可以直接输出，json不行
    });

    /* 重置密码完成后是否可以进行下一步（判断之前的操作没有错误后执行） */
    function nextStep() {
		if($('#pwdErrorDesc').html() == '' && $('#codeErrorDesc').html() == ''){
            $('#fpwd2').css('display','none');
            $('#fpwd3').css('display','block');
            /* 完成时进行后台数据的操作 */
            var valueTele = $('#tele').val();
            var valuePwd = $('#pwd1').val();
            var url = "${pageContext.request.contextPath }/user_modifyPwd.action";
            var param = {'tele' : valueTele, 'password' : valuePwd};
            $.post(url,param,function(data){
				/*alert('更新成功');*/
            },"text");

            /* 当最后一个页面显示时（也就是设置成功时），开始倒计时 */
            setTimeout("lazyGo();", 1000);
		}
    }
  </script>

  <script>
      function lazyGo() {
          var sec = $("#sec").text();
          $("#sec").text(--sec);
          if (sec > 0){
              setTimeout("lazyGo();", 1000);
          }else{
              window.location.href = "http://localhost:8080/renshini/index.jsp";
          }
      }
  </script>

</html>
