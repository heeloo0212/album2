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
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-edit"></i> 反馈</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-open"></i>上传相册/视频</button>
    <button type="button" class="btn">创建相册</button>
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

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>

            </div>
            <div class="modal-body firstModelBody" >
                <div class="form-group">
                    <label class="col-sm-2 control-label" style="text-align: center">上传</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="" name="" onchange="">
                            <option>旅游1</option>
                            <option>旅游2</option>
                            <option>旅游3</option>
                            <option>旅游4</option>
                            <option>旅游5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>