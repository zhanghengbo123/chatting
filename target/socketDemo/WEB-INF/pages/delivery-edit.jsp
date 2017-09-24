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
    <jsp:include page="common/header.jsp"/>
</head>

<body style="margin-top: 30px;">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                        <form role="form" class="form-horizontal" method="POST" action="/admin/delivery/save">
                                            <input type="hidden" name="id" value="${delivery.id}"/>
                                            <input type="hidden" name="orderId" value="${delivery.orderId}"/>
                                            <input type="hidden" name="provCode" id="provCode" />
                                            <input type="hidden" name="cityCode" id="cityCode" />
                                            <input type="hidden" name="areaCode" id="areaCode" />
                                            <fieldset>
                                                <legend>发货信息</legend>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="radiotp">配送类型</label>

                                                    <c:choose>
                                                        <c:when test="${showType eq 1}">
                                                <div class="col-sm-4" id="radiotp">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sendType" id="sendType2" value="2"  checked >专车
                                                            </label>
                                                </div>

                                                            <div id="carIdDiv">
                                                                <label class="col-sm-2 control-label" for="carId">发货车辆</label>
                                                                <div class="col-sm-4">
                                                                    <select name="carId" id="carId" class="form-control">
                                                                        <option value="${logisticsInfo.id}" ></option>
                                                                        <c:forEach var="car" items="${carList}" varStatus="status">
                                                                            <c:choose>
                                                                                <c:when test="${car.id eq delivery.logisticsId}">
                                                                                    <option value="${car.id}">${car.carNo}</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="${car.id}">${car.carNo}</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                <div class="col-sm-4" id="radiotp">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sendType" id="sendType1" value="1" <c:if test="${delivery.sendType eq 1}"> checked</c:if> >物流公司
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="sendType" id="sendType2" value="2" <c:if test="${delivery.sendType eq 2}"> checked</c:if> >专车
                                                            </label>
                                                </div>
                                                            <div id="logisticsIdDiv" <c:if test="${delivery.sendType eq 2}"> class="hidden" </c:if> >
                                                                <label class="col-sm-2 control-label" for="logisticsId">发货物流公司</label>
                                                                <div class="col-sm-4">
                                                                    <select name="logisticsId" id="logisticsId" class="form-control">
                                                                        <option value="${delivery.id}" ></option>
                                                                        <c:forEach var="logisticsInfo" items="${logisticsList}" varStatus="status">
                                                                            <c:choose>
                                                                                <c:when test="${logisticsInfo.id eq delivery.logisticsId}">
                                                                                    <option value="${logisticsInfo.id}" selected>${logisticsInfo.name}</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="${logisticsInfo.id}">${logisticsInfo.name}</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div id="carIdDiv" <c:if test="${delivery.sendType eq 1}"> class="hidden" </c:if>>
                                                                <label class="col-sm-2 control-label" for="carId">发货车辆</label>
                                                                <div class="col-sm-4">
                                                                    <select name="carId" id="carId" class="form-control">
                                                                        <option value="${logisticsInfo.id}" ></option>
                                                                        <c:forEach var="car" items="${carList}" varStatus="status">
                                                                            <c:choose>
                                                                                <c:when test="${car.id eq delivery.logisticsId}">
                                                                                    <option value="${car.id}">${car.carNo}</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="${car.id}">${car.carNo}</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>




                                            </div>

                                                <div id="companyDiv" <c:if test="${delivery.sendType eq 2}"> class="hidden" </c:if> >
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="userName">公司名称</label>
                                                <div class="col-sm-4" >
                                                    <input type="text" id="userName" name="userName" placeholder="" class="form-control"
                                                           value="${delivery.companyInfo.name}" />
                                                </div>
                                                <label class="col-sm-2 control-label" for="cMobile">联系电话</label>
                                                <div class="col-sm-4">
                                                    <input type="text" name="cMobile" id="cMobile" placeholder="" class="form-control"
                                                           value="${delivery.companyInfo.contact}" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="attachment">备注信息</label>
                                                <div class="col-sm-10" >
                                                    <textarea name="attachment" id="attachment" class="form-control">${delivery.attachment}</textarea>
                                                </div>
                                                </div>

                                                </div>


                                                <div  id="carDiv" <c:if test="${delivery.sendType eq 1}"> class="hidden" </c:if> >
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="carNo">车牌号</label>
                                                    <div class="col-sm-4" >
                                                        <input type="text" id="carNo" name="carNo" placeholder="" class="form-control"
                                                               value="${delivery.receiveCarInfo.carNo}" />
                                                    </div>
                                                    <label class="col-sm-2 control-label" for="owner">车主</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="owner" id="owner" placeholder="" class="form-control"
                                                               value="${delivery.receiveCarInfo.owner}" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="contact">联系方式</label>
                                                    <div class="col-sm-4" >
                                                        <input type="text" id="contact" name="contact" placeholder="" class="form-control"
                                                               value="${delivery.receiveCarInfo.contact}" />
                                                    </div>
                                                    <label class="col-sm-2 control-label" for="carType">车辆类型</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="carType" id="carType" placeholder="" class="form-control"
                                                               value="${delivery.receiveCarInfo.carType}" />
                                                    </div>
                                                </div>

                                                    </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="price">发货费用</label>
                                                    <div class="col-sm-10" >
                                                        <input type="text" name="price" id="price" placeholder="" class="form-control"
                                                               value="${delivery.price}" />
                                                    </div>
                                                </div>
                                                </fieldset>
                                            <fieldset>
                                                <legend>收货信息</legend>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="receiveType">收货类型</label>
                                                    <div class="col-sm-4" id="receiveType">
                                                        <label class="radio-inline">
                                                            <input type="radio" name="receiveType" id="receiveType1" value="1" <c:if test="${delivery.receiveType eq 1}"> checked</c:if>>物流公司
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="receiveType" id="receiveType2" value="2" <c:if test="${delivery.receiveType eq 2}"> checked</c:if> >最终客户
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div  id="receiveLogisticsIdDiv" <c:if test="${delivery.receiveType eq 2}"> class="col-sm-12 hidden" </c:if> <c:if test="${delivery.receiveType eq 1}"> class="col-sm-12" </c:if>>
                                                        <label class="col-sm-2 control-label" for="rlId">收货公司选择</label>
                                                        <div class="col-sm-10" id="rlId">
                                                            <select name="receiveLogisticsId" id="receiveLogisticsId" class="form-control">
                                                                <option value="0" ></option>
                                                                <c:forEach var="cInfo" items="${receiveCompanyList}" varStatus="status">
                                                                    <c:choose>
                                                                        <c:when test="${cInfo.id eq delivery.receiveLogisticsId}">
                                                                            <option value="${cInfo.id}" selected>${cInfo.name}</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${cInfo.id}">${cInfo.name}</option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </select>
                                                            </div>

                                                        </div>
                                                </div>
                                                <div id="receiveIdcDiv" <c:if test="${delivery.receiveType eq 2}"> class="hidden" </c:if>>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="receiveUserName">联系人</label>
                                                    <div class="col-sm-4" >
                                                        <input type="text" id="receiveUserName" name="receiveUserName" placeholder="" class="form-control"
                                                               value="${delivery.receiveUserName}" />
                                                    </div>
                                                    <label class="col-sm-2 control-label" for="receiveUserMobile">联系电话</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" name="receiveUserMobile" id="receiveUserMobile" placeholder="" class="form-control"
                                                               value="${delivery.receiveUserMobile}" />
                                                    </div>
                                                </div>
                                                    </div>

                                                <div id="receiveIdDiv" <c:if test="${delivery.receiveType eq 1}"> class="hidden" </c:if>>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label" for="company">客户名称</label>
                                                        <div class="col-sm-4" >
                                                            <input type="text" id="company" name="company" placeholder="" class="form-control"
                                                                   value="${delivery.company}" />
                                                        </div>
                                                        <label class="col-sm-2 control-label" for="mobile">联系电话</label>
                                                        <div class="col-sm-4">
                                                            <input type="text" name="mobile" id="mobile" placeholder="" class="form-control"
                                                                   value="${delivery.mobile}" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="address">地址</label>
                                                    <div class="col-sm-4" >
                                                        <textarea name="address" id="address" class="form-control">${delivery.address}</textarea>
                                                    </div>
                                                    <label class="col-sm-2 control-label" for="comments">备注</label>
                                                    <div class="col-sm-4">
                                                        <textarea name="comments" id="comments" class="form-control">${delivery.comments}</textarea>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <c:choose>
                                            <c:when test="${delivery.sendNetworkId ne networkId}">
                                                <button class="btn btn-sm btn-primary btn-block" type="submit">保存</button>
                                            </c:when>
                                                </c:choose>

                                        </form>
                                        <%--</div>--%>
                                    <%--<div class="tab-pane fade" id="profile">--%>
                                        <%--<h4>Profile Tab</h4>--%>
                                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>--%>
                                    <%--</div>--%>
                                    <%--</div>--%>

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

    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->

