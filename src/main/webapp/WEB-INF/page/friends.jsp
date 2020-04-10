<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/1
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>好友列表</title>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/layer/layer.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link href="../css/signin.css" rel="stylesheet" type="text/css">
    <link href="../css/chat.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script>
    /*function getFriends(friendGroup) {
        /!*var friendGroup = 'friend';*!/
        console.log(friendGroup);
        $.ajax({
            url:'/getAllFriend',
            type:'post',
            dataType:'json',
            data:{'friendGroup':friendGroup}
        })
    }*/

    //显示确认删除的提示
    function showDeleteModal(id){
        //将id值赋值给div的隐藏域组件
        $('#deleteFriendId').val(id);
        $('#deleteFriendName').text($('#userFriendName').text().trim());
        $('#deleteFriendModal').modal('show');
    }

    function getUser() {
        $.ajax({
            url:'${pageContext.request.contextPath}/getUser',
            type:'post',
            /*dateType:'json',*/
            data:{'name':$('#userName').val()},
            success:function (result) {
                $('#userInfoName').text(result.data.name);
                $('#userInfoSex').text(result.data.sex);
                $('#userInfoAge').text(result.data.age);
                $('#userInfoId').val(result.data.id);
            }
        })
    }

    function addFriend() {
        console.log($('#userInfoId').val());
        $.ajax({
            url:'${pageContext.request.contextPath}/addFriend',
            type:'post',
            dataType:'json',
            data:{'id':$('#userInfoId').val(),
                'friendGroup':$('#friendGroup').val()
            },
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/getAllFriend';
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

    function ModifyValidaMes(userId,friendId) {
        $.ajax({
            url:'${pageContext.request.contextPath}/modifyValidaMes',
            type:'post',
            dataType:'json',
            data:{'userId':userId,
                'friendId':friendId
            },
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/getAllFriend';
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

    function deleteFriend() {
        $.ajax({
            url:'${pageContext.request.contextPath}/deleteFriend',
            type:'post',
            postType:'json',
            data:{'friendId':$('#deleteFriendId').val()},
            success:function(result){
                if(result.status==1){
                    layer.msg(result.message,{
                        time:2000,
                        skin:'successMsg'
                    },function(){
                        //重新加载数据
                        location.href='${pageContext.request.contextPath}/getAllFriend';
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
<body style="background: lightblue">
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
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-th-large"></span> 应用</a></li>
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-user"></span> 好友列表</a></li>
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-edit"></span> 个人资料</a></li>
        </ul>
    </div>
</nav>
<div class="bodyCss">
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <span style="font-size: 25px;margin-bottom: 10px;">
                好友列表</span>
            <span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#addFriendModel" style="height: 3px;width: 3px; float: right" ></span>
            <ul class="fl">
                <li>
                    <input type="checkbox" checked>
                    <i></i>
                    <label class="control-label" id="validaMes" value="classmate">验证消息</label>
                    <p>
                        <c:forEach items="${validaMesList}" var="validaMes">
                            <label>${validaMes.user.name}</label>&nbsp;&nbsp;
                            <%--<label style="height: 2px;width: 2px">--%>
                            <c:if test="${validaMes.user.sex=='男'}"><img src="${pageContext.request.contextPath}/iconfont/性别男.svg" style="width: 2px;height: 2px"></c:if>
                            <c:if test="${validaMes.user.sex=='女'}"><img src="${pageContext.request.contextPath}/iconfont/性别女.svg" style="width: 2px;height: 2px"></c:if>
                            <%--</label>--%>
                            <button class="btn btn-sm btn-success" onclick="ModifyValidaMes(${validaMes.userId},${validaMes.friendId})" style="float: right">添加</button><br>
                        </c:forEach>
                    </p>
                </li>
                <li>
                    <input  <%--onclick="getFriends('friend')"--%> type="checkbox" checked>
                    <i></i>
                    <label class="control-label" id="friend" value="friend">朋友</label>
                    <p>
                        <c:forEach items="${relationList}" var="relation">
                            <c:forEach items="${relation.userList}" var="userFriend">
                                <label class="glyphicon glyphicon-user" id="userFriendName">&nbsp;${userFriend.name}</label>
                                <span class="glyphicon glyphicon-trash" onclick="showDeleteModal(${relation.friendId})" style="float: right"></span>&nbsp;
                                <span class="glyphicon glyphicon-comment" onclick="showMessageModal('${relation.talkRoom}')" style="float: right"></span><br>
                            </c:forEach>
                        </c:forEach>
                    </p>
                </li>
                <li>
                    <input <%--onclick="getFriends('classmate')"--%> type="checkbox" checked>
                    <i></i>
                    <label class="control-label" id="classmate" value="classmate">同学</label>
                    <p>
                        <c:forEach items="${relationList}" var="relation">
                            <c:forEach items="${relation.userList}" var="userFriend">
                                <label class="glyphicon glyphicon-user">&nbsp;${userFriend.name}</label>
                                <span class="glyphicon glyphicon-trash" style="float: right"></span>&nbsp;
                                <span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                            </c:forEach>
                        </c:forEach>
                    </p>
                </li>
                <li>
                    <input <%--onclick="getFriends('family')"--%> type="checkbox" checked>
                    <i></i>
                    <label class="control-label" id="family" id="family">家人</label>
                    <p>
                        <c:forEach items="${relationList}" var="relation">
                            <c:forEach items="${relation.userList}" var="userFriend">
                                <label class="glyphicon glyphicon-user">&nbsp;${userFriend.name}</label>
                                <span class="glyphicon glyphicon-trash" style="float: right"></span>&nbsp;
                                <span class="glyphicon glyphicon-comment" onclick="" style="float: right"></span><br>
                            </c:forEach>
                        </c:forEach>
                    </p>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="addFriendModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加好友
                </h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <div class="form-inline <%--has-feedback--%>">
                    <%--<span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
                    <input type="text" name="userName" id="userName" class="form-control" style="width: 50%" id="userName" placeholder="根据用户名查找用户">
                    <button type="button" class="btn btn-primary" value="查找" onclick="getUser()">查找</button>
                </div>
                <div id="userInfo" class="row">
                    <br>
                    <div class="col-md-3">
                        <label class="control-label">名称:</label><label id="userInfoName" class="control-label"style="font-size: larger;color: #bd2c00"></label>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">性别:</label><label id="userInfoSex" class="control-label" style="font-size: larger;color: #bd2c00"></label>
                    </div>
                    <div class="col-md-2">
                        <label class="control-label">年龄:</label><label id="userInfoAge" class="control-label" style="font-size: larger;color: #bd2c00"></label>
                    </div>
                    <div class="col-md-3">
                        <select class="form-control" name="friendGroup" id="friendGroup">
                            <option value="friend">朋友</option>
                            <option value="family">家人</option>
                            <option value="classmate">同学</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary" onclick="addFriend()">添加</button>
                    </div>
                </div>
                <input type="text" class="hidden" id="userInfoId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 确认删除 start -->
<div class="modal fade" tabindex="-1" id="deleteFriendModal">
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
                <h4>确认要删除<label id="deleteFriendName"></label>吗？</h4>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deleteFriendId">
                <button class="btn btn-primary" onclick="deleteFriend()" data-dismiss="modal">删除</button>
                <button class="btn btn-primary cancel" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- 确认删除 end -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="messageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="">
                    留言框
                </h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <div id="messageBody" style="border: #26337e inset 2px">
                    <div id="getMessage" style="width: 566px;height: 300px;border: #2dc462 inset 1px">
                        <ul class="left">
                            <li style="list-style-type: none">
                                <label class="control-label"> 老王： 很高兴见到你</label>
                            </li>
                        </ul>
                        <br>
                        <ul class="right">
                            <li style="list-style-type: none">
                                <label class="control-label">我也是：小杨</label>
                            </li>
                        </ul>

                    </div>
                    <div style="width: 564px;height: 30px; background: #bce8f1"></div>
                    <div class="row">
                        <div class="col-md-9">
                            <textarea class="form-control" cols="" rows="1" id="sendMes" placeholder="请输入留言内容"></textarea>
                        </div>
                        <div class="col-md-2" style="text-align: center">
                            <button class="btn btn-primary" onclick="" style="position:relative;float: right">发送</button>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    function showMessageModal(talkRoom) {
        console.log(talkRoom);
        $('#messageModel').modal('show');
        /*$.ajax({
            url:'/getMessage',
            type:"post",
            data:{
                'talkRoom':talkRoom,
            },
            success:function (result) {

            }
        })*/
    }
</script>
</body>
</html>
