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
    <script src="/js/city/jquery-1.4.4.min.js" type="text/javascript"></script>
    <link href="/js/city/station.css" rel="stylesheet" type="text/css">
    <script src="/js/city/station_name.js" type="text/javascript"></script>
    <script src="/js/city/favorite_name.js" type="text/javascript"></script>
    <script src="/js/city/city_name.js" type="text/javascript"></script>
    <script type="text/javascript">
        //弹出一个iframe层
        function openEditWindow(btn){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '线路新增/修改',
                shadeClose: true, //点击遮罩关闭层
                area : ['70%' , '90%'],
                content: '/admin/logisticsLine/edit?id='+btn.value,
                end:function(){

                    $('body').css({overflow:'auto'});
                }
            });
        };
        function openListWindow(btn){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '线路收费标准管理',
                shadeClose: true, //点击遮罩关闭层
                area : ['700px' , '412px'],
                content: '/admin/chargeStandard/list?lineId='+btn.value,
                end:function(){
                    $('body').css({overflow:'auto'});
                }
            });
        };

        function openViewWindow(cId){
            $('body').css({overflow:'hidden'});
            layer.open({
                type: 2,
                title: '公司信息',
                shadeClose: true, //点击遮罩关闭层
                area : ['500px' , '350px'],
                content: '/admin/logisticsInfo/edit?id='+cId+'&mark=1',
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
                <h3 class="page-header">物流线路管理</h3>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">

              <jsp:include page="common/searchForm.jsp" flush="true">
                  <jsp:param name="postUrl" value="/admin/logisticsLine/list"></jsp:param>
              </jsp:include>
                    <!--异步提交表单，伪ajax。-->
                    <form id="commonPostForm" method="post" target="commonPostIframe">
                    </form>
                    <iframe width="0" height="0" style="display:none;" name="commonPostIframe"></iframe>
                    <div class="panel-body">
                        <p>
                        <button type="button" class="btn btn-sm btn-success" onclick="openEditWindow(this)" id="add-line">添加路线</button>
                        </p>
                        <div class="dataTable_wrapper">

                            <table class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th class="col-xs-1" align="center" data-align="center">所属公司</th>
                                    <th class="col-xs-4" style='text-align: center;' align="center" data-align="center">行驶路线</th>
                                    <%--<th class="col-xs-1" align="center" data-align="center">联系方式</th>--%>
                                    <th class="col-xs-1" align="center" data-align="center">线路类型</th>
                                    <th class="col-xs-1" align="center" data-align="center">发车频率</th>
                                    <th class="col-xs-1" align="center" data-align="center">发车时间</th>
                                    <%--<th class="col-xs-1" align="center" data-align="center">采集人</th>--%>
                                    <th class="col-xs-2" align="center" data-align="center">采集时间</th>
                                    <th class="col-xs-2" align="center" data-align="center">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:if test="${! empty page.result}">
                                    <c:forEach var="item" items="${page.result}" varStatus="status">
                                        <tr class="active">
                                            <td class="h6"><a onclick="openViewWindow(${item.cId})">${infoMap.get(item.cId)}</a></td>
                                            <td class="h6">
                                        <c:if test="${! empty item.logisticsInfoList}">
                                            <c:forEach var="linePlatform" items="${item.logisticsInfoList}" varStatus="status1">
                                               <c:choose>
                                                <c:when test="${status1.last}">
                                            <a onclick="openViewWindow(${linePlatform.logisticsInfoId})"> ${infoMap.get(linePlatform.logisticsInfoId)}</a>
                                                </c:when>
                                                <c:otherwise>
                                            <a onclick="openViewWindow(${linePlatform.logisticsInfoId})">${infoMap.get(linePlatform.logisticsInfoId)}</a>->
                                                </c:otherwise>
                                               </c:choose>
                                            </c:forEach>
                                                </c:if>
                                            </td>
                                            <%--<td class="h6">${item.contact}</td>--%>
                                            <td class="h6"><c:if test="${item.lineType eq 1}">普通</c:if> <c:if test="${item.lineType eq 2}">冷链</c:if></td>
                                            <td class="h6">${item.frequency}</td>
                                            <td class="h6">${item.sendTime}</td>
                                            <jsp:useBean id="createdDate" class="java.util.Date"/>
                                            <jsp:setProperty name="createdDate" property="time"
                                                             value="${item.createTime}"/>
                                            <td class="h6"><fmt:formatDate pattern="yyyy-MM-dd HH:MM:ss" value="${createdDate}"/></td>
                                            <td class="h6">
                                                    <div class="btn-group btn-group-justified" role="group">
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="openListWindow(this)" value="${item.id}" class="btn btn-xs btn-info">
                                                                费用</button>
                                                        </div>
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="openEditWindow(this)" value="${item.id}" class="btn btn-xs btn-info">
                                                                修改</button>
                                                        </div>
                                                        <div class="btn-group" role="group">
                                                            <button type="button" onclick="commonDeleteConfirm('/admin/logisticsLine/delete?id=${item.id}')" class="btn btn-xs btn-danger">
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
  var href = '/admin/logisticsLine/list?currentPage={{number}}';
</script>
<%--<script src="/startbootstrap/js/jquery.js"></script>--%>
<script src="/js/page.js"></script>
<script>
    checkClass("menu-list-6");
</script>
</body>
</html>
