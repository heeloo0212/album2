<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/31
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/mainCss.css">
    <link href="../css/signin.css" rel="stylesheet" type="text/css">
</head>
<script>
    function modifyUser() {
        $.ajax({
            url:'${pageContext.request.contextPath}/modifyUser',
            type:'post',
            dataType:'json',
            data:{'id':$('userId').val(),
                'name':$('#name').val(),
                'email':$('#email').val(),
                'age':$('#age').val(),
                'sex':$('#sex').val()
            },
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/toPersonInfo';
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
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-th-large"></i> 应用</a></li>
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-user"></i> 好友列表</a></li>
            <li class="nav-item"><a href="#"><i class="glyphicon glyphicon-edit"></i> 个人资料</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>基本资料</h3>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-md-3">账号名:</label>
                <input type="text" id="name" name="name" class="form-control col-md-9" placeholder="${user.name}" style="width: 30%"/><br>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">邮箱:</label>
                <input type="text" id="email" name="email" class="form-control col-md-9" placeholder="${user.email}" style="width: 30%"/><br>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">年龄:</label>
                <input type="text" id="age" name="age" class="form-control col-md-9" placeholder="${user.age}" style="width: 30%"/><br>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">性别:</label>
                <input type="radio" name="sex" value="男" checked="true"/><label>男</label>
                <input type="radio" name="sex" value="女"/><label>女</label>
                <%--<input type="hidden" id="userId" value="${user.id}">--%>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-4 col-md-4">
                    <button type="button" class="btn btn-warning" onclick="modifyUser()">确认修改</button>
                </div>
            </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="page-header" style="margin-bottom: 0px;">
                <h3>修改头像</h3>
            </div>
        </div>
    </div>
    <form action="updateCustomerPhoto" class="form-horizontal">
        <div class="form-group">
            <label for="address" class="col-md-2   col-sm-2  control-label">选择头像:</label>
            <div class="col-md-10 col-sm-10">
                <img src="images/add.png" id="showImg" class="togeImg" onclick="openFile()" alt="" width="100" height="100">
                <input id="file" type="file" style="display: none;" name="imgName" />
                <script>
                    function openFile() {
                        $("#file").click();
                    }
                    $('#file').change(function() {
                        $("#showImg").attr("src", window.URL.createObjectURL(this.files[0]));
                    });
                </script>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-warning">确认修改</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
