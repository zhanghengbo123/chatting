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
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <%--<div class="panel-heading">--%>
                    <%--Basic Form Elements--%>
                    <%--</div>--%>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form role="form" method="POST" action="/admin/carInfo/save">
                                    <input type="hidden" name="id" value="${carInfo.id}"/>
                                    <table class="table table-bordered table-striped formLayout m0">
                                        <tr>
                                            <td class="col-xs-2">车牌号码：</td>
                                            <td class="col-xs-2">
                                                <input type="text" name="carNo" placeholder="" class="form-control" required
                                                       value="${carInfo.carNo}" />
                                            </td>
                                            <td class="col-xs-2">车型:</td>
                                            <td class="col-xs-2">
                                                <select  name="carType" id="carType" class="form-control">
                                                    <c:forEach var="oType" items="${carType}" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${oType.key eq carInfo.carType}">
                                                                <option value="${oType.key}" selected>${oType.value}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${oType.key}">${oType.value}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">车主姓名：</td>
                                            <td class="col-xs-2">
                                                <input type="text" name="owner" class="form-control"
                                                       value="${carInfo.owner}" />
                                            </td>
                                            <td class="col-xs-2">联系方式：</td>
                                            <td class="col-xs-2">
                                                <textarea id="contact" name="contact" placeholder="多个以,号分隔">${carInfo.contact}</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">载重：</td>
                                            <td class="col-xs-2">
                                                <input type="text" name="carWeight" placeholder="单位 吨" class="form-control"
                                                       value="${carInfo.carWeight}" />
                                            </td>
                                            <td class="col-xs-2">车辆长度：</td>
                                            <td class="col-xs-2">
                                                <input type="text" name="carLength" placeholder="单位 米" class="form-control"
                                                       value="${carInfo.carLength}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">备注：</td>
                                            <td class="col-xs-2">
                                                <textarea id="comments" name="comments" >${carInfo.comments}</textarea>
                                            </td>
                                            <td class="col-xs-2">服务等级：</td>
                                            <td class="col-xs-2">

                                                <select name="serviceLevel" id="serviceLevel" class="form-control">
                                                    <option value="1"  <c:if test="${carInfo.serviceLevel eq 1}"> selected</c:if>>1级</option>
                                                    <option value="2"  <c:if test="${carInfo.serviceLevel eq 2}"> selected</c:if>>2级</option>
                                                    <option value="3"  <c:if test="${carInfo.serviceLevel eq 3}"> selected</c:if>>3级</option>
                                                    <option value="4"  <c:if test="${carInfo.serviceLevel eq 4}"> selected</c:if>>4级</option>
                                                    <option value="5"  <c:if test="${carInfo.serviceLevel eq 5}"> selected</c:if>>5级</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="col-xs-2">常去地区：</td>
                                            <td class="col-xs-2">
                                                <select  name="oftenProvCode" id="oftenProvCode" class="form-control">
                                                    <option value="">省份选择</option>
                                                </select>
                                            </td>
                                            <td class="col-xs-2">城市：</td>
                                            <td class="col-xs-2">
                                                <select name="oftenCityCode" id="oftenCityCode" class="form-control">
                                                    <option value="">城市选择</option>
                                                </select>
                                            </td>
                                            <td class="col-xs-2">县/区：</td>
                                            <td class="col-xs-2">
                                                <select name="oftenAreaCode" id="oftenAreaCode" class="form-control">
                                                    <option value="">区(县)选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">归属地区：</td>
                                            <td class="col-xs-2">
                                                <select  name="provCode" id="provCode" class="form-control">
                                                    <option value="">省份选择</option>
                                                </select>
                                            </td>
                                            <td class="col-xs-2">城市：</td>
                                            <td class="col-xs-2">
                                                <select name="cityCode" id="cityCode" class="form-control">
                                                    <option value="">城市选择</option>
                                                </select>
                                            </td>
                                            <td class="col-xs-2">县/区：</td>
                                            <td class="col-xs-2">
                                                <select name="areaCode" id="areaCode" class="form-control">
                                                    <option value="">区(县)选择</option>
                                                </select>
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

</div>
    <script type="text/javascript">
        $.address('provCode','cityCode','areaCode','${carInfo.provCode}','${carInfo.cityCode}','${carInfo.areaCode}');
        $.address('oftenProvCode','oftenCityCode','oftenAreaCode','${carInfo.oftenProvCode}','${carInfo.oftenCityCode}','${carInfo.oftenAreaCode}');

    </script>
</body>
</html>
