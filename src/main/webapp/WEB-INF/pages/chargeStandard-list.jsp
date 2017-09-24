<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>三四物流-物流采集系统</title>
    <jsp:include page="common/header.jsp"/>
    <script type="text/javascript">
        //弹出一个iframe层
        function openEditWindow(btn,lineId){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '收费标准添加/修改',
                shadeClose: true, //点击遮罩关闭层
                area : ['400px' , '282px'],
                content: '/admin/chargeStandard/edit?id='+btn.value+'&lineId='+lineId,
                end:function(){
                    $('body').css({overflow:'auto'});
                }
            });
        };
    </script>
</head>

<body style="margin-top: 30px;">

<%--<div id="wrapper">--%>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!--异步提交表单，伪ajax。-->
                        <form id="commonPostForm" method="post" target="commonPostIframe">
                        </form>
                        <iframe width="0" height="0" style="display:none;" name="commonPostIframe"></iframe>
                        <p>
                        <button type="button" class="btn btn-sm btn-success" onclick="openEditWindow(this,${lineId})" id="chargeStandard-add">添加收费标准</button>
                        </p>
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="col-xs-2" align="center" data-align="center">收费类型</th>
                                    <th class="col-xs-2" align="center" data-align="center">收费标准</th>
                                    <th class="col-xs-1" align="center" data-align="center">价格</th>
                                    <th class="col-xs-3" align="center" data-align="center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${! empty page.result}">
                                    <c:forEach var="item" items="${page.result}" varStatus="status">
                                        <tr class="active">
                                            <td><c:if test="${item.type eq 1}">按体积</c:if> <c:if test="${item.type eq 2}">按重量</c:if></td>
                                            <td>${item.name}</td>
                                            <td>${item.chargeValue}</td>
                                            <td>
                                                    <div class="btn-group btn-group-justified" role="group">
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="openEditWindow(this,${item.lineId})" value="${item.id}" class="btn btn-xs btn-info">
                                                                修改</button>
                                                        </div>
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="commonDeleteConfirm('/admin/chargeStandard/delete?id=${item.id}')" class="btn btn-xs btn-danger">
                                                                删除</button>
                                                        </div>
                                                    </div>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>


                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>


    </div>
    <!-- /#page-wrapper -->

<%--</div>--%>
<!-- /#wrapper -->
</body>
</html>
