<%-- 
    Document   : update
    Created on : 12 Mar, 2020, 11:35:11 PM
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
            String sn=request.getParameter("user");
            String code=request.getParameter("code");
            String category=request.getParameter("category_name");
            String status=request.getParameter("status");
            
            
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
            Statement st=cn.createStatement();
            st.execute("update category set sn='"+sn+"',category_name='"+category+"',status='"+status+"' where code='"+code+"'");
            response.sendRedirect("dashboard.jsp");    
            cn.close();
        }
        catch(Exception er){
            out.print(er.getMessage());
        }
        %>
    </body>
</html>
