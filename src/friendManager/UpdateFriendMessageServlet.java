/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package friendManager;

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
public class UpdateFriendMessageServlet extends HttpServlet {
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
        String phone=new String(request.getParameter("phone").getBytes("ISO-8859-1"),"UTF-8");
        String email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
        String workPlace=new String(request.getParameter("workPlace").getBytes("ISO-8859-1"),"UTF-8");
        String place=new String(request.getParameter("place").getBytes("ISO-8859-1"),"UTF-8");
        String QQ=new String(request.getParameter("QQ").getBytes("ISO-8859-1"),"UTF-8");
        if(phone.length()==0||email.length()==0||workPlace.length()==0||place.length()==0||QQ.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8084/PIMS/friendManager/updateFriendMessage.jsp");
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
                String name=null;
                ArrayList friendslist3=(ArrayList)session.getAttribute("friendslist3");
                if(friendslist3==null||friendslist3.size()==0){
                    response.sendRedirect("http://localhost:8084/PIMS/main/bottom.jsp");
                }else{
                    for(int i=friendslist3.size()-1;i>=0;i--){
                        UpdateFriendBean ff=(UpdateFriendBean)friendslist3.get(i);
                        name=ff.getName();
                    }
                }
                String sql1="update friends set phone='"+phone+"',email='"+email+"',workPlace='"+workPlace+"',place='"+place+"',QQ='"+QQ+"' where name='"+name+"'and userName='"+userName+"'";
                stmt.executeUpdate(sql1);
                String sql2="select * from friends where userName='"+userName+"'";
                rs=stmt.executeQuery(sql2);
                ArrayList friendslist=null;
                friendslist=new ArrayList();
                while(rs.next()){
                    LookFriendBean ff=new LookFriendBean();
                    ff.setName(rs.getString("name"));
                    ff.setPhone(rs.getString("phone"));
                    ff.setEmail(rs.getString("email"));
                    ff.setWorkPlace(rs.getString("workPlace"));
                    ff.setPlace(rs.getString("place"));
                    ff.setQQ(rs.getString("QQ"));
                    friendslist.add(ff);
                    session.setAttribute("friendslist", friendslist);
                }
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8084/PIMS/LookFriendServlet");
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
