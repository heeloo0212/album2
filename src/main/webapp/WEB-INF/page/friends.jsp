<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/1
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>好友列表</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body style="background: lightblue">
<div class="row" style="height: 80px; background-color: #c1e2b3">
    <div class="col-mid-12" style="text-align: center"><h1>个人相册</h1></div>
</div>
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <ul class="nav navbar-nav">
            <li class="nav-item active"><a href="${pageContext.request.contextPath}/toMain" >相册</a></li>
            <li class="nav-item"><a href="#" >照片</a></li>
            <li class="nav-item"><a href="#" >视频</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-th-large"></span> 应用</a></li>
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-user"></span> 好友列表</a></li>
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-edit"></span> 个人资料</a></li>
        </ul>
    </div>
</nav>
<div class="bodyCss">
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <span style="font-size: 25px;margin-bottom: 10px;">
                好友列表</span>
            <span class="glyphicon glyphicon-plus" style="height: 3px;width: 3px; float: right"></span>

            <ul class="fl">
                <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <label class="control-label">朋友</label>
                    <p>
                        <label class="glyphicon glyphicon-user">&nbsp;库里</label>
                        <span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        <label class="glyphicon glyphicon-user">&nbsp;克莱</label>
                        <span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        <label class="glyphicon glyphicon-user">&nbsp;格林</label>
                        <span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        <label class="glyphicon glyphicon-user">&nbsp;杜兰特</label>
                        <span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                    </p>
                </li>
                <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <label class="control-label">同学</label>
                    <p>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                    </p>
                </li>
                <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <label class="control-label">家人</label>
                    <p>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                        此处填写你的正文<span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                    </p>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
</body>
</html>
