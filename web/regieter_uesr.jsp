<%--
  Created by IntelliJ IDEA.
  User: 刘云龙
  Date: 2020/12/4
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <title>用户注册-挂神</title>
    <style type="text/css">
        .big-bg{
            width: 100%;
        }
        .zt{
            width: 400px;
            height: 480px;
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
    </style>
</head>
<body>
<div class="big-bg">
    <div class="zt">
        <h2 style="text-align: center;">注册</h2>
        <img class="login" src="public/img/login1.png" style="display: block;">
        <form class="input" action="RegisterServlet" method=post>
            <input class="username" type="text" name="usermc" placeholder="请输入用户名" size="30">
            <% if(request.getAttribute("error_usermc") != null) {%>
            <span class="error"> <%=request.getAttribute("error_usermc")%> </span>
            <%}%>

            <input class="password" type="text" name="userzh" placeholder="请输入用户账号" size="30">
            <% if(request.getAttribute("error_userzh") != null) {%>
            <span class="error"> <%=request.getAttribute("error_userzh")%> </span>
            <%}%>

            <input class="password" type="password" name="usermm" placeholder="请输入用户密码" size="30">

            <input class="password" type="text" name="userdh" placeholder="请输入用户电话" size="30">
            <% if(request.getAttribute("error_userdh") != null) {%>
            <span class="error"> <%=request.getAttribute("error_userdh")%> </span>
            <%}%>

            <input class="password" type="text" name="userqq" placeholder="请输入用户QQ" size="30">

            <input type=submit value=注册 class="btn"> <input type=reset value=重置>
        </form>

        <p class="tishi"><span>已有账号？<a class="tishi-qt" href="login_user.jsp" >登录</a></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="tishi-qt" href="#">返回首页</a></span></p>

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
