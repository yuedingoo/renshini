<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <title>找回密码-安全中心</title>
    <link href="${pageContext.request.contextPath }/css/setnewpwdsuccess.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</head>
<script type="application/javascript">
    $(document).ready(function () {
        setTimeout("lazyGo();", 1000);
    });
</script>
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
<div class="find-pwd" id="fpwd3" >
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
</body>
<script src="../js/jquery-3.2.1.min.js"></script>
<script type="application/javascript">
    function lazyGo() {
        var sec = $("#sec").text();
        $("#sec").text(--sec);
        if (sec > 0){
            setTimeout("lazyGo();", 1000);
        }else{
            window.location.href = "http://localhost:8080/index.jsp";
        }
    }
</script>
</html>