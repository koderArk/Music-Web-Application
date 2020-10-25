<%-- 
    Document   : title
    Created on : 14 Mar, 2020, 3:58:43 PM
    Author     : nicar
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
Cookie c[]=request.getCookies();
    String email=null;
    String code=request.getParameter("code");
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
            break;
        }
    }
    if(email!=null && session.getAttribute(email)!=null){
          
%>
<form>
    Title<input type="text" name="album" required><br>
    Description<input type="text" name="description" required><br>
    <label for="cat">Category</label>
    
</form>
 <%
        try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select * from category where code='"+code+"'");
                
                 if(rs.next()){
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