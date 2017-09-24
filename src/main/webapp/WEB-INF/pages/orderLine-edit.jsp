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
<body style="margin-top: 20px;">

                                <form role="form" method="POST" action="/admin/orderLine/save">
                                    <input type="hidden" name="id" value="${orderLine.id}"/>
                                    <input type="hidden" name="orderId" value="${orderLine.orderId}"/>
                                    <table class="table table-bordered table-striped formLayout m0">
                                        <tr>
                                            <td>到达省：</td>
                                            <td>
                                                <select  name="provCode" id="provCode" class="form-control">
                                                    <option value="">省份选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>到达城市：</td>
                                            <td>
                                                <select name="cityCode" id="cityCode" class="form-control">
                                                    <option value="">城市选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>到达县：</td>
                                            <td>
                                                <select name="areaCode" id="areaCode" class="form-control">
                                                    <option value="">区(县)选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>到达园区：</td>
                                            <td>
                                                <select name="parkId" id="parkId" class="form-control">
                                                    <option value="${orderLine.parkId}">${parkMap.get(orderLine.parkId)}</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>
                                </form>

                                <script type="text/javascript">
                                    $.address('provCode','cityCode','areaCode','${orderLine.provCode}','${orderLine.cityCode}','${orderLine.areaCode}');
                                    var area=$('#areaCode');
                                    area.change(function(){

                                        var parms={
                                            provCode:$('#provCode').val(),
                                            cityCode:$('#cityCode').val(),
                                            areaCode:area.val()
                                        };

                                        console.log(parms);
                                        $.getJSON('/admin/logisticsLine/parkList',parms,function(result){
                                            var opt='';
                                            $.each(result, function(i, field){
                                                opt+='<option index="'+i+'" value="'+field.id+'">'+field.name+'</option>';
                                            });
                                            $('#parkId').html(opt);
                                        });

                                    });
                                </script>
</body>
</html>
