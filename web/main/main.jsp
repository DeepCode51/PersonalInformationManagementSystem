<%-- 
    Document   : main
    Created on : 2012-3-20, 22:12:50
    Author     : Administrator
--%>

<%@page import="loginRegister.LoginBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统--主页面</title>
    </head>
    <%
        String userName=null;
            //获取在LoginServlet.java中保存在session对象中的数据
            ArrayList login=(ArrayList)session.getAttribute("login");
            if(login==null||login.size()==0){
                   response.sendRedirect("http://localhost:8084/PIMS/login.jsp");
            }else{
                for(int i=login.size()-1;i>=0;i--){
                    LoginBean nn=(LoginBean)login.get(i);
                    userName=nn.getUserName();
                }
            }
    %>
    <frameset cols="20%,*" framespacing="0" border="no" frameborder="0">
        <frame src="../main/left.jsp" name="left" scrolling="no">
        <frameset rows="20%,10%,*">
            <frame src="../main/top.jsp" name="top" scrolling="no">
                <frame src="../main/middle.jsp?userName=<%=userName%>" name="toop" scrolling="no">
            <frame src="../main/bottom.jsp" name="main">
        </frameset>
  </frameset>

</html>
