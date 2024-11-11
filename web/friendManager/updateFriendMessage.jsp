<%-- 
    Document   : updateFriendMessage
    Created on : 2012-3-21, 1:33:34
    Author     : Administrator
--%>

<%@page import="friendManager.LookFriendBean"%>
<%@page import="java.util.ArrayList"%>
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
        <form action="http://localhost:8084/PIMS/UpdateFriendMessageServlet" method="post">
            <table border="2" cellspacing="0" cellpadding="0" bgcolor="CCCFFF" width="60%" align="center">
            <%
                ArrayList friendslist2=(ArrayList)session.getAttribute("friendslist2");
                if(friendslist2==null||friendslist2.size()==0){
                    response.sendRedirect("http://localhost:8084/PIMS/friendManager/lookFriend.jsp");
                }else{
                    for(int i=friendslist2.size()-1;i>=0;i--){
                        LookFriendBean ff=(LookFriendBean)friendslist2.get(i);
            %>
                <tr>
                    <td height="30">用户姓名</td>
                    <td><%=ff.getName()%></td>
                </tr>
                <tr>
                    <td height="30">用户电话</td>
                    <td><input type="text" name="phone" value="<%=ff.getPhone()%>"></td>
                </tr>
                <tr>
                    <td height="30">邮箱地址</td>
                    <td><input type="text" name="email" value="<%=ff.getEmail()%>"></td>
                </tr>
                <tr>
                    <td height="30">工作单位</td>
                    <td><input type="text" name="workPlace" value="<%=ff.getWorkPlace()%>"></td>
                </tr>
                <tr>
                    <td height="30">家庭住址</td>
                    <td><input type="text" name="place" value="<%=ff.getPlace()%>"></td>
                </tr>
                <tr>
                    <td height="30">用户QQ</td>
                    <td><input type="text" name="QQ" value="<%=ff.getQQ()%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="确 定" size="12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="清 除" size="12">
                    </td>
                 </tr>
            <%
                }
               }
            %>
            </table>
        </form>
    </body>
</html>
