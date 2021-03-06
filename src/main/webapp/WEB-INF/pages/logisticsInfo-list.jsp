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
        function openEditWindow(btn){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '公司信息新增/修改',
                shadeClose: true, //点击遮罩关闭层
                area : ['800px' , '612px'],
                content: '/admin/logisticsInfo/edit?id='+btn.value,
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
                <h3 class="page-header">物流公司管理</h3>
            </div>
            <!-- /.col-lg-12 -->
        </div>

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
                        <button type="button" class="btn btn-sm btn-success" onclick="openEditWindow(this)" id="logisticsInfo-add">添加公司</button>
                            <jsp:include page="search-form.jsp">
                                <jsp:param name="action" value="/admin/logisticsInfo/list" />
                                <jsp:param name="keyword" value="${keyword}" />
                            </jsp:include>
                        </p>
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                <thead>
                                <tr>

                                    <th class="col-xs-3" style="text-align: center" align="center" data-align="center">公司名称</th>
                                    <th class="col-xs-2" style="text-align: center"  align="center" data-align="center">所属地区</th>
                                    <%--<th class="col-xs-1" align="center" data-align="center">经度</th>--%>
                                    <%--<th class="col-xs-1" align="center" data-align="center">纬度</th>--%>
                                    <th class="col-xs-2" align="center" data-align="center">地址描述</th>
                                    <th class="col-xs-1" align="center" data-align="center">联系方式</th>
                                    <%--<th class="col-xs-1" align="center" data-align="center">采集人</th>--%>
                                    <th class="col-xs-2" align="center" data-align="center">采集时间</th>
                                    <th class="col-xs-1" style="text-align: center"  align="center" data-align="center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${! empty page.result}">
                                    <c:forEach var="item" items="${page.result}" varStatus="status">
                                        <tr class="active">
                                            <td class="h6">${item.name}</td>
                                            <td class="h6">${item.provCode}->${item.cityCode}->${item.areaCode}</td>
                                            <%--<td class="h6">${item.lon}</td>--%>
                                            <%--<td class="h6">${item.lat}</td>--%>
                                            <td class="h6">${item.lonLatMsg}</td>
                                            <td class="h6">${item.contact}</td>
                                            <%--<td>${item.provCode}->${item.cityCode}->${item.areaCode}</td>--%>
                                            <jsp:useBean id="createdDate" class="java.util.Date"/>
                                            <jsp:setProperty name="createdDate" property="time"
                                                             value="${item.createTime}"/>
                                            <td class="h6"><fmt:formatDate pattern="yyyy-MM-dd HH:MM:ss" value="${createdDate}"/></td>
                                            <td class="h6">
                                                    <div class="btn-group btn-group-justified" role="group">
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="openEditWindow(this)" value="${item.id}" class="btn btn-xs btn-info">
                                                                修改</button>
                                                        </div>
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="commonDeleteConfirm('/admin/logisticsInfo/delete?id=${item.id}')" class="btn btn-xs btn-danger">
                                                                删除</button>
                                                        </div>
                                                    </div>

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
  var keyword = encodeURI("${keyword}");
  var href = '/admin/logisticsInfo/list?currentPage={{number}}&keyword='+keyword;
</script>
<script src="/js/page.js"></script>
<script>
    checkClass("menu-list-5");
</script>
</body>
</html>
