<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="UTF-8">
    <title>找回密码-安全中心</title>
    <link href="../css/setnewpwd.css" rel="stylesheet">
</head>
<body>
<div class="navbar">
    <span class="navbar-img"><img src="../img/logo-big.jpg" width="160" height="31"></span>
    <span class="navbar-item"><a>帮助中心</a></span>
    <span class="navbar-item"><a>给我们建议</a></span>
    <span class="navbar-item"><a>注册</a></span>
    <span class="navbar-item"><a>登录</a></span>
</div>
<div class="body-steps">
    <div class="securityimg">
        <dl class="steps">
            <dt>找回密码</dt>
            <dd class="step-done">输入账号</dd>
            <dd class="step-set">重设密码</dd>
            <dd class="step-finish">完成</dd>
        </dl>
    </div>
</div>
<div class="find-pwd">
    <div class="find-pwd-content">
        <div class="setnewpwd" style="padding-left: 45px">
            <div >
                新密码:&nbsp;<input placeholder="请输入密码" id="pwd" type="password" style="color: rgb(136, 136, 136); width: 361px;height: 45px;margin-left: 20px;" name="newpwd" class="input-newpwd">
            </div>
            <div>
                <span style="float: left;margin-left: 130px;">确定密码:</span>&nbsp;<input placeholder="请确定密码" id="pwd1" type="password" style="color: rgb(136, 136, 136);width: 361px;height: 45px;" name="renewpwd" class="reinput-newpwd">
                <span id="pwdErrorDesc" style="float: right;font-size: 12px;text-align: center"></span>
                <span id="pwdError" style="float: right;vertical-align: middle"><img style="vertical-align: middle" src="" alt=""></span>

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
<script src="../js/jquery-3.2.1.min.js"></script>
<script type="application/javascript">
    /* 判断两次输入的密码是否一致 */
    $('#pwd1').blur(function(){
        if($(this).val() == $('#pwd').val()){
            $('#pwdError img').attr('src','${pageContext.request.contextPath }/img/verifycode_success.png');
            $('#pwdErrorDesc').html('密码一致');
            $('#pwdErrorDesc').css('margin-right','70px');

        }else{
            $('#pwdError img').attr('src','${pageContext.request.contextPath }/img/verifycode_valid.png');
            $('#pwdErrorDesc').html('两次输入的密码不一致');
            $('#pwdErrorDesc').css('margin-right','0px');
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
</script>
</body>
</html>