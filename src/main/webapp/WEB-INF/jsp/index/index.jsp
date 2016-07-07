<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/7
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>ForDownload</title>
    <link rel="stylesheet" type="text/css" href="ui/semantic.min.css">

    <style type="text/css">

        .hidden.menu {
            display: none;
        }

        .masthead.segment {
            min-height: 700px;
            padding: 1em 0em;
        }

        .masthead .logo.item img {
            margin-right: 1em;
        }

        .masthead .ui.menu .ui.button {
            margin-left: 0.5em;
        }

        .masthead h1.ui.header {
            margin-top: 3em;
            margin-bottom: 0em;
            font-size: 3em;
            font-weight: normal;
        }

        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }

        .ui.vertical.stripe {
            padding: 8em 0em; /*距离黑框的距离*/
        }

        .ui.vertical.stripe h3 {
            font-size: 2em; /*每个标题字体的大小*/
        }

        .ui.vertical.stripe p + h3 {
            margin-top: 3em;
        }

        .ui.vertical.stripe .floated.image {
            clear: both;
        }

        .ui.vertical.stripe p {
            font-size: 1.33em; /*每个段落字体的大小*/
        }

        .ui.vertical.stripe .horizontal.divider {
            margin: 3em 0em;
        }

        .quote.stripe.segment {
            padding: 0em;
        }

        .quote.stripe.segment .grid .column {
            padding-top: 5em;
            padding-bottom: 5em;
        }

        .footer.segment {
            padding: 5em 0em;
        }

        .secondary.pointing.menu .toc.item {
            display: none;
        }

        @media only screen and (max-width: 700px) {
            .ui.fixed.menu {
                display: none !important;
            }

            .secondary.pointing.menu .item,
            .secondary.pointing.menu .menu {
                display: none;
            }

            .secondary.pointing.menu .toc.item {
                display: block;
            }

            .masthead.segment {
                min-height: 350px;
            }

            .masthead h1.ui.header {
                font-size: 2em;
                margin-top: 1.5em;
            }

            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }


    </style>

    <script src="ui/jquery.min.js"></script>
    <script src="ui/semantic.min.js"></script>
    <script>
        $(document)
                .ready(function () {

                    // fix menu when passed
                    $('.masthead')
                            .visibility({
                                once: false,
                                onBottomPassed: function () {
                                    $('.fixed.menu').transition('fade in');
                                },
                                onBottomPassedReverse: function () {
                                    $('.fixed.menu').transition('fade out');
                                }
                            })
                    ;

                    // create sidebar and attach to menu open
                    $('.ui.sidebar')
                            .sidebar('attach events', '.toc.item')
                    ;

                    $('.ui.dropdown')
                            .dropdown({
                                on: 'hover'
                            })
                    ;

                })
        ;
    </script>
</head>
<body>
<!-- Following Menu -->
<div class="ui large top fixed hidden menu">
    <div class="ui container">
        <div class="item">
            <img src="images/logo.png">
        </div>
        <a class="active item">ForDownload</a>
        <div class="right menu">
            <a class="item" href="grade.html">班级</a>
            <a class="item">团队</a>
            <a class="item">博客</a>
            <a class="item">赵银</a>
            <div class="item">
                <a class="ui button">登 录</a>
            </div>
            <div class="item">
                <a class="ui primary button">注 册</a>
            </div>
            <div class="item">
                <a class="ui black button">退 出</a>
            </div>
        </div>
    </div>
</div>

<!-- Sidebar Menu -->
<div class="ui vertical inverted sidebar menu">
    <div class="item">
        <img src="images/logo.png">
    </div>
    <a class="active item">ForDownload</a>
    <a class="item" href="grade.html">班级</a>
    <a class="item">团队</a>
    <a class="item">博客</a>
    <a class="item">设置</a>
    <a class="item">退出</a>
    <a class="item">登录</a>
    <a class="item">注册</a>
</div>

