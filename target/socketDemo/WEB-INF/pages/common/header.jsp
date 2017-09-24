<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Bootstrap Core CSS -->
<link href="/startbootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/startbootstrap/css/sb-admin.css" rel="stylesheet">
<link href="/css/jquery.searchselect.css" rel="stylesheet">
<link href="/css/bootstrap-addtabs.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/startbootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link rel="shortcut icon" href="/images/favicon.ico"/>
<script src="/startbootstrap/js/jquery.js"></script>
<script src="/js/jquery.searchselect.min.js"></script>
<script src="/js/jquery.slimscroll.min.js"></script>
<script src="/js/bootstrap-addtabs.js"></script>
<script src="/js/jquery.twbsPagination.js"></script>
<script src="/startbootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/city.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="/layer/layer.js"></script>

<script type="text/javascript">
    //sys confirm for globel javascript.
    function commonDeleteConfirm(url) {
        layer.confirm('删除后不可恢复，确定删除？', {icon: 3, title:'提示'}, function(index){
            //do something
            layer.close(index);
            var myForm = document.getElementById("commonPostForm");
            if(myForm == null){
                //兼容老的删除方式。
                window.location.href=url
            }else{//新当页刷新。
                myForm.action = url;myForm.submit();
            }
        });
    }

    function commonReceiveConfirm(url) {
        layer.confirm('确定收到货物？', {icon: 3, title:'提示'}, function(index){
            //do something
            layer.close(index);
            var myForm = document.getElementById("commonPostForm");
            if(myForm == null){
                //兼容老的删除方式。
                window.location.href=url
            }else{//新当页刷新。
                myForm.action = url;myForm.submit();
            }
        });
    }
    function commonSubmit(formId,url) {
        if(!confirm('确定保存')){ return; };
        var myForm = document.getElementById(formId);//按照form进行提交.
        myForm.action = url;myForm.submit();
    }
    function commonConfirm(url,message) {
        if(!confirm(message)){ return; };window.location.href=url;
    }
    function addRecommendConfirm(url,message) {
        if(!confirm(message)){ return; };window.location.href=url;" target='_blank'";
    }
    function commonCheckAll(){
        var obj = document.getElementsByName("checkid");var len = obj.length ;
        for(var i=0;i<len;i++){obj[i].checked = document.getElementById("checkall").checked;}
    }
    //deleteAll
    function commonDeleteAll(url){
        var objCheck = document.getElementsByName("checkid") ;
        var len = objCheck.length ;var canDeleteAll = false;var url = url;
        for( var i = 0; i < len; i ++){if(objCheck[i].checked){
            canDeleteAll = true;url= url +"&ids=" + objCheck[i].value;}}
        if(canDeleteAll){
            if(!confirm('确定删除？')){ return false;}
            window.location.href=url;
        }else{alert('没有选择删除数据。');return null;}
    }
    function formatSeconds(value) {
        var theTime = parseInt(value);// 秒
        var theTime1 = 0;// 分
        var theTime2 = 0;// 小时
        if(theTime > 60) {
            theTime1 = parseInt(theTime/60);
            theTime = parseInt(theTime%60);
            if(theTime1 > 60) {
                theTime2 = parseInt(theTime1/60);
                theTime1 = parseInt(theTime1%60);
            }
        }
        var result = ""+parseInt(theTime)+"秒";
        if(theTime1 > 0) {
            result = ""+parseInt(theTime1)+"分"+result;
        }
        if(theTime2 > 0) {
            result = ""+parseInt(theTime2)+"小时"+result;
        }
        return result;
    }
    //-->
</script>