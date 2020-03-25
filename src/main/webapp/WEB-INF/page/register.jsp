<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/24
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./styles/clicki.web.css?V=20120501" media="screen" />
    <link rel="stylesheet" type="text/css" href="./styles/clicki.loginandreg.css?V=20120501" media="screen" />
    <link rel="stylesheet" type="text/css" href="./styles/clicki.webkitanimation.css?V=20120501" media="screen" />
    <title>注册页面</title>
</head>
<body>

<div class="theCenterBox" style="">
    <div class="theLoginBox" style="width:657px">
        <div class="loginTxt">注册账号</div>
        <form id="leftForm" action="" method="post">
            <div class="theLoginArea" id="loginBox">
                <p style="position: relative;">
                    <label for="name">登录名：</label>
                    <input placeholder="请输入您的名称" name="name" id="name" type="text" maxlength="255" />
                    <span>请输入您的名称</span> </p>
                <p style="position: relative;">
                    <label for="password">密码：</label>
                    <input placeholder="请输入您的密码" name="password" id="password" type="password" maxlength="16" />
                    <span>请输入您的密码</span> </p>
                <p style="position: relative;">
                    <label for="email">邮箱：</label>
                    <input placeholder="请输入您的邮箱" name="email" id="email" type="text" value="" />
                    <span>请输入您的邮箱</span> </p>
                <p style="position: relative;">
                    <label for="age">年龄：</label>
                    <input placeholder="请输入您的年龄" name="age" id="age" type="text" value="" />
                    <span>请输入您的年龄</span> </p>
                <div>
                    <label for="email">性别：</label>
                    <input type="radio" name="sex" value="male"><label>男</label>
                    <input type="radio" name="sex" value="female"><label>女</label>
                </div>
                        <br><br>
                <div class="loginSubmitBnt">
                    <div class="reg_submit">
                        <input name="userSubmit" class="theSubmitButton" value="" type="submit" />
                    </div>
                </div>
            </div>
            <div class="theRegArea fixRegHeight" id="reg_reg">
                <h2>已经有账号？</h2>
                <br/>
                <a class="reg_login" href=""></a> </div>
        </form>
    </div>
</div>
</body>
</html>
