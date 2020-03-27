<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>注册页面</title>
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link href="../css/signin.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<form class="form-signin" action="/addUser" method="post">
		<label class="control-label">账号名:</label>
		<input type="text" id="name" name="name" class="form-control" placeholder="账号名" /><br>
		<label class="control-label">密码:</label>
		<input type="password" id="password" name="password" class="form-control" placeholder="密码"/> <br>
	    <label class="control-label">邮箱:</label>
		<input type="text" id="email" name="email" class="form-control" placeholder="请输入你的邮箱"/><br>
		<label class="control-label">年龄:</label>
		<input type="text" id="age" name="age" class="form-control" placeholder="请输入你的年龄"/><br>
		<label class="control-label">性别:</label>
		<input type="radio" name="sex" value="男"/><label>男</label>
		<input type="radio" name="sex" value="女"/><label>女</label>
		<button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
		<button class="btn btn-lg btn-info btn-block" type="button"><a href="${pageContext.request.contextPath}/loginPage">已有账号</a></button>
	</form>

</div> <!-- /container -->
</body>


</html>