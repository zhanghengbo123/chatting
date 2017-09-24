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
                            <form role="form" method="POST" action="/admin/branchNetwork/save">
                                <input type="hidden" name="id" value="${branchNetwork.id}"/>

                                <table class="table table-bordered table-striped formLayout m0">
                                    <tr>
                                        <td>所属地区:</td>
                                        <td>
                                            <select name="provCode" id="provCode" class="form-control" required>
                                                <option value="">省份选择</option>
                                            </select>
                                            <select name="cityCode" id="cityCode" class="form-control">
                                                <option value="">城市选择</option>
                                            </select>
                                            <select name="areaCode" id="areaCode" class="form-control">
                                                <option value="">区(县)选择</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>名称：</td>
                                        <td>
                                            <input type="text" name="name" placeholder="" class="form-control"
                                                   value="${branchNetwork.name}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系人：</td>
                                        <td>
                                            <input type="text" name="contactUser" placeholder="" class="form-control"
                                                  required value="${branchNetwork.contactUser}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系电话：</td>
                                        <td>
                                            <input type="text" name="mobile" placeholder="" class="form-control"
                                                   value="${branchNetwork.mobile}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>服务等级：</td>
                                        <td>
                                            <input type="text" name="level" placeholder=""  type="number" class="form-control"
                                                   value="${branchNetwork.level}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>上级网点：</td>
                                        <td>
                                            <select  name="parentId" id="parentId" class="form-control">
                                                <option value="0">省级网点</option>
                                                <c:forEach var="network" items="${networkList}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${network.id eq branchNetwork.parentId}">
                                                            <option value="${network.id}" selected>${network.name}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${network.id}">${network.name}</option>
                                                        </c:otherwise>
                                                    </c:choose>>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>地址：</td>
                                        <td>
                                            <input type="text" name="address" placeholder="" class="form-control"
                                                   value="${branchNetwork.address}" required/>
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

<script type="text/javascript">
    //    checkClass("drama-list");
    $.address('provCode', 'cityCode', 'areaCode', '${branchNetwork.provCode}', '${branchNetwork.cityCode}', '${branchNetwork.areaCode}');
</script>
</body>
</html>
