<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>

<script type="text/javascript" >

    function aaa() {
        var dig = new Dialog();
        dig.show();
    }
    $( "#opener" ).click(function() {
        $( "#dialog" ).dialog( "open" );
    });
</script>
<script src="/js/jquery-3.2.1.min.js"></script>
<body>
<center>
    <div id="dialog" title="基本的对话框">
        <p>这是一个默认的对话框，用于显示信息。对话框窗口可以移动，调整尺寸，默认可通过 'x' 图标关闭。</p>
    </div>

    <button id="opener">打开对话框</button>

    <form action="/qr/create" method="post">
        <table>
            <tr>
                <td>二维码内容</td>
                <td><input type="text" name="content" id="content" alt="http:/www.baidu.com"/></td>
                <td><input type="submit" name="btn"  ></td>
            </tr>
        </table>
    </form>

</center>

<center>
    <form action="/user/create" method="post">
        <table>
            <tr>
                <td>name:</td>
                <td><input type="text" name="name" id="name" /></td>
            </tr>
            <tr>
                <td>password:</td>
                <td><input type="text" name="password" id="password"/></td>
            </tr>
            <tr>
            <td><input type="submit" name="btn"  ></td>

            </tr>

        </table>
    </form>

</center>
<center>
<video width="320" height="240" controls autoplay>
    <source type="video/mp4" src=" video/4fd019763918c27d12a4a612407a3b47.mp4">
</video>

</center>
<%--<p>
<center>

    <OBJECT id=WMP height=320 standby=Loading... width=332 classid=clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6>
        <param name="url" type="video/mp4" src=" video/4fd019763918c27d12a4a612407a3b47.mp4">
    </OBJECT>
</center>

</p>--%>

<center>
    <form action="/mail/send" method="post">
        <input type="text" name="username" id="username" />
        <input type="text" name="password" id="pwd"/>
        <input type="text" name="mail" id="mail"/>
        <input type="submit" name="sub" value="发送"/>
    </form>
</center>
<button onclick="aaa()">fjsklm vcx</button>
</body>
</html>
