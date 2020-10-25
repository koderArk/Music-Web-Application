<%-- 
    Document   : check
    Created on : Feb 14, 2020, 8:25:00 AM
    Author     : Tacom
--%>

<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
        Cookie c[]=request.getCookies();
        String email=null;
        for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("user")){
             email=c[i].getValue();
             break;
         }   
        }
        if(email==null){
            if(request.getParameter("email")==null){
                response.sendRedirect("login.jsp");
                                                                    
            }
       else{
                email=request.getParameter("email");
                               }
                       }
        if(request.getParameter("pass")==null){
            response.sendRedirect("login.jsp");
                       }
        else{
            String pass=request.getParameter("pass");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("SELECT * FROM record where email='"+email+"'");
                if(rs.next()){
                    if(rs.getString("password").equals(pass)){
                        Cookie ct=new Cookie("user",email);
                        ct.setMaxAge(300);
                        response.addCookie(ct);
                        session.setAttribute(email, pass);
                        session.setMaxInactiveInterval(60);
                        response.sendRedirect("dashboard.jsp");
                     }
                    else{
                        response.sendRedirect("login.jsp?invalid=1");
                    }
                }
                 else{
                    response.sendRedirect("login.jsp?attempt=1");
                 }
                cn.close();
             }
            catch(Exception er){
                out.println(er.getMessage());
           }
        }
%>                     
    </body>
</html>

