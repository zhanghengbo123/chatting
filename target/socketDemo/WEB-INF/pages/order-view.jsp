<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                            <%--<form role="form" class="form-horizontal" method="POST" enctype="multipart/form-data"--%>
                                  <%--action="/admin/order/save">--%>
                                <input type="hidden" name="id" value="${order.id}"/>
                                <input type="hidden" name="shipper.id" value="${order.shipper.id}"/>
                                <input type="hidden" name="consignee.id" value="${order.consignee.id}"/>

                                <fieldset>
                                    <legend>订单信息</legend>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="orderNo">订单编号</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" id="orderNo" name="orderNo"
                                                   value="${order.orderNo}" type="text" placeholder="订单编号" required/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="payType">付款方式</label>
                                        <div class="col-sm-4">
                                            <select name="payType" id="payType" class="form-control">
                                                <c:forEach var="oType" items="${payTypeMap}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${oType.key eq order.payType}">
                                                            <option value="${oType.key}"
                                                                    selected>${oType.value}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${oType.key}">${oType.value}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label">送货方式</label>
                                        <div class="col-sm-4">
                                            <select name="receiveType" id="receiveType" class="form-control">
                                                <c:forEach var="oType" items="${receiveTypeMap}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${oType.key eq order.receiveType}">
                                                            <option value="${oType.key}"
                                                                    selected>${oType.value}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${oType.key}">${oType.value}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="safeAmount">保险额度</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="safeAmount" id="safeAmount"
                                                   value="${order.safeAmount}" type="number" placeholder="只能输入数字"/>
                                        </div>
                                        <label class="col-sm-2 control-label">保险费用</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="safeCost" id="safeCost"
                                                   value="${order.safeCost}" type="number" placeholder="只能输入数字"/>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset>
                                    <legend>发件人信息</legend>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="shipperShipperName">公司名称</label>
                                        <div class="col-sm-4">
                                            <input class="form-control hidden" name="shipper.shipperName"
                                                   id="shipperShipperName" value="${order.shipper.linkmanMobile}"
                                                   type="text" placeholder="公司名称"/>
                                            <input class="form-control hidden" name="shipper.provCode"
                                                   value="${order.shipper.provCode}" id="shipperProvCode" type="text"/>
                                            <input class="form-control hidden" name="shipper.cityCode"
                                                   value="${order.shipper.cityCode}" id="shipperCityCode" type="text"/>
                                            <input class="form-control hidden" name="shipper.areaCode"
                                                   value="${order.shipper.areaCode}" id="shipperAreaCode" type="text"/>

                                            <select name="shipper.customerId" id="sendCustomerId" class="form-control">
                                                <option value="0">选择发件人</option>
                                                <c:forEach var="cInfo" items="${customerList}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${cInfo.id eq order.shipper.customerId}">
                                                            <option value="${cInfo.id}"
                                                                    selected>${cInfo.company}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${cInfo.id}">${cInfo.company}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <label class="col-sm-2 control-label" for="shipperLinkmanName">发件人</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="shipper.linkmanName"
                                                   id="shipperLinkmanName" value="${order.shipper.linkmanName}"
                                                   type="text" required placeholder="发件人姓名"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="shipperLinkmanMobile">电话</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="shipper.linkmanMobile"
                                                   id="shipperLinkmanMobile" value="${order.shipper.linkmanMobile}"
                                                   required type="tel" placeholder="联系电话"/>
                                        </div>
                                        <label class="col-sm-2 control-label" for="shipperAddress">地址</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="shipper.address" id="shipperAddress"
                                                   value="${order.shipper.address}" required type="text"
                                                   placeholder="地址"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="shipperComment">备注</label>
                                        <div class="col-sm-10">
                                            <textarea id="shipperComment" name="shipper.comment"
                                                      class="form-control">${order.shipper.comment} </textarea>
                                        </div>

                                    </div>
                                </fieldset>

                                <fieldset>
                                    <legend>收件人信息</legend>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="consigneeConsigneeName">公司名称</label>
                                        <div class="col-sm-4">
                                            <input class="form-control hidden" name="consignee.consigneeName"
                                                   value="${order.consignee.consigneeName}" id="consigneeConsigneeName"
                                                   type="text" placeholder="公司名称"/>
                                            <input class="form-control hidden" name="consignee.provCode"
                                                   value="${order.consignee.provCode}" id="consigneeProvCode"
                                                   type="text"/>
                                            <input class="form-control hidden" name="consignee.cityCode"
                                                   value="${order.consignee.cityCode}" id="consigneeCityCode"
                                                   type="text"/>
                                            <input class="form-control hidden" name="consignee.areaCode"
                                                   value="${order.consignee.areaCode}" id="consigneeAreaCode"
                                                   type="text"/>

                                            <select name="consignee.customerId" id="customerId" class="form-control">
                                                <option value="0">选择收件人</option>
                                                <c:forEach var="cInfo" items="${customerList}" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${cInfo.id eq order.consignee.customerId}">
                                                            <option value="${cInfo.id}"
                                                                    selected>${cInfo.company}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${cInfo.id}">${cInfo.company}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        <label class="col-sm-2 control-label" for="consigneeLinkmanName">联系人</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="consignee.linkmanName"
                                                   value="${order.consignee.linkmanName}" required
                                                   id="consigneeLinkmanName" type="text" placeholder="联系人"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="consigneeLinkmanMobile">电话</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="consignee.linkmanMobile"
                                                   value="${order.consignee.linkmanMobile}" id="consigneeLinkmanMobile"
                                                   required type="text" placeholder="电话"/>
                                        </div>
                                        <label class="col-sm-2 control-label" for="consigneeAddress">地址</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" name="consignee.address"
                                                   value="${order.consignee.address}" id="consigneeAddress" type="text"
                                                   placeholder="地址"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="consigneeComment">备注</label>
                                        <div class="col-sm-10">
                                            <textarea id="consigneeComment" name="consignee.comment"
                                                      class="form-control">${order.consignee.comment} </textarea>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset>
                                    <legend>货物信息</legend>
                                    <div id="tabs" class="panel panel-default">
                                        <div class="panel-body">
                                            <!-- Nav tabs -->
                                            <ul class="nav nav-tabs">
                                                <c:choose>
                                                    <c:when test="${! empty order.goods}">
                                                        <c:forEach var="goods" items="${order.goods}"
                                                                   varStatus="status">
                                                            <c:choose>
                                                                <c:when test="${status.first}">
                                                                    <li class="active"><a href="#tabs${status.index}"
                                                                                          data-toggle="tab">${goods.goodsName}</a>
                                                                    </li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <li><a href="#tabs${status.index}"
                                                                           data-toggle="tab">${goods.goodsName}</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a href="#home" data-toggle="tab">货物</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <%--&nbsp;&nbsp;<span class="glyphicon glyphicon-plus" id="addTab"></span>--%>
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <c:choose>
                                                    <c:when test="${! empty order.goods}">
                                                        <c:forEach var="tabGoods" items="${order.goods}"
                                                                   varStatus="gstatus">


                                                            <div class="tab-pane fade in <c:if test="${gstatus.first}">active</c:if>" id="tabs${gstatus.index}">
                                                                <input type="hidden" name="goods[${gstatus.index}].id"
                                                                       value="${tabGoods.id}"/>
                                                                <h4></h4>
                                                                <div class="form-group">
                                                                    <label class="col-sm-2 control-label" for="goods[${gstatus.index}].goodsName">名称</label>
                                                                    <div class="col-sm-4">
                                                                        <input class="form-control" name="goods[${gstatus.index}].goodsName"
                                                                               id="goods[${gstatus.index}].goodsName"
                                                                               value="${tabGoods.goodsName}" required
                                                                               type="text" placeholder="名称"/>
                                                                    </div>
                                                                    <%--<label class="col-sm-2 control-label" for="goods[${gstatus.index}].categoryId">所属分类</label>--%>
                                                                    <%--<div class="col-sm-4">--%>
                                                                        <%--<select name="goods[${gstatus.index}].categoryId" id="goods[${gstatus.index}].categoryId"--%>
                                                                                <%--class="form-control">--%>
                                                                            <%--<c:forEach var="oType" items="${orderCategoryMap}"--%>
                                                                                       <%--varStatus="status">--%>
                                                                                <%--<c:choose>--%>
                                                                                    <%--<c:when test="${oType.key eq tabGoods.categoryId}">--%>
                                                                                        <%--<option value="${oType.key}"--%>
                                                                                                <%--selected>${oType.value}</option>--%>
                                                                                    <%--</c:when>--%>
                                                                                    <%--<c:otherwise>--%>
                                                                                        <%--<option value="${oType.key}">${oType.value}</option>--%>
                                                                                    <%--</c:otherwise>--%>
                                                                                <%--</c:choose>--%>
                                                                            <%--</c:forEach>--%>
                                                                        <%--</select>--%>
                                                                    <%--</div>--%>
                                                                    <label class="col-sm-2 control-label"
                                                                           for="goods[${gstatus.index}].weight">重量</label>
                                                                    <div class="col-sm-4">
                                                                        <input class="form-control" name="goods[${gstatus.index}].weight"
                                                                               id="goods[${gstatus.index}].weight" value="${tabGoods.weight}"
                                                                               type="number" placeholder="单位 公斤"/>
                                                                    </div>
                                                                </div>
                                                                <%--<div class="form-group">--%>
                                                                    <%--<label class="col-sm-2 control-label">长\宽\高(厘米)</label>--%>
                                                                    <%--<div class="col-sm-2">--%>
                                                                        <%--<input class="form-control" name="goods[${gstatus.index}].gLength"--%>
                                                                               <%--id="goods[${gstatus.index}].gLength"--%>
                                                                               <%--value="${tabGoods.gLength}" type="text"--%>
                                                                               <%--placeholder="长度"/>--%>
                                                                    <%--</div>--%>
                                                                    <%--<div class="col-sm-2">--%>
                                                                        <%--<input class="form-control" name="goods[${gstatus.index}].width"--%>
                                                                               <%--id="goods[${gstatus.index}].width" value="${tabGoods.width}"--%>
                                                                               <%--type="text" placeholder="宽度"/>--%>
                                                                    <%--</div>--%>
                                                                    <%--<div class="col-sm-2">--%>
                                                                        <%--<input class="form-control" name="goods[${gstatus.index}].height"--%>
                                                                               <%--id="goods[${gstatus.index}].height" value="${tabGoods.height}"--%>
                                                                               <%--type="text" placeholder="高度"/>--%>
                                                                    <%--</div>--%>

                                                                    <%--<label class="col-sm-1 control-label"--%>
                                                                           <%--for="goods[${gstatus.index}].weight">重量</label>--%>
                                                                    <%--<div class="col-sm-3">--%>
                                                                        <%--<input class="form-control" name="goods[${gstatus.index}].weight"--%>
                                                                               <%--id="goods[${gstatus.index}].weight" value="${tabGoods.weight}"--%>
                                                                               <%--type="number" placeholder="单位 公斤"/>--%>
                                                                    <%--</div>--%>
                                                                <%--</div>--%>
                                                                <div class="form-group">
                                                                    <label class="col-sm-2 control-label"
                                                                           for="goods[${gstatus.index}].amount">数量</label>
                                                                    <div class="col-sm-4">
                                                                        <input class="form-control" name="goods[${gstatus.index}].amount"
                                                                               id="goods[${gstatus.index}].amount" value="${tabGoods.amount}"
                                                                               required type="number" placeholder="货物数量"/>
                                                                    </div>
                                                                    <label class="col-sm-2 control-label"
                                                                           for="goods[${gstatus.index}].packageType">包装类型</label>
                                                                    <div class="col-sm-4">
                                                                        <select name="goods[${gstatus.index}].packageType"
                                                                                id="goods[${gstatus.index}].packageType" class="form-control">
                                                                            <c:forEach var="oType" items="${packageTypeMap}"
                                                                                       varStatus="status">
                                                                                <c:choose>
                                                                                    <c:when test="${oType.key eq tabGoods.packageType}">
                                                                                        <option value="${oType.key}"
                                                                                                selected>${oType.value}</option>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <option value="${oType.key}">${oType.value}</option>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">

                                                                    <label class="col-sm-2 control-label" for="files">图片</label>
                                                                    <div class="col-sm-10">
                                                                        <input class="form-control" id="files" name="files"
                                                                               type="file" placeholder=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-2 control-label"
                                                                           for="goods[${gstatus.index}].description">描述</label>
                                                                    <div class="col-sm-4">
                                                            <textarea class="form-control" name="goods[${gstatus.index}].description"
                                                                      id="goods[${gstatus.index}].description">${tabGoods.description}</textarea>
                                                                    </div>
                                                                    <label class="col-sm-2 control-label"
                                                                           for="goods[${gstatus.index}].descriptionTwo">描述二</label>
                                                                    <div class="col-sm-4">
                                                            <textarea class="form-control"
                                                                      name="goods[${gstatus.index}].descriptionTwo"
                                                                      id="goods[${gstatus.index}].descriptionTwo">${tabGoods.descriptionTwo}</textarea>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="tab-pane fade in active" id="home">
                                                            <input type="hidden" name="goods[0].id"
                                                                   value="${order.goods[0].id}"/>
                                                            <h4></h4>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" for="goods[0].goodsName">名称</label>
                                                                <div class="col-sm-4">
                                                                    <input class="form-control" name="goods[0].goodsName"
                                                                           id="goods[0].goodsName"
                                                                           value="${order.goods[0].goodsName}" required
                                                                           type="text" placeholder="名称"/>
                                                                </div>
                                                                <label class="col-sm-2 control-label"
                                                                       for="goods[0].weight">重量</label>
                                                                <div class="col-sm-4">
                                                                    <input class="form-control" name="goods[0].weight"
                                                                           id="goods[0].weight" value="${order.goods[0].weight}"
                                                                           type="number" placeholder="单位 公斤"/>
                                                                </div>
                                                                <%--<label class="col-sm-2 control-label" for="goods[0].categoryId">所属分类</label>--%>
                                                                <%--<div class="col-sm-4">--%>
                                                                    <%--<select name="goods[0].categoryId" id="goods[0].categoryId"--%>
                                                                            <%--class="form-control">--%>
                                                                        <%--<c:forEach var="oType" items="${orderCategoryMap}"--%>
                                                                                   <%--varStatus="status">--%>
                                                                            <%--<c:choose>--%>
                                                                                <%--<c:when test="${oType.key eq order.goods[0].categoryId}">--%>
                                                                                    <%--<option value="${oType.key}"--%>
                                                                                            <%--selected>${oType.value}</option>--%>
                                                                                <%--</c:when>--%>
                                                                                <%--<c:otherwise>--%>
                                                                                    <%--<option value="${oType.key}">${oType.value}</option>--%>
                                                                                <%--</c:otherwise>--%>
                                                                            <%--</c:choose>--%>
                                                                        <%--</c:forEach>--%>
                                                                    <%--</select>--%>
                                                                <%--</div>--%>
                                                            </div>
                                                            <%--<div class="form-group">--%>
                                                                <%--<label class="col-sm-2 control-label">长\宽\高(厘米)</label>--%>
                                                                <%--<div class="col-sm-2">--%>
                                                                    <%--<input class="form-control" name="goods[0].gLength"--%>
                                                                           <%--id="goods[0].gLength"--%>
                                                                           <%--value="${order.goods[0].gLength}" type="text"--%>
                                                                           <%--placeholder="长度"/>--%>
                                                                <%--</div>--%>
                                                                <%--<div class="col-sm-2">--%>
                                                                    <%--<input class="form-control" name="goods[0].width"--%>
                                                                           <%--id="goods[0].width" value="${order.goods[0].width}"--%>
                                                                           <%--type="text" placeholder="宽度"/>--%>
                                                                <%--</div>--%>
                                                                <%--<div class="col-sm-2">--%>
                                                                    <%--<input class="form-control" name="goods[0].height"--%>
                                                                           <%--id="goods[0].height" value="${order.goods[0].height}"--%>
                                                                           <%--type="text" placeholder="高度"/>--%>
                                                                <%--</div>--%>

                                                                <%--<label class="col-sm-1 control-label"--%>
                                                                       <%--for="goods[0].weight">重量</label>--%>
                                                                <%--<div class="col-sm-3">--%>
                                                                    <%--<input class="form-control" name="goods[0].weight"--%>
                                                                           <%--id="goods[0].weight" value="${order.goods[0].weight}"--%>
                                                                           <%--type="number" placeholder="单位 公斤"/>--%>
                                                                <%--</div>--%>
                                                            <%--</div>--%>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label"
                                                                       for="goods[0].amount">数量</label>
                                                                <div class="col-sm-4">
                                                                    <input class="form-control" name="goods[0].amount"
                                                                           id="goods[0].amount" value="${order.goods[0].amount}"
                                                                           required type="number" placeholder="货物数量"/>
                                                                </div>
                                                                <label class="col-sm-2 control-label"
                                                                       for="goods[0].packageType">包装类型</label>
                                                                <div class="col-sm-4">
                                                                    <select name="goods[0].packageType"
                                                                            id="goods[0].packageType" class="form-control">
                                                                        <c:forEach var="oType" items="${packageTypeMap}"
                                                                                   varStatus="status">
                                                                            <c:choose>
                                                                                <c:when test="${oType.key eq order.goods[0].packageType}">
                                                                                    <option value="${oType.key}"
                                                                                            selected>${oType.value}</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="${oType.key}">${oType.value}</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">

                                                                <label class="col-sm-2 control-label" for="files">图片</label>
                                                                <div class="col-sm-10">
                                                                    <input class="form-control" id="files" name="files"
                                                                           type="file" placeholder=""/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label"
                                                                       for="goods[0].description">描述</label>
                                                                <div class="col-sm-4">
                                                            <textarea class="form-control" name="goods[0].description"
                                                                      id="goods[0].description">${order.goods[0].description}</textarea>
                                                                </div>
                                                                <label class="col-sm-2 control-label"
                                                                       for="goods[0].descriptionTwo">描述二</label>
                                                                <div class="col-sm-4">
                                                            <textarea class="form-control"
                                                                      name="goods[0].descriptionTwo"
                                                                      id="goods[0].descriptionTwo">${order.goods[0].descriptionTwo}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>

                                    </div>

                                </fieldset>

                                <%--<button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>--%>
                            <%--</form>--%>
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
<script src="/js/template.js"></script>
<script id="goodTpl" type="text/html">
    <input type="hidden" name="goods[{{index}}].id" value=""/>
    <h4></h4>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="goods[{{index}}].goodsName">名称</label>
        <div class="col-sm-4">
            <input class="form-control" name="goods[{{index}}].goodsName" id="goods[{{index}}].goodsName" value=""
                   required type="text" placeholder="名称"/>
        </div>
        <label class="col-sm-2 control-label" for="goods[{{index}}].categoryId">所属分类</label>
        <div class="col-sm-4">
            <select name="goods[{{index}}].categoryId" id="goods[{{index}}].categoryId" class="form-control">
                {{each orderCategoryList as v i}}
                <option value="{{v.key}}" {{if i==0}}selected {{/if}}>{{v.value}}</option>
                {{/each}}
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">长\宽\高(厘米)</label>
        <div class="col-sm-2">
            <input class="form-control" name="goods[{{index}}].gLength" id="goods[{{index}}].gLength" value=""
                   type="text" placeholder="长度"/>
        </div>
        <div class="col-sm-2">
            <input class="form-control" name="goods[{{index}}].width" id="goods[{{index}}].width" value="" type="text"
                   placeholder="宽度"/>
        </div>
        <div class="col-sm-2">
            <input class="form-control" name="goods[{{index}}].height" id="goods[{{index}}].height" value="" type="text"
                   placeholder="高度"/>
        </div>

        <label class="col-sm-1 control-label" for="goods[{{index}}].weight">重量</label>
        <div class="col-sm-3">
            <input class="form-control" name="goods[{{index}}].weight" id="goods[{{index}}].weight" value=""
                   type="number" placeholder="单位 公斤"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="goods[{{index}}].amount">数量</label>
        <div class="col-sm-4">
            <input class="form-control" name="goods[{{index}}].amount" id="goods[{{index}}].amount" value="" required
                   type="number" placeholder="货物数量"/>
        </div>
        <label class="col-sm-2 control-label" for="goods[{{index}}].packageType">包装类型</label>
        <div class="col-sm-4">
            <select name="goods[{{index}}].packageType" id="goods[{{index}}].packageType" class="form-control">
                {{each packageList as value i}}
                <option value="{{value.key}}" {{if i==0}}selected {{/if}} >{{value.value}}</option>
                {{/each}}
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="files{{index}}">图片</label>
        <div class="col-sm-10">
            <input class="form-control" id="files{{index}}" name="files" type="file" placeholder=""/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="goods[{{index}}].description">描述</label>
        <div class="col-sm-4">
            <textarea class="form-control" name="goods[{{index}}].description"
                      id="goods[{{index}}].description"></textarea>
        </div>
        <label class="col-sm-2 control-label" for="goods[{{index}}].descriptionTwo">描述二</label>
        <div class="col-sm-4">
            <textarea class="form-control" name="goods[{{index}}].descriptionTwo"
                      id="goods[{{index}}].descriptionTwo"></textarea>
        </div>
    </div>
