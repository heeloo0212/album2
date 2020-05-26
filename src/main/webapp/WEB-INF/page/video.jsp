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
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/mainCss.css">
    <link href="../css/signin.css" rel="stylesheet" type="text/css">
</head>
<script>


    //显示确认删除的提示
    function showDeleteModal(id){
        //将id值赋值给div的隐藏域组件
        $('#deleteVideoId').val(id);
        $('#deleteVideoModal').modal('show');
    }

    function deleteVideo() {
        $.ajax({
            url:'${pageContext.request.contextPath}/deleteVideo',
            type:'post',
            dateType:'json',
            data:{'id':$('#deleteVideoId').val()},
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/getVideo';
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
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#upModal"><i class="glyphicon glyphicon-open"></i>上传视频</button>
    <br><br>
    <div style="position: relative" class="row">
        <c:forEach items="${videoList}" var="videos">
            <div class="col-md-3">
                <div class="panel clear-panel">
                    <div class="panel-body">
                        <video src="${videos.videoAddress}" controls="controls"  muted="muted" class="imageSize"></video>
                        <br><br>
                        <label>${videos.name}</label>
                        <button onclick="showDeleteModal(${videos.id})" class="btn btn-danger btn-sm pull-right"><i class="glyphicon glyphicon-trash"></i></button>
                    </div>
                    <div class="panel-footer right">
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
</div>

<!-- 上传模态框（Modal） -->
<div class="modal fade" id="upModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form class="form-horizontal" role="form" action="/addVideo" enctype="multipart/form-data" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">上传视频</h4>
                </div>
                <div class="modal-body ">
                    <div class="form-group">
                        <label for="videoName" class="col-sm-2 control-label">视频名称:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="videoName" name="name" placeholder="请输入视频名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="info" class="col-sm-2 control-label">视频描述:</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="info" name="info" cols="" rows="4" placeholder="请输入视频信息"></textarea>
                        </div>
                    </div>
                    <div id="Pic_pass">
                        <p style="font-size: 20px;font-weight: bold;">请上传单个视频 </p>
                        <p><span style="color: red">注：上传小于100M的视频</span></p>
                        <div class="picDiv">
                            <div class="addImages" id="videoPic">
                                <input type="file" class="file" id="videoFile" name="videoFile" multiple="multiple" accept="">
                                <div class="text-detail">
                                    <span>+</span>
                                    <p>点击上传</p>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="msg" style="display: none;"></div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" >
                        上传视频
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>

<!-- 确认删除 start -->
<div class="modal fade" tabindex="-1" id="deleteVideoModal">
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
                <h4>确认要删除该视频吗？</h4>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deleteVideoId">
                <button class="btn btn-primary" onclick="deleteVideo()" data-dismiss="modal">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除 end -->

<script type="text/javascript">
    $("#videoFile").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;
        var videoHtml = "<video style='height:auto;' poster='" + objUrl + "' controls='controls'/>"
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#videoPic").prepend(videoHtml);
        }
    }) ;
    //建立一个可存取到该file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
</body>
</html>