

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#CCCFFF">
        <%
            String userName=request.getParameter("userName");
        %>
        <table width="100%" align="right" bgcolor="blue">
              <tr height="10" bgcolor="gray" align="center">
                  <td><a href="http://localhost:8084/PIMS/LookMessageServlet?userName=<%=userName%>" target="main">个人信息管理</a></td>
                  <td><a href="http://localhost:8084/PIMS/LookFriendServlet" target="main">通讯录管理</a></td>
                  <td><a href="http://localhost:8084/PIMS/LookDateServlet" target="main">日程安排管理</a></td>
<%--                  <td><a href="http://localhost:8084/PIMS/fileManager/fileUp.jsp" target="main">个人文件管理</a></td>--%>
                  <td><a href="http://localhost:8084/PIMS/login.jsp" target="_top">退出主页面</a></td>
                  <td>欢迎，<%=userName%>登录系统</td>
              </tr>
          </table>
  </body>
</html>
