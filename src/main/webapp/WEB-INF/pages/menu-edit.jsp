<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>三四物流-物流采集系统</title>
    <jsp:include page="common/header.jsp"/>
</head>

<body style="margin-top: 30px;">
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <%--<div class="panel-heading">--%>
                <%--Basic Form Elements--%>
                <%--</div>--%>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form role="form" method="POST" action="/admin/menu/save">
                                <input type="hidden" name="id" value="${menu.id}"/>

                                <table class="table table-bordered table-striped formLayout m0">
                                    <tr>
                                        <td>资源名称：</td>
                                        <td>
                                            <input type="text" name="name" placeholder="" class="form-control"
                                                   value="${menu.name}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>对应URL：</td>
                                        <td>
                                            <input type="text" name="url" placeholder="" class="form-control"
                                                   value="${menu.url}"/>
                                        </td>
                                    </tr>

                                </table>

                                <button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>
                            </form>
                        </div>

                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>

<!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<%--</div>--%>
<!-- /#wrapper -->

<!-- Bootstrap Core JavaScript -->

</body>
</html>
