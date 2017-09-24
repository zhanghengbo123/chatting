<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>三四物流-物流采集系统</title>
    <jsp:include page="common/header.jsp"/>
    <link rel="stylesheet" href="/startbootstrap/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=107ef32d14324d539c1659d26562503f"></script>
    <script src="/js/star-rating.min.js"></script>
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap{width:100%;height:100%;}
        p{margin-left:5px; font-size:14px;}

        .popText{font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;font-size: 12px}

    </style>
</head>
<body>
<div id="allmap"></div>
<script type="text/javascript">
    //    $("#input-id").rating(); //默认值初始化

    // 百度地图API功能
    map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.417854,39.921988), 15);
    map.addControl(new BMap.NavigationControl());        // 添加平移缩放控件
    map.addControl(new BMap.ScaleControl());             // 添加比例尺控件
    map.addControl(new BMap.OverviewMapControl());       //添加缩略地图控件
    map.enableScrollWheelZoom();                         //启用滚轮放大缩小
    map.disable3DBuilding();
    var data_info = ${msg};
//            [['116.417854','39.921988','ddfff',"上地公司"],
//        [116.406605,39.921585,"地址：北京市东城区东华门大街","东城公司"],
//        [116.412222,39.912345,"地址：北京市东城区正义路甲5号","正义路公司"]
//    ];
    for(var i=0;i<data_info.length;i++){
        var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
        var content = data_info[i][2];
        var title = '<b>'+data_info[i][3]+'</b>';
        map.addOverlay(marker);               // 将标注添加到地图中
        addClickHandler(title,content,marker);
    }
    function addClickHandler(title,content,marker){
        marker.addEventListener("click",function(e){
                    openInfo(title,content,e)}
        );
    }

    function openInfo(title,content,e){
        var opts = {
            width : 250,     // 信息窗口宽度
            height: 100,     // 信息窗口高度
            title : title , // 信息窗口标题
            enableMessage:true//设置允许信息窗发送短息
        };
        var p = e.target;
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
        var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow,point); //开启信息窗口
    }
</script>
</body>
</html>
