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
    <script src="../js/bootstrap.js"></script>
    <script src="../js/viewer.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link href="../css/signin.css" rel="stylesheet" type="text/css">
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
            }else{
                alert("请输入评论内容")
            }
        })
    }

    //显示确认删除的提示
    function showDeleteModal(id){
        //将id值赋值给div的隐藏域组件
        $('#deleteActiveId').val(id);
        $('#deleteActiveModal').modal('show');
    }

    function deleteActive() {
        $.ajax({
            url:'${pageContext.request.contextPath}/deleteActive',
            type:'post',
            postType:'json',
            data:{'id':$('#deleteActiveId').val()},
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/toShowAllPhotos?pageNum=1&&pageSize=10';
                    })
                }else{
                    layer.msg(result.message,{
                        time:2000,
                        skin:'errorsMsg'
                    })
                }
            }
        })
    }


    function clickActive(id) {
        var clickClass = $('#activeLike'+id).attr('class');
        console.log(clickClass);
        if(clickClass == 'glyphicon glyphicon-heart-empty'){
            $.ajax({
                url:'${pageContext.request.contextPath}/addClick',
                type:'post',
                postType:'json',
                data:{'id':id},
                success:function(result){
                    if(result.status==1){
                        console.log(result.data.click)
                        $('#clickNum'+id).html(result.data.click);
                        $('#activeLike'+id).attr('class',"glyphicon glyphicon-heart");
                    }
                }
            })
        }
    }

</script>
<body>
<%@ include file="header.jsp" %>

<div class="container">
    <div id="main">
        <form class="form-inline" action="${pageContext.request.contextPath}/toShowAllPhotos?pageNum=1&&pageSize=10" method="post" id="frmSearch">
            <div class="form-group">
                <input type="text" class="form-control" id="userName" placeholder="请输入用户名" name="userName" value="">
            </div>
            <input type="submit" value="查询" class="btn btn-primary" id="doSearch">
        </form>
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
                            <c:if test="${active.userName.equals(user.name)}"><i onclick="showDeleteModal(${active.id})" class="c-icon glyphicon glyphicon-trash"></i></c:if>
                            <div class="post">
                                <p>
                                    <c:forEach items="${active.showPhotoList}" var="photo">
                                       <img class="list-img" src="${photo.image}" style="height: 80px;">
                                    </c:forEach>
                                </p>
                            </div>
                            <%--<p class="time">刚刚</p>--%>
                            <i id="activeLike${active.id}" class="glyphicon glyphicon-heart-empty" onclick="clickActive(${active.id})">&nbsp;</i><span id="clickNum${active.id}">${active.click}</span>
                            <img class="c-icon" src="images/c.png" onclick="showAddComment(${active.id},'null')">
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
                        </div>
                    </div>

                </li>
                </c:forEach>
            </ul>
            <br><br>
            <div style="text-align: center">
            <ul >
                <a href="/toShowAllPhotos?pageNum=${pageInfo.prePage}&&pageSize=10">上一页</a>
                <a href="/toShowAllPhotos?pageNum=${pageInfo.nextPage}&&pageSize=10">下一页</a>
                总页数：${pageInfo.pages} 当前页：${pageInfo.pageNum}
            </ul>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>
<!-- 确认删除 start -->
<div class="modal fade" tabindex="-1" id="deleteActiveModal">
    <!-- 窗口声明 -->
    <div class="modal-dialog">
        <!-- 内容声明 -->
        <div class="modal-content">
            <!-- 头部、主体、脚注 -->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">提示消息</h4>
            </div>
            <div class="modal-body text-center">
                <h4>确认要删除这条动态吗？</h4>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deleteActiveId">
                <button class="btn btn-primary" onclick="deleteActive()" data-dismiss="modal">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除 end -->
<script>
    /*var viewer = new Viewer(document.getElementById('photos'));*/
</script>
</body>
</html>
