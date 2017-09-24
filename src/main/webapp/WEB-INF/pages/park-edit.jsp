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
                            <form role="form" method="POST" action="/admin/park/save">
                                <input type="hidden" name="id" value="${park.id}"/>

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
                                        <td>园区名称：</td>
                                        <td>
                                            <input type="text" name="name" placeholder="" class="form-control"
                                                   value="${park.name}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>经度：</td>
                                        <td>
                                            <input type="text" name="lon" placeholder="" class="form-control"
                                                   value="${park.lon}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>纬度：</td>
                                        <td>
                                            <input type="text" name="lat" placeholder="" class="form-control"
                                                   value="${park.lat}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>地理位置描述：</td>
                                        <td>
                                            <input type="text" name="lonLatMsg" placeholder="" class="form-control"
                                                   value="${park.lonLatMsg}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系人：</td>
                                        <td>
                                            <input type="text" name="contactUser" placeholder="" class="form-control"
                                                   value="${park.contactUser}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系方式1：</td>
                                        <td>
                                            <input type="text" name="contact" placeholder="" class="form-control"
                                                   value="${park.contact}" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>联系方式2：</td>
                                        <td>
                                            <input type="text" name="mobile" placeholder="" class="form-control"
                                                   value="${park.mobile}"/>
                                        </td>
                                    </tr>

                                </table>

                                <button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>
                                <%--<button type="reset" class="btn btn-default">Reset Button</button>--%>
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

    $.address('provCode', 'cityCode', 'areaCode', '${park.provCode}', '${park.cityCode}', '${park.areaCode}');
</script>
</body>
</html>
