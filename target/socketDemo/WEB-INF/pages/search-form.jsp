<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form id="searchForm" method="post" action="${param.action}">
    搜索关键字：<input type="text" id="keyword" name="keyword" value="${param.keyword}"/>
    <button id="btn-search" class="btn btn-sm btn-primary" type="submit">搜索</button>
</form>