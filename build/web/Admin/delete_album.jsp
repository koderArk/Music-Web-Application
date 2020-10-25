<%-- 
    Document   : delete_album
    Created on : 23 Jul, 2020, 3:41:31 PM
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
           
                String code=request.getParameter("id");     
    try{
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                st.execute("update album set status=0 where code='"+code+"'");
                  response.sendRedirect("show_album.jsp");    
                 cn.close();
        }
        catch(Exception er){
            out.print(er.getMessage());
        }
%>
