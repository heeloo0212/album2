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
            <li class="nav-item active"><a href="${pageContext.request.contextPath}/toMain" ><span class="glyphicon glyphicon-home"></span> 相册</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/toShowAllPhotos" ><span class="glyphicon glyphicon-picture"></span> 照片</a></li>
            <li class="nav-item"><a href="#" ><span class="glyphicon glyphicon-facetime-video"></span> 视频</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/getAllFriend"><span class="glyphicon glyphicon-user"></span> 好友列表</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/toPersonInfo"><span class="glyphicon glyphicon-edit"></span> 个人资料</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/deleteSession"><span class="glyphicon glyphicon-off"></span> 退出账号</a></li>
        </ul>
    </div>
</nav>
</body>
</html>
