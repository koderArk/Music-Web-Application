<%-- 
    Document   : delete_song
    Created on : 30 Jul, 2020, 3:43:09 PM
    Author     : nicar
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

<%

        Cookie c[]=request.getCookies();
        String user=null;
        for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("user")){
             user=c[i].getValue();
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
                
                String code=request.getParameter("id");
               String album_code="";                    
    try{
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                st.execute("update song set status=0 where code='"+code+"'");
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

