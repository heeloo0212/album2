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
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link href="../css/signin.css" rel="stylesheet">
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet">
</head>
<script>
    $(function() {
        $('#formLogin').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                       /* stringLength: {
                            min: 3,
                            max: 20,
                            message: '用户名长度不能小于3位或超过20位'
                        },*/
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 5,
                            max: 20,
                            message: '用户名长度不能小于5位或超过20位'
                        },
                    }
                }
            }
        })
    })

    $(function () {
        // 刷新验证码
        $("#verification").bind("click", function () {
            $(this).hide().attr('src', '/verification?random=' + Math.random()).fadeIn();
        });
    });


</script>
<body style="background: url(../images/loginback3.jpg) no-repeat;background-size: 100% 100%">
<div class="container" >
    <div class="form-login">
    <form class="" action="/loginPage" method="post" id="formLogin">
        <div class="col-md-12">
        <h2 class="form-signin-heading">请登入您的账号</h2>
        </div>
        <div class="form-group col-md-12">
            <input type="text" id="name" name="name" class="form-control" placeholder="账号名" >
        </div>
        <div class="form-group col-md-12">
            <input type="password" id="password" name="password" class="form-control" placeholder="密码" >
        </div>
        <div class="form-group col-md-12">
            <div class="row">
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="code" name="code" data-toggle="tooltip" data-placement="top" required placeholder="请输入验证码">
                </div>
                <div class="col-sm-4">
                    <img id="verification" src="/verification" class="img-responsive" style="display: block;width:100%;height: 32px" title="看不清？换一张" />
                </div>
            </div>
        </div>
        <div class="checkbox col-md-12">
            <label>
                <input type="checkbox" value="1" name="isRememberMe"> 记住我
            </label>
        </div>
        <div class="col-md-12">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <button class="btn btn-lg btn-info btn-block" type="button"><a href="${pageContext.request.contextPath}/register">注册</a></button>
        </div>
    </form>
    </form>
    </div>
</div>
<%@ include file="foot.jsp" %>
</body>
</html>
