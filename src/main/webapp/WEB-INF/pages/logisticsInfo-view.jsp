<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>查看</title>
    <jsp:include page="common/header.jsp"/>
</head>

<body style="margin-top: 30px;">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                    <table class="table table-bordered table-striped formLayout m0">
                                        <tr>
                                            <td>公司名称：</td>
                                            <td>
                                               ${logisticsInfo.name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>地址：</td>
                                            <td>
                                              ${logisticsInfo.lonLatMsg}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>联系人：</td>
                                            <td>
                                               ${logisticsInfo.contactUser}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>联系方式：</td>
                                            <td>
                                              ${logisticsInfo.contact}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>所属城市：</td>
                                            <td>
                                                ${logisticsInfo.provCode}-${logisticsInfo.cityCode}-${logisticsInfo.areaCode}
                                            </td>
                                        </tr>

                                    </table>
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
</body>
</html>
