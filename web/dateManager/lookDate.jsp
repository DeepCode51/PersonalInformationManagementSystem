
<%@page import="dateManager.LookDateBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统->查看日程</title>
    </head>
    <body bgcolor="CCCFFF">
        <hr noshade>
      <div align="center">
      <table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
          <tr>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/dateManager/addDate.jsp">增加日程</a>
              </td>
              <td width="20%">
                  查看日程
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/dateManager/updateDate.jsp">修改日程</a>
              </td>
              <td width="20%">
                  <a href="http://localhost:8084/PIMS/dateManager/deleteDate.jsp">删除日程</a>
              </td>
          </tr>
      </table>
      </div>
      <hr noshade>
      <br><br>
      <form action="http://localhost:8084/PIMS/AddDateServlet" method="post">
          <table border="5" cellspacing="0" cellpadding="0" width="60%" align="center">
              <tr>
                    <th width="40%">日程时间</th>
                    <th width="60%">日程内容</th>
              </tr>
              <%
                    ArrayList datelist=(ArrayList)session.getAttribute("datelist");
                    if(datelist==null||datelist.size()==0){
              %>
                <div align="center">
                    <h1>您还没有任何日程安排！</h1>
                </div>
                <%
            }else{
                for(int i=datelist.size()-1;i>=0;i--){
                    LookDateBean dd=(LookDateBean)datelist.get(i);
                    %>
                        <tr>
                            <td><%=dd.getDate()%></td>
                            <td><%=dd.getThing()%></td>
                        </tr>
                    <%
                }
             }
           %>
            </table>
        </form>
    </body>
</html>
