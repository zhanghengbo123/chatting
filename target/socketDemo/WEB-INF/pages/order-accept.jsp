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
                                <form role="form" class="form-horizontal" method="POST" enctype="multipart/form-data" action="/admin/order/acceptSave">
                                    <input type="hidden" name="id" value="${order.id}"/>

                                    <fieldset>
                                        <legend>签收信息</legend>
                                        <div class="form-group">

                                            <label class="col-sm-2 control-label" for="files">签收图片</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" id="files" name="files" type="file" placeholder=""/>
                                            </div>
                                        </div>
                                    </fieldset>
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
        $.address('provCode','cityCode','areaCode','${order.provCode}','${order.cityCode}','${order.areaCode}');

        var area=$('#areaCode');
        area.change(function(){

            var parms={
                provCode:$('#provCode').val(),
                cityCode:$('#cityCode').val(),
                areaCode:area.val()
            };
            //'?provCode='+$('#provCode').val()+'&cityCode='+$('#cityCode').val()+'&areaCode='+area.val();//,city=$('#'+city_id);

            console.log(parms);
            $.getJSON('/admin/order/parkList',parms,function(result){
//                console.log(result);
                var opt='';
                $.each(result, function(i, field){
                    opt+='<option index="'+i+'" value="'+field.id+'">'+field.name+'</option>';
                });
//                console.log(opt);
                $('#parkId').html(opt);
            });

        });

    </script>
</body>
</html>
