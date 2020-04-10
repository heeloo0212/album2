<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/1
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的朋友圈</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="css/app.css">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<script>
    function showAddComment(id,commentorName){
        var activeId = id;
        var beCommentor = commentorName;
        console.log(beCommentor);
        $('#addComment'+activeId).toggle();
    }

    function applyComment() {
        $('#applyContent').toggle();
    }

</script>
<body>
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
<div class="container">
    <div id="main">
        <div id="list">
            <ul>
                <c:forEach items="${activeList}" var="active">
                <li>
                    <div class="po-avt-wrap">
                        <h3><fmt:formatDate value="${active.createTime}" pattern="yyyy-MM-dd HH:mm"/></h3>
                    </div>
                    <div class="po-cmt">
                        <div class="po-hd">
                            <p class=""><span class="data-name po-name">${active.userName}</span>&nbsp;<span>上传图片到:《${active.graphName}》</span></p>
                            <div class="post">
                                <p>
                                    <c:forEach items="${active.showPhotoList}" var="photo">
                                       <img class="list-img" src="${photo.image}" style="height: 80px;">
                                    </c:forEach>
                                    <%--<img class="list-img" src="images/yt3.jpg" style="height: 80px;">
                                    <img class="list-img data-avt" src="images/0.jpg" style="height: 80px;">--%>
                                </p>
                            </div>
                            <p class="time">刚刚</p><img class="c-icon" src="images/c.png" onclick="showAddComment(${active.id},'${active.userName}')">
                        </div>
                        <div class="r"></div>
                        <div class="cmt-wrap">
                            <div class="cmt-list">
                                <c:forEach items="${active.commentList}" var="comment">
                                   <c:if test="${comment.status==1}">
                                        <p>
                                            <span<%-- onclick="applyComment()"--%>>${comment.commentor}:</span> ${comment.content}
                                        </p>
                                    </c:if>
                                    <c:if test="${comment.status!=1}">
                                        <p>
                                            <span>${comment.commentor}</span>回复<span>${comment.beCommentor}:</span> ${comment.content}
                                        </p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="row" id="addComment${active.id}" style="display:none">
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="CommentCon" placeholder="请输入你的评论内容">
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-sm btn-primary" onclick="">评论</button>
                                </div>
                            </div>
                            <%--<div class="row" id="applyContent" style="display:none">
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="applyCommentCon" placeholder="回复他">
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-sm btn-primary" onclick="">评论</button>
                                </div>
                            </div>--%>
                        </div>
                    </div>

                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>
