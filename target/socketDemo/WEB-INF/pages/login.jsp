<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>三四物流-物流采集系统-登录页面</title>
    <jsp:include page="common/header.jsp"/>
    <link href="../../startbootstrap/css/sb-admin-2.css" rel="stylesheet">
</head>

<body style="background-image: url('/images/bk.jpg')">
${msg}
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title" align="center">三四物流-物流采集系统</h5>
                </div>
                <div class="panel-body">
                    <form role="form" method="POST" action="/admin/login">
                        <fieldset>
                            <div class="form-group">
                                <input type="text" id="inputUsername" name="username" class="form-control" placeholder="手机号码" required autofocus oninvalid="">
                            </div>
                            <div class="form-group">
                                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--<div class="container">--%>

    <%--<form class="form-signin" method="POST" action="/admin/login">--%>
        <%--<h2 class="form-signin-heading" align="center">物流采集系统</h2>--%>
        <%--<label for="inputUsername" class="sr-only">手机号码</label>--%>
        <%--<input type="text" id="inputUsername" name="username" class="form-control" placeholder="手机号码" required autofocus oninvalid="">--%>
        <%--<label for="inputPassword" class="sr-only">密码</label>--%>
        <%--<input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>--%>
        <%--<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>--%>
    <%--</form>--%>
<%--</div>--%>

</body>
</html>
