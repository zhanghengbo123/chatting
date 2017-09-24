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

<body style="margin-top: 20px;">

                                <form role="form" method="POST" action="/admin/chargeStandard/save">
                                    <input type="hidden" name="id" value="${chargeStandard.id}"/>
                                    <input type="hidden" name="lineId" value="${chargeStandard.lineId}"/>
                                    <table class="table table-bordered table-striped formLayout m0">
                                        <tr>
                                            <td>收费标准类型：</td>
                                            <td>

                                                <select name="type" id="type" class="form-control">
                                                    <option value="1"  <c:if test="${chargeStandard.type eq 1}"> selected</c:if>>按体积</option>
                                                    <option value="2"  <c:if test="${chargeStandard.type eq 2}"> selected</c:if>>按重量</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>收费标准：</td>
                                            <td>
                                                <input type="text" name="name" placeholder="30-50公斤等" class="form-control"
                                                       value="${chargeStandard.name}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>价格：</td>
                                            <td>
                                                <input type="text" name="chargeValue" placeholder="输入数字" class="form-control" required
                                                       value="${chargeStandard.chargeValue}" />
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>
                                </form>
</body>
</html>
