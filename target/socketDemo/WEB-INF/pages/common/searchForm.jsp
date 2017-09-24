<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String postUrl = request.getParameter("postUrl");
%>
<form id="searchForm" role="form" method="post" action="<%=postUrl%>" onkeydown="if(event.keyCode==13){return false;}">
    <div style="top:0;left:0;z-index:1000;POSITION: absolute;">
        <div style="overflow: hidden; left: 323px; top: 90.5px; display: none;" id="form_cities">
            <div id="top_cities">简码/汉字或↑↓</div>
            <div id="panel_cities"></div>
            <div style="display: block;" id="flip_cities">
                «&nbsp;向前&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="cityflip" onclick="city_showlist(1);return false;">向后&nbsp;»</a>
            </div>
        </div>
    </div>

    <div style="top:0;left:0;z-index:1000;POSITION: absolute;">
        <div style="overflow: hidden; display: none; left: 323px; top: 90.5px;" id="form_cities2">
            <div id="top_cities1"> </div>
            <div id="panel_cities2"></div>
        </div>
    </div>
    <table class="cx_from" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
        <tr>
            <td class="font_r" width="97px"><span>*</span>出发地：</td>
            <td width="250px">
                <input name="fromStation" id="fromStation" type="hidden" />
                <input name="fromCode" maxlength="15" value="" required id="fromCode" style="width:200px;" class="input_20txt_gray" type="text" />
            </td>
            <td class="font_r" width="64px"><span>*</span>目的地：</td>
            <td width="250px">
                <input name="toStation" id="toStation" type="hidden" />
                <input name="toCode" maxlength="15" value="" required id="toCode" style="width:200px;" class="input_20txt_gray" type="text" />
            </td>
            <td width="100px">
                <button class="btn btn-primary btn-group-vertical" type="submit">查询</button>
            </td>
        </tr>
        </tbody>
    </table>
</form>