<!-- Page Contents -->
<div class="pusher">
    <div class="ui inverted vertical masthead center aligned segment">
        <div class="ui container">
            <div class="ui large secondary inverted pointing menu">
                <a class="toc item">
                    <i class="sidebar icon"></i>
                </a>
                <div class="item">
                    <img src="images/logo.png">
                </div>
                <a class="active item">ForDownload</a>
                <div class="right item">
                    <a class="item" href="grade.html">班级</a>
                    <a class="item">团队</a>
                    <a class="item">博客</a>
                    <a class="item">赵银</a>
                    <a class="ui inverted button" href="login.html">登 录</a>
                    <a class="ui inverted button">注 册</a>
                    <a class="ui inverted button">退 出</a>
                </div>
            </div>
        </div>

        <div class="ui text container">
            <h1 class="ui inverted header">
                欢迎进入资源管理系统！
            </h1>
            <h2>海量资源，即时体验</h2>
            <div class="ui huge primary button">开始体验 <i class="right arrow icon"></i></div>
        </div>
    </div>

    <div class="ui vertical stripe segment">
        <div class="ui middle aligned stackable grid container">
            <div class="row">
                <div class="eight wide column">
                    <h3 class="ui header">班级模块</h3>
                    <p>资源管理系统为班级提供了一个班级模块，它就类似于我们使用的”网盘“一样，该班级的所有用户都可以从"网盘"中上传和下载所需文件。 因此使用该系统的用户可以共享班级资源，
                        这样就大大提高了用户的使用和分享资源的效率。</p>
                </div>
                <div class="six wide right floated column">
                    <img src="images/company.jpg" class="ui large bordered rounded image">
                </div>
            </div>
        </div>
    </div>


    <div class="ui vertical stripe segment">
        <div class="ui middle aligned stackable grid container">
            <div class="row">
                <div class="six wide right floated column">
                    <img src="images/company.jpg" class="ui large bordered rounded image">
                </div>
                <div class="eight wide column">
                    <h3 class="ui header">团队模块</h3>
                    <p> 资源管理系统为班级里面的每个小组提供了一个团队模块，这个模块主要是为了帮助每个组长管理他们的团队资源。
                        组长和每个组员都可以共享团队模块的资源。同时也可以从团队模块里面上传和下载所需文件。</p>
                </div>
            </div>
        </div>
    </div>


    <div class="ui vertical stripe quote segment">
        <div class="ui equal width stackable internally celled grid">
            <div class="center aligned row">
                <div class="column">
                    <h3><img src="images/logo.png" class="ui avatar image">博客模块</h3>
                    <p>
                        资源管理系统为班级提供了一个博客模块，这个模块记录着班级体每次活动的照片。给班级成员留下美好的回忆。
                        它主要是展示班级体活动的一些照片，班级里的成员可以从博客模块上传和下载团队或个人的风采展示照片 。
                        同时班级里的成员可以共享博客模块的资源。</p>
                </div>
                <div class="six wide right floated column">
                    <img src="images/company.jpg" class="ui large bordered rounded image">
                </div>
            </div>
        </div>
    </div>

    <div class="ui vertical stripe segment">
        <div class="ui text container">
            <h3 class="ui header"><img src="images/logo.png" class="ui avatar image">个人模块</h3>
            <p>资源管理系统为班级提供了个人模块，这个模块主要是方便班级成员管理个人的信息， 在这个模块班级成员可以选择自己喜欢的团队然后加入团队。班级成员可以上传班级、团队、个人资源； 同时也可以修改个人信息和密码。</p>
            <div class="six wide right floated column">
                <img src="images/company.jpg" class="ui large bordered rounded image">
            </div>
        </div>
    </div>

    <div class="ui inverted vertical footer segment">
        <div class="ui container">
            <div class="ui stackable inverted divided equal height stackable grid">
                <div class="three wide column">
                    <h4 class="ui inverted header">联系方式</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">电话：12348759594</a>
                        <a href="#" class="item">qq:2545987615</a>
                        <a href="#" class="item">邮箱：2545987615@qq.com</a>
                    </div>
                </div>
                <div class="three wide column">
                    <h4 class="ui inverted header">帮助</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">服务热线：400-123456789</a>
                    </div>
                </div>
                <div class="seven wide column">
                    <h4 class="ui inverted header">友情链接</h4>
                    <p>http://www.zbeboy.top</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
