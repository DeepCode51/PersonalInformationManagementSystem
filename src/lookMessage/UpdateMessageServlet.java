/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lookMessage;

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
public class UpdateMessageServlet extends HttpServlet {
    public void wrong1(){
        String msg="不允许有空，修改失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="填写信息合格，修改成功！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String edu=new String(request.getParameter("edu").getBytes("ISO-8859-1"),"UTF-8");
        String work=new String(request.getParameter("work").getBytes("ISO-8859-1"),"UTF-8");
        String phone=new String(request.getParameter("phone").getBytes("ISO-8859-1"),"UTF-8");
        String email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
        if(phone.length()==0||email.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8084/PIMS/lookMessage/updateMessage.jsp");
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
                String sql1="Update user set edu='"+edu+"',work='"+work+"',phone='"+phone+"',email='"+email+"' where userName='"+userName+"'";
                stmt.executeUpdate(sql1);
                String sql2="select * from user where userName='"+userName+"'";
                rs=stmt.executeQuery(sql2);
                LookMessageBean mm=new LookMessageBean();
                while(rs.next()){
                    mm.setName(rs.getString("name"));
                    mm.setSex(rs.getString("sex"));
                    mm.setBirth(rs.getString("birth"));
                    mm.setNation(rs.getString("nation"));
                    mm.setEdu(rs.getString("edu"));
                    mm.setWork(rs.getString("work"));
                    mm.setPhone(rs.getString("phone"));
                    mm.setPlace(rs.getString("place"));
                    mm.setEmail(rs.getString("email"));
                }
                ArrayList wordlist=null;
                wordlist=new ArrayList();
                wordlist.add(mm);
                session.setAttribute("wordlist", wordlist);
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8084/PIMS/lookMessage/lookMessage.jsp");
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
