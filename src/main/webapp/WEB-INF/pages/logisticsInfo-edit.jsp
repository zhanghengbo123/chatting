<%@ page import="java.util.Date" %>
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

    <title>三四物流-物流采集系统</title>
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
                                <form role="form" method="POST" action="/admin/logisticsInfo/save">
                                    <input type="hidden" name="id" value="${logisticsInfo.id}"/>

                                    <table class="table table-bordered table-striped formLayout m0">
                                        <%--<tr>--%>
                                            <%--<td class="col-lg-3">所属园区:</td>--%>
                                            <%--<td class="col-lg-6">--%>

                                                <%--<select  name="parkId" id="parkId" class="form-control">--%>
                                                    <%--<c:forEach var="park" items="${parkList}" varStatus="status">--%>
                                                        <%--<c:choose>--%>
                                                            <%--<c:when test="${logisticsInfo.parkId eq park.id}">--%>
                                                                <%--<option value="${park.id}" selected>${park.name}</option>--%>
                                                            <%--</c:when>--%>
                                                            <%--<c:otherwise>--%>
                                                                <%--<option value="${park.id}">${park.name}</option>--%>
                                                            <%--</c:otherwise>--%>
                                                        <%--</c:choose>--%>
                                                    <%--</c:forEach>--%>
                                                <%--</select>--%>
                                            <%--</td>--%>
                                            <%--<td class="col-lg-3">--%>
<%--备注--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
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
                                            <td class="col-lg-3">公司名称：</td>
                                            <td class="col-lg-6">
                                                <input type="text" name="name" onblur="findInfo();" placeholder="公司名称" class="form-control" required
                                                       value="${logisticsInfo.name}" id="name" />
                                            </td>
                                            <td class="col-lg-3">
                                            <span id="warningDom" class="hidden" style="color: red; ">名称已存在</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-3">经度：</td>
                                            <td>
                                                <input type="text" name="lon" placeholder="公司经度坐标" class="form-control"
                                                       value="${logisticsInfo.lon}" />
                                            </td>
                                            <td class="col-lg-3">

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-3">纬度：</td>
                                            <td >
                                                <input type="text" name="lat" placeholder="公司纬度坐标" class="form-control"
                                                       value="${logisticsInfo.lat}" />
                                            </td>
                                            <td class="col-lg-3">

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-3">地址描述：</td>
                                            <td>
                                                 <textarea name="lonLatMsg" placeholder="物流园区地址,详细地址" class="form-control"
                                                 >${logisticsInfo.lonLatMsg}</textarea>
                                            </td>
                                            <td class="col-lg-3">

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-3">联系人：</td>
                                            <td>
                                                <input type="text" name="contactUser" placeholder="" class="form-control"
                                                       value="${logisticsInfo.contactUser}"/>
                                            </td>
                                            <td class="col-lg-3">

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-3">联系方式(多个)：</td>
                                            <td>
                                                <textarea name="contact" placeholder="多个以,号分隔" class="form-control"
                                                          >${logisticsInfo.contact}</textarea>
                                                <%--<input type="text" name="contact" placeholder="" class="form-control"--%>
                                                       <%--value="${logisticsInfo.contact}" />--%>
                                            </td>
                                            <td class="col-lg-3">

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
    $.address('provCode', 'cityCode', 'areaCode', '${logisticsInfo.provCode}', '${logisticsInfo.cityCode}', '${logisticsInfo.areaCode}');

function findInfo(){
    var cNameDom = $('#name');

    var customerDomParms = {
        name: cNameDom.val()
    };
    $.getJSON('/admin/logisticsInfo/findInfo', customerDomParms, function (result) {
        if(result.c==1)
        {
            layer.alert('公司名称已存在!', {
                icon: 3,
                skin: 'layer-ext-moon'
            });
        }
    });
}

    <%--$.address('provCode','cityCode','areaCode','${logisticsInfo.provCode}','${logisticsInfo.cityCode}','${logisticsInfo.areaCode}');--%>
</script>
</body>
</html>
