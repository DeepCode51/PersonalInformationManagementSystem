<%-- 
    Document   : updatePassword
    Created on : 2012-3-20, 23:58:33
    Author     : Administrator
--%>

<%@page import="loginRegister.LoginBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="CCCFFF">
        <hr noshade>
        <div align="center">
            <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
                <tr>
                    <td width="33%">
                        <a href="http://localhost:8084/PIMS/lookMessage/lookMessage.jsp">查看个人信息</a>
                    </td>
                     <td width="33%">
                        <a href="http://localhost:8084/PIMS/lookMessage/updateMessage.jsp">修改个人信息</a>
                    </td>
                    <td width="33%">
                        修改密码
                    </td>
                </tr>
            </table>
        </div>
        <hr noshade>
        <br><br>
        <form action="http://localhost:8084/PIMS/UpdatePasswordServlet" method="post">
            <table border="2" cellspacing="0" cellpadding="0" bgcolor="CCCFFF" width="60%" align="center">
            <%
                ArrayList login=(ArrayList)session.getAttribute("login");
                if(login==null||login.size()==0){
                    response.sendRedirect("http://localhost:8084/PIMS/main/bottom.jsp");
                }else{
                    for(int i=login.size()-1;i>=0;i--){
                        LoginBean nn=(LoginBean)login.get(i);
            %>
                <tr>
                    <td height="30">用户密码</td>
                    <td><input type="password" name="password1" value="<%=nn.getPassword()%>"></td>
                </tr>
                <tr>
                    <td height="30">重复密码</td>
                    <td><input type="password" name="password2" value="<%=nn.getPassword()%>"></td>
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
