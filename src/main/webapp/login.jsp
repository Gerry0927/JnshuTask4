<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>后台信息系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }

        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .header p {
            font-size: 14px;
        }
    </style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/app.js"></script>
<script>

    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
    $(function () {

        if (window!=top) { // 判断当前的window对象是否是top对象
            top.location.href = window.location.href; // 如果不是，将top对象的网址自动导
        }

        var msgg = '${msg}';
        if (msgg != '')
            myAlert(msgg);


        $("body").keydown(function () {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $('.am-modal').modal('close');
                login();
            }
        });

    });

    function login() {
        $("#passwords").val(($("#password").val()));
        if ($("#mobile").val() == '') {
            myAlert("用户名不能为空");
            return;
        }
        if ($("#passwords").val() == '') {
            myAlert("密码不能为空");
            return;
        }
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/login',
            type: 'post',
            async: false,
            timeout: 5000,          // 设置超时时间
            data: {mobile: $("#mobile").val(), password: $("#passwords").val()},
            success: function (data) {
//                data = eval("(" + data + ")");
                if (data.code == '0') {
                    window.location.href = "${pageContext.request.contextPath}/student/list";
                } else {
                    myAlert(data.message);
                }

            }

        })

    }
</script>


<body>
<div class="header">
    <div class="am-g">
        <h1>后台信息系统</h1>

        <p></p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>欢迎登录</h3>
        <hr>
        <div class="am-form" id="login">
            <fieldset>
                <label>账号:</label>

                <!--  <input type="text" minlength="11" required/> -->
                <input type="text" id="mobile" name="mobile" minlength="11" value=""/>
                <br>
                <label for="password">密码:</label>
                <input type="password" id="password"/>
                <input type="hidden" id="passwords" name="password"/>
                <br>
            </fieldset>
            <div class="am-cf">
                <button class="am-btn am-btn-secondary" id="sub" type="button" onClick="login()">登录</button>
            </div>
        </div>

        <hr>
        <p>© 2018 HuiHui</p>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/amazeui.min.js"></script>


</html>
