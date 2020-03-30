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
<body>
<div class="row" style="height: 80px; background-color: #c1e2b3">
    <div class="col-mid-12" style="text-align: center"><h1>个人相册</h1></div>
</div>


<nav class="navbar navbar-default" role="navigation">
    <div class="container">

        <ul class="nav navbar-nav">
            <li class="nav-item active"><a href="#" >相册</a></li>
            <li class="nav-item"><a href="#" >照片</a></li>
            <li class="nav-item"><a href="#" >视频</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-th-large"></i> 应用</a></li>
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-trash"></i> 回收站</a></li>
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-edit"></i> 个人资料</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#upModal"><i class="glyphicon glyphicon-open"></i>上传相册/视频</button>
    <button type="button" class="btn" data-toggle="modal" data-target="#createModal">创建相册</button>
    <button type="button" class="btn">展示设置</button>
    <br><br>
    <div style="position: relative" class="row">
        <c:forEach items="${photoGraphList}" var="photoGraph">
        <div class="col-md-3">
            <div class="panel clear-panel">
                <div class="panel-body">
                    <img src="${pageContext.request.contextPath}/${photoGraph.image}" class="imageSize">
                    <br><br>
                    <div>${photoGraph.description}</div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>

<!-- 上传模态框（Modal） -->
<div class="modal fade" id="upModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/addPhoto" enctype="multipart/form-data" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类:</label>
                    <div class="col-sm-6">
                        <select class="form-control input-md" id="graphId" name="photoGraph.id" onchange="">
                            <c:forEach items="${photoGraphList}" var="photoGraph">
                                <option value="${photoGraph.id}" name="photoGraphId">${photoGraph.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-body ">
                <div id="Pic_pass">
                    <p style="font-size: 20px;font-weight: bold;">请上传照片 </p>
                    <p><span style="color: red">注：每张照片大写不可超过4M，且最多可以传十张</span></p>
                    <div class="picDiv">
                        <div class="addImages">
                            <input type="file" class="file" id="fileInput" name="file" multiple="multiple" accept="image/png, image/jpeg, image/gif, image/jpg">
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
                <button type="submit" class="btn btn-primary">
                    上传照片/视频
                </button>
            </div>
        </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<!--创建模态框-->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/addPhotograph" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <label>创建相册</label>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body ">

                    <div class="form-group">
                        <label for="graphName" class="col-sm-2 control-label">相册名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="graphName" name="name" placeholder="请输入相册名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="graphDesc" class="col-sm-2 control-label">相册描述:</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="graphDesc" name="description" cols="" rows="4" placeholder="请输入相册描述"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类:</label>
                        <div class="col-sm-3">
                            <select class="form-control" id="graphType" name="type" onchange="">
                                <option>最爱</option>
                                <option>风景</option>
                                <option>个人照</option>
                                <option>活动</option>
                                <option>家人</option>
                                <option>动物</option>
                                <option>其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">权限:</label>
                        <div class="col-sm-4">
                        <select class="form-control" id="permission" name="permission" onchange="">
                            <option>所有人可见</option>
                            <option>仅自己能见</option>
                            <option>仅好友能见</option>
                        </select>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success">
                    取消
                </button>
                <button type="submit" class="btn btn-primary">
                    创建相册
                </button>
            </div>
        </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>

<script>
    //图片上传预览功能
    var userAgent = navigator.userAgent; //用于判断浏览器类型

    $(".file").change(function() {
        //获取选择图片的对象
        var docObj = $(this)[0];
        var picDiv = $(this).parents(".picDiv");
        //得到所有的图片文件
        var fileList = docObj.files;
        //循环遍历
        for (var i = 0; i < fileList.length; i++) {
            //动态添加html元素
            var picHtml = "<div class='imageDiv' > <img id='img" + fileList[i].name + "' /> <div class='cover'><i class='delbtn'>删除</i></div></div>";
            console.log(picHtml);
            picDiv.prepend(picHtml);
            //获取图片imgi的对象
            var imgObjPreview = document.getElementById("img" + fileList[i].name);
            if (fileList && fileList[i]) {
                //图片属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '160px';
                imgObjPreview.style.height = '130px';
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要以下方式
                if (userAgent.indexOf('MSIE') == -1) {
                    //IE以外浏览器
                    imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]); //获取上传图片文件的物理路径;
                    console.log(imgObjPreview.src);
                    // var msgHtml = '<input type="file" id="fileInput" multiple/>';
                } else {
                    //IE浏览器
                    if (docObj.value.indexOf(",") != -1) {
                        var srcArr = docObj.value.split(",");
                        imgObjPreview.src = srcArr[i];
                    } else {
                        imgObjPreview.src = docObj.value;
                    }
                }
            }
        }

        /*删除功能*/
        $(".delbtn").click(function() {
            var _this = $(this);
            _this.parents(".imageDiv").remove();
        });
    });
</script>
</body>
</html>