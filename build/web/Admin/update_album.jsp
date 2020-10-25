<%-- 
    Document   : update_song
    Created on : 23 Jul, 2020, 3:42:08 PM
    Author     : nicar
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

<%

        Cookie c[]=request.getCookies();
        String email=null;
        for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("user")){
             email=c[i].getValue();
             break;
         }   
        }
              if(email!=null&&session.getAttribute(email)!=null){
                 String title=request.getParameter("title");
                 String description=request.getParameter("description");
                 String category_name=request.getParameter("category_name");
                 String code=request.getParameter("id");     
    try{
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                st.execute("update album set album_name='"+title+"',description='"+description+"',category_name='"+category_name+"' where code='"+code+"'");
                  response.sendRedirect("show_album.jsp");    
                 cn.close();
        }
        catch(Exception er){
            out.print(er.getMessage());
        }

  } 
                   else{
            response.sendRedirect("login.jsp");
       }
%>


