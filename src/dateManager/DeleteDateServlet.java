/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dateManager;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import loginRegister.LoginBean;

/**
 *
 * @author Administrator
 */
public class DeleteDateServlet extends HttpServlet {
    public void wrong1(){
        String msg="请把日期填写完整，删除失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong2(){
        String msg="请确认日期填写正确，删除失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong3(){
        String msg="该日程不存在，删除失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="填写信息合格，删除成功！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String year=new String(request.getParameter("year").getBytes("ISO-8859-1"),"UTF-8");
        String month=new String(request.getParameter("month").getBytes("ISO-8859-1"),"UTF-8");
        String day=new String(request.getParameter("day").getBytes("ISO-8859-1"),"UTF-8");
        String date="20"+year+"-"+month+"-"+year;
        if(year.length()==0||month.length()==0||day.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8084/PIMS/dateManager/deleteDate.jsp");
        }else if(year.length()!=2||Integer.parseInt(year)<11||Integer.parseInt(month)>12||Integer.parseInt(day)>31){
            wrong2();
            response.sendRedirect("http://localhost:8084/PIMS/dateManager/deleteDate.jsp");
        }else{
            try{
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");  
                String url="jdbc:mysql://localhost:3306/graduation_204_person?useUnicode=true&characterEncoding=gbk";
                con=DriverManager.getConnection(url,"root","123456");
                stmt=con.createStatement();
                String userName="";
                HttpSession session=request.getSession();
                ArrayList login=(ArrayList)session.getAttribute("login");
                if(login==null||login.size()==0){
                       response.sendRedirect("http://localhost:8084/PIMS/login.jsp");
                }else{
                    for(int i=login.size()-1;i>=0;i--){
                        LoginBean nn=(LoginBean)login.get(i);
                        userName=nn.getUserName();
                    }
                }
                String sql1="select * from date where date='"+date+"'and userName='"+userName+"'";
                rs=stmt.executeQuery(sql1);
                rs.last();
                int k;
                k=rs.getRow();
                rs.beforeFirst();
                if(k<1){
                    wrong3();
                    response.sendRedirect("http://localhost:8084/PIMS/dateManager/deleteDate.jsp");
                }else{
                    String sql2="delete from date where date='"+date+"'and userName='"+userName+"'";
                    stmt.executeUpdate(sql2);
                    String sql3="select * from date where userName='"+userName+"'";
                    rs=stmt.executeQuery(sql3);
                    rs.last();
                    int list=rs.getRow();
                    rs.beforeFirst();
                    if(list<1){
                        ArrayList datelist=null;
                        session.setAttribute("datelist", datelist);
                    }else{
                    ArrayList datelist=null;
                    datelist=new ArrayList();
                        while(rs.next()){
                            LookDateBean dd=new LookDateBean();
                            dd.setDate(rs.getString("date"));
                            dd.setThing(rs.getString("thing"));
                            datelist.add(dd);
                            session.setAttribute("datelist", datelist);
                        }
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                    right();
                    response.sendRedirect("http://localhost:8084/PIMS/dateManager/lookDate.jsp");
                }
                rs.close();
                stmt.close();
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

}
