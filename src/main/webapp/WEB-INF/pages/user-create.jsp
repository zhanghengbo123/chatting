<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<%--<div id="wrapper">--%>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

                    <div class="panel-body">

                        <form method="POST"  class="form-horizontal" role="form" action="/admin/user/create">
                            <input type="hidden" name="id" value="${user.id}"/>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="networkId">所属网点</label>
                                <div class="col-sm-4" >
                                    <select name="networkId" id="networkId" class="form-control">
                                        <c:forEach var="network" items="${networkList}" varStatus="status">
                                            <c:choose>
                                                <c:when test="${network.id eq user.networkId}">
                                                    <option value="${network.id}" selected>${network.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${network.id}">${network.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>

                                <label class="col-sm-2 control-label" for="logisticsId">所属物流公司</label>
                                <div class="col-sm-4" >
                                    <select name="logisticsId" id="logisticsId" class="form-control">
                                        <option value="0" >本网点</option>
                                        <c:forEach var="info" items="${logisticsInfoList}" varStatus="status">
                                            <c:choose>
                                                <c:when test="${info.id eq user.logisticsId}">
                                                    <option value="${info.id}" selected>${info.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${info.id}">${info.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="mobile">手机号码</label>
                                <div class="col-sm-4" >
                                    <input type="tel" value="${user.mobile}" class="form-control" required name="mobile" id="mobile"/>
                                </div>
                                <label class="col-sm-2 control-label" for="username">用户名</label>
                                <div class="col-sm-4">
                                    <input type="text" value="${user.username}" class="form-control" required name="username" id="username"/>
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="col-sm-2 control-label">入职日期</label>
                                <div class="col-sm-4">
                                    <div class="input-group date form_datetime" data-date="" data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd" data-link-field="joinTime">
                                        <input class="form-control" size="16" type="text" value="${user.joinTime}" readonly>
                                        <%--<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>--%>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                                    </div>
                                    <input type="hidden" id="joinTime" name="joinTime" value="${user.joinTime}" />
                                </div>

                                <label class="col-sm-2 control-label" for="password">密 码</label>
                                <div class="col-sm-4" >
                                    <input type="password" class="form-control" name="password" id="password"/>
                                </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-2 control-label" for="roleId">所属角色</label>
                            <div class="col-sm-10" >
                                <select name="roleId" id="roleId" class="form-control">
                                    <option value="0" >待定</option>
                                    <c:forEach var="role" items="${roleList}" varStatus="status">
                                        <c:choose>
                                            <c:when test="${role.id eq user.roleId}">
                                                <option value="${role.id}" selected>${role.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${role.id}">${role.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="address">地 址</label>
                                <div class="col-sm-10">
                                    <textarea  class="form-control" name="address" id="address">${user.address}</textarea>
                                </div>
                            </div>
                            <button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>
                        </form>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>

    </div>
<%--<script src="/js/user.js"></script>--%>
<script src="/js/common.js" ></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        maxView: 1,
        forceParse: 0
    });
    checkClass("user");


    var network=$('#networkId');
    network.change(function(){

        var parms={
            netId:network.val()
        };
        $.getJSON('/admin/logisticsInfo/listSearchByNetWorkId',parms,function(result){
            var opt='<option value="0">本网点</option>';
            $.each(result, function(i, field){
                opt+='<option index="'+i+'" value="'+field.id+'">'+field.name+'</option>';
            });
            $('#logisticsId').html(opt);
        });

    });

    $('#mobile').blur(function(){
         var parms={
             mobile:$('#mobile').val()
         };
        $.getJSON('/admin/user/findByMobile',parms,function(result){
            var opt=result.m;

            if(result.c == 0){
                layer.alert(opt, {icon: 5});
            }

        });
    });
</script>

</body>
</html>
