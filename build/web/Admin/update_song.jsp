<%-- 
    Document   : update_song
    Created on : 30 Jul, 2020, 3:42:49 PM
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
        %>
<!DOCTYPE html>
 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <%
              if(email!=null&&session.getAttribute(email)!=null){
                 String song_name=request.getParameter("song_name");
                 String description=request.getParameter("description");
                 String album_code="";
                 String code=request.getParameter("id");     
    try{
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                st.execute("update song set song_name='"+song_name+"',description='"+description+"' where code='"+code+"'");
                ResultSet rs2=st.executeQuery("select * from song where code='"+code+"'"); 
                if(rs2.next()){ album_code=rs2.getString(6);}
                response.sendRedirect("show_song.jsp?id="+album_code);    
                 cn.close();
        }
        catch(Exception er){
            out.print(er.getMessage());
        }
%>
    </body>
 </html>
 <%
  } 
                   else{
            response.sendRedirect("login.jsp");
       }
%>


