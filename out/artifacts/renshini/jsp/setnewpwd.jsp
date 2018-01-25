<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="UTF-8">
    <title>找回密码-安全中心</title>
    <link href="${pageContext.request.contextPath }/css/setnewpwd.css" rel="stylesheet">
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
    <form method="post" action="${pageContext.request.contextPath }/user_modifyPwd.action">
    <div class="find-pwd-content">
        <div class="setnewpwd" style="padding-left: 45px">
            <div>
                <span>${msg }</span>
            </div>
            <div>
                <input name="tele" type="hidden" value="${tele}" />
            </div>
            <div >
                新密码:&nbsp;<input placeholder="请输入密码" id="pwd" type="password" style="color: rgb(136, 136, 136); width: 361px;height: 45px;margin-left: 20px;" name="newpwd" class="input-newpwd">
            </div>
            <div>
                <span style="float: left;margin-left: 130px;">确定密码:</span>&nbsp;<input placeholder="请确定密码" id="pwd1" type="password" style="color: rgb(136, 136, 136);width: 361px;height: 45px;" name="password" class="reinput-newpwd">
                <span id="pwdErrorDesc" style="float: right;font-size: 12px;text-align: center"></span>
                <span id="pwdError" style="float: right;vertical-align: middle"><img style="vertical-align: middle" src="" alt=""></span>
            </div>
            <div >
                短信验证码:&nbsp;<input type="test" style="color: rgb(136, 136, 136);width: 180px;height: 45px" name="icode" id="code" class="input-icode" placeholder="请输入验证码">
                <input style="height: 34px;width: 150px;margin-right: 34px" class="geticode-btn" type="button" value="免费获取验证码" onclick="getCode()">
            </div>
            <div class="submit-newpwd" style="margin-left: 20px">

                    <input type="button" class="previous-btn" value="上一步" style="width: 160px;height: 43px;border-radius: 3px;cursor: pointer;border:none;font-size: 18px;color: #fff;">


                    <input type="submit" class="next-btn" value="下一步" style="width: 160px;height: 43px;border-radius: 3px;cursor: pointer;border:none;font-size: 18px;color: #fff;background-color: #308EE6">

            </div>
        </div>
    </div>
    </form>
</div>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/info-verification.js?version=1.0"></script>
</body>
</html>