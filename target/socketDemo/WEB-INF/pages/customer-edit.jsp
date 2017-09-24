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
                            <form role="form" method="POST" action="/admin/customer/save">
                                <input type="hidden" name="id" value="${customer.id}"/>

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
                                        <td>公司名称：</td>
                                        <td>
                                            <input type="text" name="company" placeholder="" class="form-control"
                                                   value="${customer.company}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>地址：</td>
                                        <td>
                                            <input type="text" name="address" placeholder="" class="form-control"
                                                   value="${customer.address}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系人：</td>
                                        <td>
                                            <input type="text" name="contacts" placeholder="" class="form-control"
                                                   value="${customer.contacts}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系电话：</td>
                                        <td>
                                            <input type="text" name="mobile" placeholder="" class="form-control"
                                                   value="${customer.mobile}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>备注：</td>
                                        <td>
                                            <input type="text" name="remarks" placeholder="" class="form-control"
                                                   value="${customer.remarks}"/>
                                        </td>
                                    </tr>
                                    <%--<tr>--%>
                                        <%--<td>客户类型：</td>--%>
                                        <%--<td>--%>
                                            <%--<select name="type" id="type" class="form-control">--%>
                                                <%--<option value="1"  <c:if test="${customer.type eq 1}"> selected</c:if>>发货人</option>--%>
                                                <%--<option value="2"  <c:if test="${customer.type eq 2}"> selected</c:if>>收货人</option>--%>
                                            <%--</select>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>

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
    $.address('provCode', 'cityCode', 'areaCode', '${customer.provCode}', '${customer.cityCode}', '${customer.areaCode}');
</script>
</body>
</html>
