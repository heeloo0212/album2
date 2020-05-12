<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/7
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row" style="height: 120px; background: url(../images/head2.jpg) no-repeat;background-size: 100% 100%">
    <div class="col-mid-12" style="text-align: center"><h1>个人相册</h1></div>
</div>
<nav class="navbar navbar-default" role="navigation">
    <div class="container">

        <ul class="nav navbar-nav">
            <li class="nav-item active"><a href="${pageContext.request.contextPath}/toMain" ><i class="glyphicon glyphicon-home"></i> 相册</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/toShowAllPhotos" ><i class="glyphicon glyphicon-picture"></i> 照片</a></li>
            <li class="nav-item"><a href="#" ><i class="glyphicon glyphicon-facetime-video"></i> 视频</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-th-large"></i> 应用</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/getAllFriend"><i class="glyphicon glyphicon-user"></i> 好友列表</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/toPersonInfo"><i class="glyphicon glyphicon-edit"></i> 个人资料</a></li>
        </ul>
    </div>
</nav>
</body>
</html>
