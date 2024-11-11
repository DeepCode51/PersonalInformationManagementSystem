<%-- 
    Document   : updateFriend
    Created on : 2012-3-21, 1:09:12
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统->修改通讯录</title>
    </head>
    <body bgcolor="CCCFFF">
        <hr noshade>
        <div align="center">
            <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
                <tr>
                    <td width="20%">
                        <a href="http://localhost:8084/PIMS/friendManager/addFriend.jsp">增加联系人</a>
                    </td>
                    <td width="20%">
                        <a href="http://localhost:8084/PIMS/LookFriendServlet">查看通讯录</a>
                    </td>
                    <td width="20%">
                        修改联系人
                    </td>
                    <td width="20%">
                        <a href="http://localhost:8084/PIMS/friendManager/deleteFriend.jsp">删除联系人</a>
                    </td>
                </tr>
            </table>
        </div>
        <hr noshade>
        <br><br>
        <form action="http://localhost:8084/PIMS/UpdateFriendServlet" method="post">
            <table border="2" cellspacing="0" cellpadding="0" bgcolor="CCCFFF" width="60%" align="center">
                <tr align="center">
                    <td align="center" height="130">
                        <p>请输入要修改人的姓名</p>
                        姓名<input type="text" name="friendName"/><br>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input type="submit" value="确 定" size="12"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="清 除" size="12"/>
                     </td>
                 </tr>
            </table>
        </form>
    </body>
</html>
