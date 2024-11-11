<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统-删除日程</title>
    </head>
    <body bgcolor="CCCFFF">
        <hr noshade>
      <div align="center">
      <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
          <tr>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/dateManager/lookDate.jsp">增加日程</a>
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/dateManager/lookDate.jsp">查看日程</a>
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/dateManager/updateDate.jsp">修改日程</a>
              </td>
              <td width="20%">
                  删除日程
              </td>
          </tr>
      </table>
      </div>
      <hr noshade>
      <br><br>
      <form action="http://localhost:8084/PIMS/DeleteDateServlet" method="post">
          <table border="5" cellspacing="0" cellpadding="0" width="60%" align="center">
                <tr>
                     <td height="30" width="50%" align="right">日程时间</td>
                     <td width="50%">
                         20<input type="text" size="1" name="year" value="">年
                         <input type="text" size="1" name="month" value="">月
                         <input type="text" size="1" name="day" value="">日
                     </td>
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
