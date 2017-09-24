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
  <script type="text/javascript">
    //弹出一个iframe层
    function openEditWindow(btn){
      layer.open({
        type: 2,
        title: '用户新增/修改',
        shadeClose: true, //点击遮罩关闭层
        area : ['780px' , '450px'],
        content: '/admin/user/edit?id='+btn.value
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
        <h3 class="page-header">网点用户管理</h3>
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
              <button class="btn btn-sm btn-success" onclick="openEditWindow(this)">添加用户</button>
            </p>
            <div class="dataTable_wrapper">
              <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                <tr>
                  <th>用户id</th>
                  <th>用户名</th>
                  <th>手机号码</th>
                  <th>所属网点</th>
                  <th>所属公司</th>
                  <th>状态</th>
                  <th>入职日期</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:if test="${! empty pagination.datum}">
                  <c:forEach var="user" items="${pagination.datum}" varStatus="status">
                    <tr class="active">
                      <td class="h6">${user.id}</td>
                      <td class="h6">${user.username}</td>
                      <td class="h6">${user.mobile}</td>
                      <td class="h6">${user.networkName}</td>
                      <c:choose>
                        <c:when test="${user.logisticsId == 0}">
                          <td class="h6"> <font color="#006400"> 网点用户</font></td>
                        </c:when>
                        <c:otherwise>
                          <td class="h6">${user.logisticsName}</td>
                        </c:otherwise>
                      </c:choose>

                      <td class="h6">
                        <c:choose>
                          <c:when test="${user.status == 1}">
                            <font color="#006400"> 在职</font>
                          </c:when>
                          <c:when test="${user.status == 2}">
                           <font color="red">离职</font>
                          </c:when>
                        </c:choose>
                      </td>
                      <jsp:useBean id="createdDate" class="java.util.Date" />
                      <jsp:setProperty name="createdDate" property="time" value="${user.createTime}" />
                      <td class="h6"><fmt:formatDate pattern="yyyy-MM-dd HH:MM:ss" value="${createdDate}" /></td>
                      <td class="h6">
                        <c:choose>
                          <c:when test="${user.status == 1}">
                            <button type="button" onclick="commonDeleteConfirm('/admin/user/status?id=${user.id}&status=2')" class="btn btn-xs btn-info">屏蔽</button>
                          </c:when>
                          <c:when test="${user.status == 2}">
                            <button type="button" onclick="commonDeleteConfirm('/admin/user/status?id=${user.id}&status=1')" class="btn btn-xs btn-info">恢复</button>
                          </c:when>
                        </c:choose>
                        <button type="button" onclick="openEditWindow(this)" value="${user.id}" class="btn btn-xs btn-info">修改</button>
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
  var total = ${pagination.total};
</script>
<script src="/js/user.js"></script>
<script>
  checkClass("menu-list-9");
</script>
</body>
</html>
