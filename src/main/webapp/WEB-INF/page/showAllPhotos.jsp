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
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
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
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-th-large"></span> 应用</a></li>
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-user"></span> 好友列表</a></li>
            <li class="nav-item"><a href="#"><span class="glyphicon glyphicon-edit"></span> 个人资料</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div id="main">
        <div id="list">
            <ul>
                <li>
                    <div class="po-avt-wrap">
                        <h3>2020/4/1 16:55</h3>
                    </div>
                    <div class="po-cmt">
                        <div class="po-hd">
                            <p class=""><span class="data-name po-name">万虎科技~贾素杰</span>&nbsp;<span>上传图片</span></p>
                            <div class="post">
                                <p>
                                    <img class="list-img" src="images/jt1.jpg" style="height: 80px;">
                                    <img class="list-img" src="images/yt3.jpg" style="height: 80px;">
                                    <img class="list-img data-avt" src="images/0.jpg" style="height: 80px;">
                                </p>
                            </div>
                            <p class="time">刚刚</p><img class="c-icon" src="images/c.png">
                        </div>
                        <div class="r"></div>
                        <div class="cmt-wrap">
                            <div class="like"><img src="images/l.png">苍井空，陈冠希，杨幂，王思聪，陈赫，刘德华，马云...</div>
                            <div class="cmt-list">
                                <p><span>wu世勋-EXO：</span>나는 서명～</p>
                                <p><span>鹿晗：</span>我们在国内冻成狗，我也想跟哥您去热热～</p>
                                <p><span>权志龙：</span>나는 서명～</p>
                                <p><span>王思聪：</span>去哪玩啊？那么爽</p>
                                <p>
                                    <span class="data-name">万虎科技~贾素杰</span>
                                    回复
                                    <span>
                                            王思聪
                                        </span>
                                    <span>
                                            ：
                                        </span>
                                    澳洲大堡礁，这边刚好是夏季，挺适合避寒的。
                                </p>
                                <p><span>杨幂：</span>😘私人飞机出行，求带上我～</p>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="po-avt-wrap">
                        <h3>2020/4/1 16:55</h3>
                    </div>
                    <div class="po-cmt">
                        <div class="po-hd">
                            <p class="po-name">
                                王思聪
                            </p>
                            <div class="post">
                                <img class="list-img" src="images/xa1.jpg" style="height: 80px;">
                                <img class="list-img" src="images/ma1.jpg" style="height: 80px;">
                                <img class="data-avt list-img" src="images/0.jpg" style="height: 80px;">
                            </div>
                            <p class="time">
                                1分钟前
                            </p>
                            <img class="c-icon" src="images/c.png">
                        </div>
                        <div class="r">
                        </div>
                        <div class="cmt-wrap">
                            <div class="like">
                                <img src="images/l.png">
                                鹿晗，林更新，杨幂，angelababy，范冰冰...
                            </div>
                            <div class="cmt-list">
                                <p>
                                        <span>
                                            鹿晗：
                                        </span>
                                    赞！
                                </p>
                                <p>
                                    <span class="data-name">万虎科技~贾素杰</span>
                                    <span>
                                            ：
                                        </span>
                                    低调低调。。
                                </p>
                                <p>
                                        <span>
                                            王思聪
                                        </span>
                                    回复
                                    <span class="data-name">万虎科技~贾素杰</span>
                                    <span>
                                            ：
                                        </span>
                                    哥您就是太低调了
                                </p>
                                <p>
                                        <span>
                                            习
                                        </span>
                                    回复
                                    <span class="data-name">万虎科技~贾素杰</span>
                                    <span>
                                            ：
                                        </span>
                                    好几天没见，我们该聚聚了
                                </p>
                                <p>
                                        <span>
                                            马云
                                        </span>
                                    回复
                                    <span class="data-name">万虎科技~贾素杰</span>
                                    <span>
                                            ：
                                        </span>
                                    有笔大生意找你聊聊
                                </p>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="po-avt-wrap">
                        <h3>2020/4/1 16:55</h3>
                    </div>
                    <div class="po-cmt">
                        <div class="po-hd">
                            <p class="po-name">
                                苍井空
                            </p>
                            <p class="post">
                                <img src="images/c1.jpg">
                            </p>
                            <p class="time">
                                2分钟前
                            </p>
                            <div class="r">
                            </div>
                            <div class="cmt-wrap">
                                <div class="like">
                                    <img src="images/l.png">
                                    陈赫，叫兽易小星，王思聪，陈冠希，余文乐...
                                </div>
                                <div class="cmt-list">
                                    <p>
                                            <span>
                                                陈赫：
                                            </span>
                                        怪我咯~
                                    </p>
                                    <p>
                                            <span>
                                                陈冠希：
                                            </span>
                                        怪我咯~
                                    </p>
                                    <p>
                                        <span class="data-name">万虎科技~贾素杰</span>
                                        <span>
                                                ：
                                            </span>
                                        怪我咯~
                                    </p>
                                    <p>
                                            <span>
                                                苍井空
                                            </span>
                                        回复
                                        <span class="data-name">万虎科技~贾素杰</span>
                                        <span>
                                                ：
                                            </span>
                                        知道就好！
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div></li>
            </ul>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>
