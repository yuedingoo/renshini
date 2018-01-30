<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>认识你</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

      <link href="${pageContext.request.contextPath }/css/index.css?version=1.0" rel="stylesheet">
      <script src="../js/jquery-3.2.1.min.js"></script>
  <script type="application/javascript">
      function Toregisterpage() {
          window.location.href="${pageContext.request.contextPath }/jsp/register.jsp"
      }
      $(function () {
          $(".reg-and-login-reg").mouseenter(function () {
              $(".reg-and-login-reg").css("cursor","pointer");
          })
          $(".reg-and-login-login").mouseenter(function () {
              $(".reg-and-login-login").css("cursor","pointer");
          })
      })
  </script>

  </head>

  <body>
    <div class="container">

        <%-- header section --%>
        <div class="header">
            <div class="header-left">
                <img src="http://a.xnimg.cn/nx/apps/login/cssimg/logo-big.jpg">
            </div>
            <div class="header-right">
                <div class="header-right-submit">
                    <a href="#">学生团体申请进入</a>
                </div>
                <div class="header-right-reg">
                    <a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a>
                </div>
                <div class="header-right-callback">
                    <a href="">反馈意见</a>
                </div>
            </div>
        </div>

        <%-- center section --%>
        <div class="center">
            <div class="center-left">
                <div class="login-panel">
                    <div class="radium-img">
                        <div class="shadow">
                            <img src="http://a.xnimg.cn/nx/apps/login/cssimg/person.jpg">
                        </div>
                    </div>
                    <div class="form-login">
                        <form action="${pageContext.request.contextPath }/user_login.action" method="post">
                            <span style="font-size: 12px;color: red">${msg}</span>
                            <input type="text" name="tele" class="input-text" placeholder="邮箱/手机号/用户名" style="color: rgb(136, 136, 136); height: 44px;width: 300px">
                            <span style="font-size: 12px;color: red"></span>
                            <input type="password" name="password" class="input-passwprd" placeholder="请输入密码" style="color: rgb(136, 136, 136);height: 44px;width: 300px;visibility: visible">
                            <div class="savepassword">
                                <label title="为了保证您的账号安全，请不要在公共场所点此项" class="label-checkbox">  <input type="checkbox" name="">记住账号</label>
                                <span class="forgetpwd">
                                    <a href="${pageContext.request.contextPath }/jsp/accountIfExist.jsp">忘记密码?</a>
                                </span>
                            </div>
                            <div class="reg-and-login">
                                <input type="button" class="reg-and-login-reg" onclick="Toregisterpage()"  value="注册"></input>
                                <input type="submit" class="reg-and-login-login" value="登录">
                            </div>
                        </form>
                        <p class="third-party-title">
                            <span class="underscore left"></span>
                            <span class="text">第三方登录</span>
                            <span class="underscore right"></span>
                        </p>
                        <div class="login-corp">
                            <div class="third-party-login">
                                <a class="login-item wx" href="" title="微信"></a>
                                <a class="login-item qq" href="" title="QQ"></a>
                                <a class="login-item weibo" href="" title="微博"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="center-right">
                <div class="center-right-advertise">
                    <div class="img">
                        <img width="600" height="360" src="http://file02.16sucai.com/d/file/2014/1027/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="img" href="">
                    </div>
                </div>
                <div class="login-recommand">
                    <div class="intro">
                        <div class="item unactive">
                            <a class="qrcode content" href="#"></a>
                        </div>
                        <div class="item unactive">
                            <a class="phone content" href="#"></a>
                        </div>
                        <div class="item unactive">
                            <a class="pad content" href="#"></a>
                        </div>
                        <div class="item unactive">
                            <a class="other content" href="#"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- foot section --%>
        <div class="foot"></div>
    </div>
  </body>
</html>
