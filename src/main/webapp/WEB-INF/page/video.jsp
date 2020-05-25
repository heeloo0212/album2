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
        $('#deletePhotoGraphId').val(id);
        $('#deletePhotoGraphModal').modal('show');
    }

    function deletePhotoGraph() {
        $.ajax({
            url:'${pageContext.request.contextPath}/deletePhotoGraph',
            type:'post',
            dateType:'json',
            data:{'id':$('#deletePhotoGraphId').val()},
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/toMain';
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
        <c:forEach items="${videoList}" var="videos"></video>"></video>">
            <div class="col-md-3">
                <div class="panel clear-panel">
                    <div class="panel-body">
                        <video src="" class="imageSize"></video>
                        <br><br>
                        <label>${videos.name}</label>
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
                    <h3>上传视频</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                </div>
                <div class="modal-body ">
                    <div class="form-group">
                        <label for="videoName" class="col-sm-2 control-label">视频名称:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="videoName" name="name" placeholder="请输入视频名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="videoInfo" class="col-sm-2 control-label">视频描述:</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="videoInfo" name="videoInfo" cols="" rows="4" placeholder="请输入视频信息"></textarea>
                        </div>
                    </div>
                    <div id="Pic_pass">
                        <p style="font-size: 20px;font-weight: bold;">请上传单个视频 </p>
                        <p><span style="color: red">注：上传小于100M的视频</span></p>
                        <div class="picDiv">
                            <div class="addImages">
                                <input type="file" class="file" id="fileInput" name="file" multiple="multiple" accept="">
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
                        上传照片/视频
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>

<!--修改模态框-->
<div class="modal fade" id="modifyPhotoGraphModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content form-horizontal">
            <div class="modal-header">
                <label>修改相册</label>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body ">
                <div class="form-group">
                    <label for="modifyGraphName" class="col-sm-2 control-label">相册名:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="modifyGraphName" name="name" placeholder="请输入相册名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="modifyGraphDesc" class="col-sm-2 control-label">相册描述:</label>
                    <div class="col-sm-6">
                        <textarea class="form-control" id="modifyGraphDesc" name="description" cols="" rows="4" placeholder="请输入相册描述"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="modifyGraphType" name="type" onchange="">
                            <option value="love">最爱</option>
                            <option value="scenery">风景</option>
                            <option value="personPhoto">个人照</option>
                            <option value="active">活动</option>
                            <option value="family">家人</option>
                            <option value="animal">动物</option>
                            <option value="other">其他</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">权限:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="modifyPermission" name="permission" onchange="">
                            <option value="everybody">所有人可见</option>
                            <option value="oneself">仅自己能见</option>
                            <option value="friend">仅好友能见</option>
                        </select>
                    </div>
                </div>
                <input type="hidden" id="modifyPhotoGraphId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary cancel" data-dismiss="modal">
                    取消
                </button>
                <button type="button" class="btn btn-primary" onclick="modifyPhotoGraph()" data-dismiss="modal">
                    修改相册
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 确认删除 start -->
<div class="modal fade" tabindex="-1" id="deletePhotoGraphModal">
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
                <input type="hidden" id="deletePhotoGraphId">
                <button class="btn btn-primary" onclick="deletePhotoGraph()" data-dismiss="modal">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除 end -->
</body>
</html>