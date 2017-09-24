<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        function openEditWindow(btn,mark){

            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '订单新增/修改',
                shadeClose: true, //点击遮罩关闭层
                area : ['876px' , '650px'],
                content: '/admin/order/edit?id='+btn.value+'&mark='+mark,
                end:function(){

                    $('body').css({overflow:'auto'});
                }
            });
        };
        function openListWindow(btn){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '线路设定管理',
                shadeClose: true, //点击遮罩关闭层
                area : ['700px' , '412px'],
                content: '/admin/orderLine/list?orderId='+btn.value,
                end:function(){
                    $('body').css({overflow:'auto'});
                }
            });
        };

        function openDeliveryWindow(btn){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '配货信息',
                shadeClose: true, //点击遮罩关闭层
                area : ['800px' , '630px'],
                content: '/admin/delivery/edit?orderId='+btn.value,
                end:function(){
                    $('body').css({overflow:'auto'});
                }
            });
        };

        function openAcceptWindow(btn){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '客户签收',
                shadeClose: true, //点击遮罩关闭层
                area : ['320px' , '302px'],
                content: '/admin/order/acceptEdit?id='+btn.value,
                end:function(){
                    $('body').css({overflow:'auto'});
                }
            });
        };
    </script>
</head>

<body>

<div id="wrapper">

 <jsp:include page="navbar.jsp" flush="true" />

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">用户订单管理</h3>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

                    <div class="panel-body">
                        <!--异步提交表单，伪ajax。-->
                        <form id="commonPostForm" method="post" target="commonPostIframe">
                        </form>
                        <iframe width="0" height="0" style="display:none;" name="commonPostIframe"></iframe>
                        <p>
                        <button type="button" class="btn btn-sm btn-success" onclick="openEditWindow(this,0)" id="order-add">添加订单</button>
                        </p>
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="col-xs-1 h5" align="center" data-align="center">订单编号</th>
                                    <th class="col-xs-2 h5" align="center" data-align="center">发货网点</th>
                                    <th class="col-xs-2 h5" align="center" data-align="center">34线路</th>
                                    <th class="col-xs-1 h5" align="center" data-align="center">收货状态</th>
                                    <th class="col-xs-1 h5" align="center" data-align="center">发货状态</th>
                                    <th class="col-xs-1 h5" align="center" data-align="center">签收状态</th>
                                    <th class="col-xs-1 h5" align="center" data-align="center">发货时间</th>
                                    <th class="col-xs-2 h5" align="center" data-align="center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${! empty page.result}">
                                    <c:forEach var="item" items="${page.result}" varStatus="status">
                                         <div class="hidden">${item.orderStatusStr}</div>
                                        <tr class="active">
                                            <td class="h6">${item.orderNo}</td>
                                            <td class="h6">${networkMap.get(item.networkId)}</td>
                                            <td class="h6">${item.orderLines}</td>
                                            <td class="h6">${item.receiveStatusStr}</td>
                                            <td class="h6">${item.sendStatusStr}</td>
                                            <td class="h6"><c:if test="${item.customerStatus ne 1}"><p class="text-success">未签收</p></c:if><c:if test="${item.customerStatus eq 1}"><p class="text-danger">已签收</p></c:if></td>
                                            <jsp:useBean id="createdDate" class="java.util.Date"/>
                                            <jsp:setProperty name="createdDate" property="time"
                                                             value="${item.createTime}"/>
                                            <td class="h6"><fmt:formatDate pattern="yyyy-MM-dd HH:MM:ss" value="${createdDate}"/></td>
                                            <td>

                                                <c:choose>
                                                    <c:when test="${item.networkId eq networkId}">
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="openEditWindow(this,0)" value="${item.id}" class="btn btn-xs btn-warning">
                                                                修改</button>
                                                        </div>
                                                        <c:if test="${item.customerStatus ne 1 and item.optStatus eq 0}">
                                                            <div class="btn-group" role="group">
                                                                <button type="button" onclick="openDeliveryWindow(this)" value="${item.id}" class="btn btn-xs btn-success">
                                                                    发货</button>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${ item.optStatus eq 1}">
                                                            <div class="btn-group" role="group">
                                                                <button type="button" onclick="openDeliveryWindow(this)" value="${item.id}" class="btn btn-xs btn-success">
                                                                    查看发货单</button>
                                                            </div>
                                                        </c:if>

                                                        <%--<c:if test="${item.confirmStatus eq 0}">--%>
                                                            <%--<div class="btn-group" role="group">--%>
                                                                <%--<button type="button" onclick="commonReceiveConfirm('/admin/order/confirmGood?orderId=${item.id}')" value="${item.id}" class="btn btn-xs btn-success">--%>
                                                                    <%--收货</button>--%>
                                                            <%--</div>--%>
                                                        <%--</c:if>--%>
                                                        <c:if test="${item.confirmStatus eq 1}">
                                                            <c:if test="${item.customerStatus ne 1 and item.nextNetworkStatus eq 0}">
                                                                <div class="btn-group" role="group">
                                                                    <button type="button" onclick="openAcceptWindow(this)" value="${item.id}" class="btn btn-xs btn-success">
                                                                        签收</button>
                                                                </div>
                                                            </c:if>
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="openEditWindow(this,1)" value="${item.id}" class="btn btn-xs btn-warning">
                                                                查看</button>
                                                        </div>
                                                        <c:if test="${ item.optStatus eq 1}">
                                                            <div class="btn-group" role="group">
                                                                <button type="button" onclick="openDeliveryWindow(this)" value="${item.id}" class="btn btn-xs btn-success">
                                                                    查看发货单</button>
                                                            </div>


                                                        </c:if>
                                                        <c:if test="${item.confirmStatus eq 0}">
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="commonReceiveConfirm('/admin/order/confirmGood?orderId=${item.id}')" value="${item.id}" class="btn btn-xs btn-success">
                                                                收货</button>
                                                        </div>
                                                        </c:if>
                                                        <c:if test="${item.confirmStatus eq 1}">
                                                        <c:if test="${item.customerStatus ne 1 and item.nextNetworkStatus ne 1}">
                                                            <div class="btn-group" role="group">
                                                                <button type="button" onclick="openAcceptWindow(this)" value="${item.id}" class="btn btn-xs btn-success">
                                                                    签收</button>
                                                            </div>
                                                        </c:if>
                                                        </c:if>

                                                        <c:if test="${item.customerStatus ne 1 and item.nextNetworkStatus ne 1}">
                                                            <div class="btn-group" role="group">
                                                                <button type="button" onclick="openDeliveryWindow(this)" value="${item.id}" class="btn btn-xs btn-success">
                                                                    发货</button>
                                                            </div>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>

                                </tbody>
                            </table>
                            <div id="page-content"><ul id="pagination-demo" class="pagination-sm"></ul></div>
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

</div>
<!-- /#wrapper -->
<script type="application/javascript">
  var   total = ${page.pageCount};
  var href = '/admin/logisticsLine/list?currentPage={{number}}';
</script>
<script src="/js/page.js"></script>
<script>
    checkClass("menu-list-7");
</script>
</body>
</html>
