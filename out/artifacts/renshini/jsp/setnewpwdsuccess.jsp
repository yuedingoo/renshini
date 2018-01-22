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
    <link href="../css/setnewpwdsuccess.css" rel="stylesheet">
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