<%-- 
    Document   : fileUp
    Created on : 2012-3-21, 22:22:57
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统->文件上传</title>
    </head>
    <body bgcolor="CCCFFF">
        <hr noshade>
      <div align="center">
      <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
          <tr>
              <td width="20%">
                  上传文件
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/fileManager/fileDown.jsp">文件列表</a>
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/fileManager/fileDown.jsp">下载文件</a>
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/fileManager/fileDown.jsp">删除文件</a>
              </td>
          </tr>
      </table>
      </div>
      <hr noshade>
      <br><br>
      <form action="http://localhost:8084/PIMS/FileUpServlet" method="post">
          <table border="2" cellspacing="0" cellpadding="0"  width="60%" align="center">
              <tr>
                     <td height="50" width="50%" align="right">上传文件</td>
                     <td width="50%">
                         <input type="file" name="file" size="30">
                     </td>
                </tr>
                <tr>
                    <td colspan="2" height="50" align="center">
                        <input type="submit" value="上 传" size="12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="清 除" size="12">
                    </td>
                </tr>
          </table>
      </form>
    </body>
</html>