</script>
<script type="text/javascript">
    var idx = ${goodsSize};
    $(function () {
        $('#tabs').addtabs({monitor: '.panel-body'});
        $('#addTab').click(function () {

            var data = {
                index: idx,
                packageList: ${packageTypeJson},
                orderCategoryList: ${orderCategoryJson}
            };
            var html = template('goodTpl', data);
            Addtabs.add({
                id: idx,
                title: '货物' + (idx+1),
                content: html
            });
            idx++;
        });
    })
    var sendCustomerId = $('#sendCustomerId');
    sendCustomerId.change(function () {

        var customerDomParms = {
            id: sendCustomerId.val()
        };
        $.getJSON('/admin/customer/editJson', customerDomParms, function (result) {
            console.log(result);
            $("#shipperLinkmanName").val(result.contacts);
            $("#shipperConsigneeName").val(result.company);
            $("#shipperLinkmanMobile").val(result.mobile);
            $("#shipperAddress").val(result.address);
            $("#shipperComment").val(result.remarks);
            $("#shipperProvCode").val(result.provCode);
            $("#shipperCityCode").val(result.cityCode);
            $("#shipperAreaCode").val(result.areaCode);

        });

    });

    var customerId = $('#customerId');
    customerId.change(function () {

        var customerDomParms = {
            id: customerId.val()
        };
        $.getJSON('/admin/customer/editJson', customerDomParms, function (result) {

            $("#consigneeLinkmanName").val(result.contacts);
            $("#consigneeConsigneeName").val(result.company);
            $("#consigneeLinkmanMobile").val(result.mobile);
            $("#consigneeAddress").val(result.address);
            $("#consigneeComment").val(result.remarks);
            $("#consigneeProvCode").val(result.provCode);
            $("#consigneeCityCode").val(result.cityCode);
            $("#consigneeAreaCode").val(result.areaCode);


        });

    });


</script>
</body>
</html>
