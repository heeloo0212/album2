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
    <script src="../js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/mainCss.css">
    <link href="../css/signin.css" rel="stylesheet" type="text/css">
    <link href="../css/bootstrapValidator.min.css" type="text/css">
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

    $(function() {
    $('#modifyUserPassword').click(function () {
        $('#formModifyPassword').data('bootstrapValidator').validate();//启用验证
        var flag = $('#formModifyPassword').data('bootstrapValidator').isValid()//验
        if(flag){
            var formData = new FormData(document.getElementById("formModifyPassword"));
            $.ajax({
                url:'${pageContext.request.contextPath}/modifyUserPassword',
                type:'post',
                /*data:{
                    'oldPassword':$('#oldPassword').val(),
                    'newPassword':$('#newPassword1').val(),
                },*/
                data:formData,
                dataType:'json',
                success:function(result){
                    if(result.status==1){
                        layer.msg(result.message,{
                            time:2000,
                            skin:'successMsg'
                        },function(){
                            //重新加载数据
                            location.href='${pageContext.request.contextPath}/toIndex';
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
    })
    })

</script>
<body>
<%@ include file="header.jsp" %>
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
                <h3>修改密码</h3>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <form class="form-horizontal" id="formModifyPassword" action="<{:url('modifyUserPassword')}>" type="post">
        <div class="form-group">
            <label class="control-label col-md-3">旧密码:</label>
            <input type="password" id="oldPassword" name="oldPassword" class="form-control col-md-9" placeholder="请输入你的旧密码" style="width: 30%"/><br>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">新密码:</label>
            <input type="password" id="newPassword1" name="newPassword" class="form-control col-md-9" placeholder="请输入你的新密码" style="width: 30%"/><br>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">确认密码:</label>
            <input type="password" id="newPassword2" name="newPassword2" class="form-control col-md-9" placeholder="请输入你的新密码" style="width: 30%"/><br>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-4 col-md-4">
                <button type="button" class="btn btn-warning" id="modifyUserPassword" <%--onclick="modifyUserPassword()"--%>>确认修改</button>
            </div>
        </div>
    </form>
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
<%@ include file="foot.jsp" %>
</body>
<script>
    $(document).ready(function() {
        $('#formModifyPassword').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields:{
                oldPassword:{
                    validators:{
                        notEmpty:{
                            message:"密码不能为空"
                        }
                    }
                },
                newPassword1:{
                    validators:{
                        notEmpty:{
                            message:'密码不能为空'
                        },
                    }
                },
                newPassword2:{
                    validators:{
                        notEmpty:{
                            message:'密码不能为空'
                        },
                        identical: {
                            field: 'newPassword1',
                            message: '密码输入不一致'
                        }
                    }
                }
            }
        })
    })
</script>
</html>
