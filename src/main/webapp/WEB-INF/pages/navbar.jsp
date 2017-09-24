<%@ page import="core.admin.util.SessionUtils" %>
<%@ page import="core.admin.common.AdminConstants" %>
<%@ page import="java.util.List" %>
<%@ page import="core.admin.domain.Menu" %>
<%@ page import="core.admin.domain.AdminUser" %>
<%@ page import="static core.admin.common.AdminConstants.SESSION_USER_KEY" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/admin/park/list">后台系统</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                    class="fa fa-user"></i>
                <%
                    AdminUser user = SessionUtils.getSessionValue(request, SESSION_USER_KEY);
                    if (user != null) {
                        %>
                <%=user.getUsername()%>
                <%
                    }
                %>
                <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="/admin/logout"><i class="fa fa-fw fa-power-off"></i> 安全退出</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <%
                List<Menu> menuList = SessionUtils.getSessionValue(request, AdminConstants.SESSION_USER_MENU_KEY);
                if (menuList != null) {
                    for (Menu menu : menuList) {
            %>
            <li>
                <a href="<%=menu.getUrl()%>" id="menu-list-<%=menu.getId()%>"><i
                        class="fa fa-fw fa-bar-chart-o"></i> <%=menu.getName()%>
                </a>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>
