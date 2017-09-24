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
                title: '园区信息新增/修改',
                shadeClose: true, //点击遮罩关闭层
                area : ['824px' , '560px'],
                content: '/admin/park/edit?id='+btn.value,
                end:function(){

                    $('body').css({overflow:'auto'});
                }
            });
        };

        //弹出一个iframe层
        function openViewWindow(btn){
            layer.open({
                type: 2,
                title: '园区全局预览地图',
                shadeClose: true, //点击遮罩关闭层
                area : ['1024px' , '612px'],
                content: '/admin/park/view'
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
                <h3 class="page-header">物流园区管理</h3>
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
                        <button type="button" class="btn btn-sm btn-success" onclick="openEditWindow(this)" id="park-add">添加园区</button>|<button type="button" class="btn btn-sm btn-success" onclick="openViewWindow(this)" id="park-view">地图预览</button>
                            <jsp:include page="search-form.jsp">
                                <jsp:param name="action" value="/admin/park/list" />
                                <jsp:param name="keyword" value="${keyword}" />
                            </jsp:include>
                        </p>
                        <div class="dataTable_wrapper">
                            <table class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                <thead>
                                <tr>
                                    <%--<th class="col-xs-1" align="center" data-align="center">id</th>--%>
                                    <th class="col-xs-2" align="center" data-align="center">园区名称</th>
                                    <th class="col-xs-1" align="center" data-align="center">经度</th>
                                    <th class="col-xs-1" align="center" data-align="center">纬度</th>
                                    <th class="col-xs-2" align="center" data-align="center">定位描述</th>
                                    <th class="col-xs-1" align="center" data-align="center">联系方式</th>
                                    <th class="col-xs-2" align="center" data-align="center">所在地区</th>
                                    <%--<th class="col-xs-1" align="center" data-align="center">城市</th>--%>
                                    <%--<th class="col-xs-1" align="center" data-align="center">县区</th>--%>
                                    <%--<th class="col-xs-1" align="center" data-align="center">采集人</th>--%>
                                    <th class="col-xs-1" align="center" data-align="center">采集时间</th>
                                    <th class="col-xs-1" align="center" data-align="center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${! empty page.result}">
                                    <c:forEach var="item" items="${page.result}" varStatus="status">
                                        <tr class="active">
                                            <%--<td>${item.id}</td>--%>
                                            <td class="h6">${item.name}</td>
                                            <td class="h6">${item.lon}</td>
                                            <td class="h6">${item.lat}</td>
                                            <td class="h6">${item.lonLatMsg}</td>
                                            <td class="h6">${item.contact}</td>
                                            <td class="h6" >${item.provCode}->${item.cityCode}->${item.areaCode}</td>
                                            <%--<td>${item.cityCode}</td>--%>
                                            <%--<td>${item.areaCode}</td>--%>
                                            <%--<td class="h6">${userTools.getUser(item.userId)}</td>--%>
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
                                                            <button type="button" onclick="commonDeleteConfirm('/admin/park/delete?id=${item.id}')" class="btn btn-xs btn-danger">
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
  var href = '/admin/park/list?currentPage={{number}}&keyword='+keyword;
</script>
<script src="/js/page.js"></script>
<script>
    checkClass("menu-list-4");
</script>
</body>
</html>
