<%-- 
    Document   : addFriend
    Created on : 2012-3-21, 0:27:47
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统->增加通讯录</title>
    </head>
    <body bgcolor="CCCFFF">
        <hr noshade>
        <div align="center">
            <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
                <tr>
                    <td width="20%">增加联系人</td>
                    <td width="20%">
                        <a href="http://localhost:8084/PIMS/LookFriendServlet">查看通讯录</a>
                    </td>
                    <td width="20%">
                        <a href="http://localhost:8084/PIMS/friendManager/updateFriend.jsp">修改联系人</a>
                    </td>
                    <td width="20%">
                        <a href="http://localhost:8084/PIMS/friendManager/deleteFriend.jsp">删除联系人</a>
                    </td>
                </tr>
            </table>
        </div>
        <hr noshade>
        <br><br>
        <form action="http://localhost:8084/PIMS/AddFriendServlet" method="post">
            <table border="2" cellspacing="0" cellpadding="0" bgcolor="CCCFFF" width="60%" align="center">
                <tr>
                    <td>用户姓名</td>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>用户电话</td>
                    <td><input type="text" name="phone"/></td>
                </tr>
                <tr>
                    <td>邮箱地址</td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>工作单位</td>
                    <td><input type="text" name="workPlace"/></td>
                </tr>
                <tr>
                    <td>家庭住址</td>
                    <td>
                        <select name="place" size="1">
                            <option value="北京">北  京</option>
                            <option value="上海">上  海</option>
                            <option value="天津">天  津</option>                          
                            <option value="河北">河  北</option>
                            <option value="河南">河  南</option>
                            <option value="吉林">吉  林</option>
                            <option value="黑龙江">黑龙江</option>
                            <option value="内蒙古">内蒙古</option>
                            <option value="山东">山  东</option>
                            <option value="山西">山  西</option>
                            <option value="陕西">陕  西</option>
                            <option value="甘肃">甘  肃</option>
                            <option value="宁夏">宁  夏</option>
                            <option value="青海">青  海</option>
                            <option value="新疆">新  疆</option>
                            <option value="辽宁">辽  宁</option>
                            <option value="江苏">江  苏</option>
                            <option value="浙江">浙  江</option>
                            <option value="安徽">安  微</option>
                            <option value="广东">广  东</option>
                            <option value="海南">海  南</option>
                            <option value="广西">广  西</option>
                            <option value="云南">云  南</option>
                            <option value="贵州">贵  州</option>
                            <option value="四川">四  川</option>
                            <option value="重庆">重  庆</option>
                            <option value="西藏">西  藏</option>
                            <option value="香港">香  港</option>
                            <option value="澳门">澳  门</option>
                            <option value="福建">福  建</option>
                            <option value="江西">江  西</option>
                            <option value="湖南">湖  南</option>
                            <option value="青海">青  海</option>
                            <option value="湖北">湖  北</option>
                            <option value="台湾">台  湾</option>
                            <option value="其它">其  它</option>
                        </select>省(直辖市)
                    </td>
                </tr>
                <tr>
                    <td>用户QQ</td>
                    <td><input type="text" name="QQ"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="确 定" size="12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="清 除" size="12">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
