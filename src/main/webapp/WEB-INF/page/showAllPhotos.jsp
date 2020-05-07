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
    <script src="../js/viewer.min.js"></script>
    <link rel="stylesheet" href="../css/viewer.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<style>
    li{
        list-style-type: none;
    }
    * { margin: 0; padding: 0;}
    #jqhtml { width: 700px; margin: 0 auto; font-size: 0;}
    #jqhtml li { display: inline-block; width: 32%; margin-left: 1%; padding-top: 1%;}
    #jqhtml li img { width: 100%;}
</style>
<script>
    function showAddComment(id,commentorName){
        var activeId = id;
        var beCommentor = commentorName;
        var commentor = '${user.name}';
        $('#addComment'+activeId).toggle();
        $('#addCommentBtn'+activeId).click(function () {
            var content = $('#CommentCon'+activeId).val();
            var appendContent = "<p>" + "<span>" + commentor + ": </span>" + content + "</p>";
            var applyContent = "<p><span>" + commentor + "</span>回复<span>" + beCommentor + ": </span>" + content + "</p>";
            if(content != null && content != ''){
                $.ajax({
                    url:'${pageContext.request.contextPath}/addComment',
                    type:'post',
                    dataType:'json',
                    data:{
                        'activeId':activeId,
                        'beCommentor':beCommentor,
                        'content':content
                    },
                    success:function (result) {
                        if(result.status==1){
                            if(result.data.status == 1) {
                                $('#cmt-list' + activeId).append(appendContent);
                                $('#addComment'+activeId).toggle();
                            }else if(result.data.status == 0){
                                $('#cmt-list' + activeId).append(applyContent);
                                $('#addComment'+activeId).toggle();
                            }
                        }else{
                            alert("请输入正确的评论内容");
                        }
                    }
                })
            }
        })
    }

    function applyComment() {
        $('#applyContent').toggle();
    }

</script>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div id="main">
        <div>
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
                                </p>
                            </div>
                            <%--<p class="time">刚刚</p>--%><img class="c-icon" src="images/c.png" onclick="showAddComment(${active.id},'null')">
                        </div>
                        <div class="r"></div>
                        <div class="cmt-wrap">
                            <div class="cmt-list" id="cmt-list${active.id}">
                                <c:forEach items="${active.commentList}" var="comment">
                                   <c:if test="${comment.status==1}">
                                        <p>
                                            <span onclick="showAddComment(${active.id},'${comment.commentor}')">${comment.commentor}:</span> ${comment.content}
                                        </p>
                                    </c:if>
                                    <c:if test="${comment.status!=1}">
                                        <p>
                                            <span onclick="showAddComment(${active.id},'${comment.commentor}')">${comment.commentor}</span>回复<span>${comment.beCommentor}:</span> ${comment.content}
                                        </p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="row" id="addComment${active.id}" style="display:none">
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="CommentCon${active.id}" placeholder="请输入你的评论内容">
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-sm btn-primary" id="addCommentBtn${active.id}">评论</button>
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
    /*var viewer = new Viewer(document.getElementById('photos'));*/
</script>
</body>
</html>
