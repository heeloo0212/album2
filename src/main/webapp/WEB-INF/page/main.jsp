<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/21
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>个人相册主页</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/mainCss.css">
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
        <div class="col-md-3">
            <div class="panel clear-panel">
                <div class="panel-body">
                    <img src="../images/女包.webp.jpg" class="imageSize">
                    <br><br>
                    <div>好看的相册</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel clear-panel">
                <div class="panel-body">
                    <img src="../images/男卫衣.jpg" class="imageSize">
                    <br><br>
                    <div>好看的相册</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel clear-panel">
                <div class="panel-body">
                    <img src="../images/羊毛衫.jpg" class="imageSize">
                    <br><br>
                    <div>好看的相册</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel clear-panel">
                <div class="panel-body">
                    <img src="../images/美女的羊毛衫.jpg" class="imageSize">
                    <br><br>
                    <div>好看的相册</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 上传模态框（Modal） -->
<div class="modal fade" id="upModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类:</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="graph" name="" onchange="">
                            <option>相册1</option>
                            <option>相册1</option>
                            <option>相册1</option>
                            <option>相册1</option>
                            <option>相册1</option>
                            <option>相册1</option>
                            <option>相册1</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-body ">
                <div class="" align="center">
                <button type="button" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-picture"></i>上传相册/视频</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">
                    上传照片/视频
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--创建模态框-->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <label>创建相册</label>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body ">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="graphName" class="col-sm-2 control-label">相册名:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="graphName" placeholder="请输入相册名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="graphDesc" class="col-sm-2 control-label">相册描述:</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="graphDesc" cols="" rows="4" placeholder="请输入相册描述"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类:</label>
                        <div class="col-sm-3">
                            <select class="form-control" id="graphType" name="" onchange="">
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
                        <select class="form-control" id="permission" name="" onchange="">
                            <option>所有人可见</option>
                            <option>仅自己能见</option>
                            <option>仅好友能见</option>
                        </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success">
                    取消
                </button>
                <button type="button" class="btn btn-primary">
                    创建相册
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>