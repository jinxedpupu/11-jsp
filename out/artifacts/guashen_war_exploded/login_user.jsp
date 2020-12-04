<%--
  Created by IntelliJ IDEA.
  User: 刘云龙
  Date: 2020/11/30
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>用户登录-挂神</title>
    <style type="text/css">
        .big-bg{
            width: 100%;
        }
        .zt{
            width: 400px;
            height: 400px;
            border: 1px solid black;
            margin: 200px auto 0;
            background-color: #fff;
        }
        .login{
            position: relative;
            bottom: 250px;
            left: 80px;
        }
        .input{
            display: block;
            position: relative;
            bottom: 200px;
            left: 80px;
        }
        .password{
            display: block;
            margin-top: 20px;
            /* margin-top: 50px auto; */
        }
        .btn{
            margin-top: 20px;
            width: 230px;
            background-color: #00BFFF;
            border: #00BFFF;
        }
        .tishi{
            display: block;
            position: relative;
            bottom: 200px;
            left: 80px;
        }
        .dsf{
            display: block;
            position: relative;
            bottom: 200px;
            left: 80px;
        }
        a.tishi-qt:link{
            text-decoration: none;
            color: #00BFFF;
        }
        a.dsf-wx{
            margin-left: 65px;
        }
        .error{
            color: red;
        }
    </style>
</head>
<body>
<div class="big-bg">
    <div class="zt">
        <h2 style="text-align: center;">登录</h2>
        <img class="login" src="public/img/login1.png" style="display: block;">
        <form class="input" action="loginServlet" method=post>
            <input class="username" name="userzh" size="30" placeholder="请输入用户账号">
            <input class="password" name="usermm" size="30" placeholder="请输入用户密码" type="password">
            <input type=submit value=登陆 class="btn"> <input type=reset value=重置>
            <% if(request.getAttribute("error") != null){ %>
            <p class="error"><%=request.getAttribute("error")%></p>
            <% } %>
        </form>

        <p class="tishi"><span>没有账号？<a class="tishi-qt" href="regieter_uesr.jsp" >注册</a>-</span>
            <a class="tishi-qt" href="#">忘记密码</a><span>&nbsp;&nbsp;
                <a class="tishi-qt" href="index.jsp">返回首页</a></span></p>

        <div class="dsf">
            <p>————<span>第三方账号登录</span>————</p>
            <div>
                <a href="#"><img src="public/img/qq.png" alt="QQ登录" title="QQ登录"></a>
                <a class="dsf-wx" href="#"><img src="public/img/wx.png" alt="微信登录" title="微信登录"></a>
            </div>
        </div>

    </div>
</div>
</body>
</html>