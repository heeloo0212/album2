<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/21
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link href="../css/signin.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form class="form-signin" action="/loginPage" method="post">
        <h2 class="form-signin-heading">请登入您的账号</h2>
        <input type="text" id="name" name="name" class="form-control" placeholder="账号名" >
        <input type="password" id="password" name="password" class="form-control" placeholder="密码" >
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <button class="btn btn-lg btn-info btn-block" type="button"><a href="${pageContext.request.contextPath}/register">注册</a></button>
    </form>

</div> <!-- /container -->
</body>
</html>
