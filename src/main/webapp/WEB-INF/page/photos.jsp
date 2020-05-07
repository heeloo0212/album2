<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/30
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/21
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>个人相册主页</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="../layer/layer.js"></script>
    <script src="../js/viewer.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/mainCss.css">
    <link href="../css/signin.css" rel="stylesheet" type="text/css">
    <link href="../css/viewer.min.css" rel="stylesheet">
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

    //显示确认删除的提示
    function showDeleteModal(id){
        //将id值赋值给div的隐藏域组件
        $('#deletePhotoId').val(id);
        $('#deletePhotoModal').modal('show');
    }

    function deletePhoto() {
        $.ajax({
            url:'${pageContext.request.contextPath}/deletePhoto',
            type:'post',
            dateType:'json',
            data:{'id':$('#deletePhotoId').val()},
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:10,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/getPhotos?gid='+${gid};
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

</script>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="row">
        <ul id="images">
            <c:forEach items="${photoList}" var="photo">
            <div class="col-md-3">
                <li><img src="${pageContext.request.contextPath}/${photo.image}" class="imageSize img-thumbnail"></li>
                <div class="checkbox">
                    <label><input type="checkbox" class=""></label>
                    <button onclick="showDeleteModal(${photo.id})" class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i></button>
                </div>
            </div>
            </c:forEach>
        </ul>
    </div>
</div>

<!-- 确认删除 start -->
<div class="modal fade" tabindex="-1" id="deletePhotoModal">
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
                <h4>确认要删除该照片吗？</h4>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deletePhotoId">
                <button class="btn btn-primary" onclick="deletePhoto()" data-dismiss="modal">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除 end -->

</body>
<script>
    var viewer = new Viewer(document.getElementById('images'));
</script>
</html>