<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>注册页面</title>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link href="../css/signin.css" rel="stylesheet">
    <link href="../css/bootstrapValidator.min.css" rel="stylesheet">
</head>
<script>
    $(function() {
        //使用bootstrap validator插件进行客户端数据校验
        $('#formRegister').bootstrapValidator({
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
                        remote:{
                            type:'post',
                            url:'${pageContext.request.contextPath}/checkName',
                        }
                    }
                },
                password: {
                    validators:{
                        notEmpty:{
                            message:'密码不能为空'
                        },
                        stringLength: {
                            min: 5,
                            max: 20,
                            message: '用户名长度不能小于5位或超过20位'
                        },
                    }
                },
                confirmPassword:{
                    validators:{
                        notEmpty:{
                            message:'确认密码不能为空'
                        },
                        identical: {
                            field: 'password',
                            message: '密码输入不一致'
                        }
                    }
                },
                email:{
                    validators:{
                        notEmpty:{
                            message:'邮箱不能为空'
                        },
                        emailAddress : {
                            message : '请输入正确的邮件地址'
                        }
                    }
                },
                age:{
                    validators:{
                        notEmpty:{
                            message:'年龄不为空'
                        },
                        digits: {
                            message: '该值只能包含数字。'
                        },
                        greaterThan: {
                            value: 0
                        },
                        lessThan: {
                            value: 120
                        }
                    }
                }
            }
        })
    })
</script>
<body style="background: url(../images/loginback3.jpg) no-repeat;background-size: 100% 100%">
<div class="container">
	<form class="form-register" action="/addUser" method="post" id="formRegister">
        <div class="col-md-12">
            <h2 class="form-signin-heading">请注册您的账号</h2>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label">账号名:</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="账号名" />
        </div>
        <div class="form-group col-md-12">
            <label class="control-label">密码:</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="密码"/>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label">确认密码:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="确认密码"/>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label">邮箱:</label>
            <input type="text" id="email" name="email" class="form-control" placeholder="请输入你的邮箱"/>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label">年龄:</label>
            <input type="text" id="age" name="age" class="form-control" placeholder="请输入你的年龄"/>
        </div>
        <div class="form-group col-md-12">
            <label class="control-label">性别:</label>
            <input type="radio" name="sex" value="男"/><label>男</label>
            <input type="radio" name="sex" value="女"/><label>女</label>
        </div>
        <div class="col-md-12">
		<button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
		<button class="btn btn-lg btn-info btn-block" type="button"><a href="${pageContext.request.contextPath}/loginPage">已有账号</a></button>
        </div>
	</form>

</div> <!-- /container -->
</body>


</html>