<%--</div>--%>
<!-- /#wrapper -->

<!-- Bootstrap Core JavaScript -->

<script type="text/javascript">
//    checkClass("drama-list");

$(function() {
    $("#sendType1").click(function(){
        $("#logisticsIdDiv").removeClass("hidden");
        $("#logisticsIdDiv").addClass("show");

        $("#companyDiv").removeClass("hidden");
        $("#companyDiv").addClass("show");

        $("#carIdDiv").addClass("hidden");
        $("#carDiv").addClass("hidden");
    });
    $("#sendType2").click(function(){
        $("#carIdDiv").removeClass("hidden");
        $("#carIdDiv").addClass("show");

        $("#carDiv").removeClass("hidden");
        $("#carDiv").addClass("show");
        $("#companyDiv").addClass("hidden");
        $("#logisticsIdDiv").addClass("hidden");
    });


    $("#receiveType1").click(function(){
        $("#receiveLogisticsIdDiv").removeClass("hidden");
        $("#receiveLogisticsIdDiv").addClass("show");
        $("#receiveIdcDiv").removeClass("hidden");
        $("#receiveIdcDiv").addClass("show");
        $("#receiveIdDiv").addClass("hidden");
    });
    $("#receiveType2").click(function(){
        $("#receiveIdDiv").removeClass("hidden");
        $("#receiveIdDiv").addClass("show");
        $("#receiveLogisticsIdDiv").addClass("hidden");
        $("#receiveIdcDiv").addClass("hidden");

    });

    var parkDom=$('#logisticsId');
    parkDom.change(function(){


        var parms={
            id:parkDom.val()
        };
        $.getJSON('/admin/logisticsInfo/editJson',parms,function(result){

            $("#userName").val(result.name);
            $("#cMobile").val(result.contact);


        });

    });

    var receiveDom=$('#receiveLogisticsId');
    receiveDom.change(function(){


        var parmss={
            id:receiveDom.val()
        };
        $.getJSON('/admin/logisticsInfo/editJson',parmss,function(result){

            $("#receiveUserName").val(result.name);
            $("#receiveUserMobile").val(result.contact);
            $("#provCode").val(result.provCode);
            $("#cityCode").val(result.cityCode);
            $("#areaCode").val(result.areaCode);


        });

    });

    var carDom=$('#carId');
    carDom.change(function(){

        var carDomParms={
            id:carDom.val()
        };
        $.getJSON('/admin/carInfo/editJson',carDomParms,function(result){

            $("#carNo").val(result.carNo);
            $("#owner").val(result.owner);
            $("#contact").val(result.contact);

            $("#carType").val(result.carTypeStr);


        });

    });

});
$('select').searchSelect();
</script>
</body>
</html>
