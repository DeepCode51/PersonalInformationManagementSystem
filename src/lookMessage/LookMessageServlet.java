/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lookMessage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class LookMessageServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String userName=request.getParameter("userName");
        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/graduation_204_person?useUnicode=true&characterEncoding=gbk";
            con=DriverManager.getConnection(url,"root","123456");
            stmt=con.createStatement();
            String sql="select * from user where userName='"+userName+"'";
            rs=stmt.executeQuery(sql);
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
            HttpSession session=request.getSession();
            ArrayList wordlist=wordlist=new ArrayList();
            wordlist.add(mm);
            session.setAttribute("wordlist", wordlist);
            rs.close();
            stmt.close();
            con.close();
            response.sendRedirect("http://localhost:8084/PIMS/lookMessage/lookMessage.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

}
