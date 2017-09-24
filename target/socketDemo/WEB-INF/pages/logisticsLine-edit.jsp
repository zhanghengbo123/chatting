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
                                <form role="form" method="POST" action="/admin/logisticsLine/save">
                                    <input type="hidden" name="id" value="${logisticsLine.id}"/>
                                    <input type="hidden" name="id" value="${logisticsLine.id}"/>
                                    <input type="hidden" name="id" value="${logisticsLine.id}"/>
                                    <input type="hidden" name="id" value="${logisticsLine.id}"/>
                                    <table class="table table-bordered table-striped formLayout m0" id="formTable">
                                        <tr>
                                            <td class="col-xs-5">所属公司:</td>
                                           <td class="col-xs-6"><select  name="cId" id="cId" class="form-control" required>
                                                <c:forEach var="logisticsInfo" items="${logisticsInfoList}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${logisticsInfo.id eq logisticsLine.cId}">
                                                            <option value="${logisticsInfo.id}" selected>${logisticsInfo.name}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${logisticsInfo.id}">${logisticsInfo.name}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                           </td>
                                            <td class="col-xs-1"></td>

                                        </tr>
                                        <tr>
                                            <td class="col-xs-4">线路类型：</td>
                                            <td class="col-xs-6">

                                                <select name="lineType" id="lineType" class="form-control">
                                                    <option value="1"  <c:if test="${logisticsLine.lineType eq 1}"> selected</c:if>>普通</option>
                                                    <option value="2"  <c:if test="${logisticsLine.lineType eq 2}"> selected</c:if>>冷链</option>
                                                </select>
                                            </td>
                                            <td class="col-xs-2"></td>
                                        </tr>

                                        <tr>
                                            <td class="col-xs-2">发车频率：</td>
                                            <td class="col-xs-2">
                                                <input type="text" name="frequency" placeholder="天/次" class="form-control" required
                                                       value="${logisticsLine.frequency}" />
                                            </td>
                                            <td class="col-xs-2"></td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">发车时间：</td>
                                            <td class="col-xs-2">
                                                <div class="input-group date form_time col-md-2" data-date="" data-date-format="hh:ii" data-link-field="sendTime" data-link-format="hh:ii">
                                                    <input class="form-control" size="16" type="text" value="${logisticsLine.sendTime}" readonly>
                                                    <%--<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>--%>
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                                </div>
                                                <input type="hidden" id="sendTime" name="sendTime" value="${logisticsLine.sendTime}" /><br/>
                                            </td>
                                            <td class="col-xs-2"></td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">预计到货时长：</td>
                                            <td class="col-xs-2">
                                                <input type="text" name="arrivalTime" placeholder="小时" class="form-control"
                                                       value="${logisticsLine.arrivalTime}" />
                                            </td>
                                            <td class="col-xs-2"></td>
                                        </tr>
                                        <tr>
                                            <td class="col-xs-2">信用级别：</td>
                                            <td class="col-xs-2">

                                                <select name="creditLevel" id="creditLevel" class="form-control">
                                                    <option value="1"  <c:if test="${logisticsLine.creditLevel eq 1}"> selected</c:if>>1</option>
                                                    <option value="2"  <c:if test="${logisticsLine.creditLevel eq 2}"> selected</c:if>>2</option>
                                                    <option value="3"  <c:if test="${logisticsLine.creditLevel eq 3}"> selected</c:if>>3</option>
                                                    <option value="4"  <c:if test="${logisticsLine.creditLevel eq 4}"> selected</c:if>>4</option>
                                                    <option value="5"  <c:if test="${logisticsLine.creditLevel eq 5}"> selected</c:if>>5</option>
                                                </select>
                                            </td>
                                            <td class="col-xs-2"></td>
                                        </tr>
<c:if test="${! empty logisticsLine.logisticsInfoList}">
    <c:forEach var="linePlatform" items="${logisticsLine.logisticsInfoList}" varStatus="status">

        <tr>
            <td class="col-xs-4">到达物流公司：</td>
            <td class="col-xs-6">
                <select name="infoIds" id="infoIds" class="form-control">
                    <c:forEach var="logisticsInfo" items="${logisticsInfoList}" varStatus="status1">
                        <c:choose>
                            <c:when test="${logisticsInfo.id eq linePlatform.logisticsInfoId}">
                                <option value="${logisticsInfo.id}" selected>${logisticsInfo.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${logisticsInfo.id}">${logisticsInfo.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>

            </td>
            <c:choose>
            <c:when test="${status.index eq 0}">
                <td style='text-align: center;'><p class="glyphicon glyphicon-plus" onclick="addNewRow();"></p></td>
                    </c:when>
                <c:otherwise>
                    <td style='text-align: center;'><i class='glyphicon glyphicon-trash'  id='${status.index}' onclick='del(${status.index})'></i></td>
                </c:otherwise>
            </c:choose>


        </tr>
            </c:forEach>
    </c:if>

<c:if test="${ empty logisticsLine.logisticsInfoList}">
                                        <tr>
                                            <td class="col-xs-4">到达物流公司：</td>
                                            <td class="col-xs-6">
                                                <select name="infoIds" id="infoIds" class="form-control">
                                                    <c:forEach var="logisticsInfo" items="${logisticsInfoList}" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${logisticsInfo.id eq logisticsLine.arriveLogisticsId}">
                                                                <option value="${logisticsInfo.id}" selected>${logisticsInfo.name}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${logisticsInfo.id}">${logisticsInfo.name}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>

                                            </td>
                                            <td style='text-align: center;'><p class="glyphicon glyphicon-plus" onclick="addNewRow();"></p></td>
                                        </tr>
    </c:if>
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

        var row_count = 7;
        $('.form_time').datetimepicker({
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 1,
            minView: 0,
            maxView: 1,
            forceParse: 0
        });
        //    checkClass("drama-list");
        <%--$.address('provCode','cityCode','areaCode','${logisticsLine.provCode}','${logisticsLine.cityCode}','${logisticsLine.areaCode}');--%>

        function addNewRow() {
            var op="";
            $("#infoIds option").each(function(){
                var oValue = $(this).val().toString();
                var oText = $(this).text().toString();
                var option = $("<option>").val(oValue).text(oText);
                op+='<option value="'+oValue+'">'+oText+'</option>';
//                $("#targetCtl").append(option);
            });
            var table1 = $("#formTable");
            var lastTr = table1.find("tbody>tr:last");
            var row = $("<tr></tr>");
            var td = $(" <td>到达物流公司"+(row_count-5)+"：</td><td><select name=\"infoIds\" id=\"infoIds\" class=\"form-control\">"+op+"</select></td><td style='text-align: center;'><i class='glyphicon glyphicon-trash'  id='" + row_count + "' onclick='del(" + row_count + ")'></i></td>");

            row.append(td);
            table1.append(row);
            row_count++;
            $('select').searchSelect();
            $(document).scrollTop(1000);
        }
                function del(e) {
                    //获取选中的复选框，然后循环遍历删除
                    var ckbs = $("#"+e+"");
                    ckbs.each(function() {
                        $(this).parent().parent().remove();
                    });
                }
        $('select').searchSelect();
    </script>
</body>
</html>