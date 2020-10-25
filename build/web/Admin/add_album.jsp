<%-- 
    Document   : add_album
    Created on : 23 Jul, 2020, 2:42:25 PM
    Author     : nicar
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
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
           try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                  
                ResultSet rs=st.executeQuery("select * from record where email='"+email+"'");  
                if(rs.next()){
                    
                 
                    
                
         int status=1;
         
         String description=request.getParameter("description");
         String album_name=request.getParameter("album_name");
         String category_name=request.getParameter("category_name");
         
         int sn=0;
            String code="";
            LinkedList l=new LinkedList();
            for(char x='A';x<='Z';x++){
                l.add(""+x);
            }
            for(char x='a';x<='z';x++){
                l.add(""+x);
            }
            for(int i=0;i<=9;i++){
                l.add(""+i);
            }
            Collections.shuffle(l);
            for(int i=0;i<=6;i++){
                code=code+l.get(i);
            }
                                
            ResultSet rs2=st.executeQuery("select MAX(sn) from album");
           if(rs2.next()){
               sn=rs2.getInt(1);
           }
           sn=sn+1;
           code=code+"_"+sn; 
           st.execute("insert into album values("+sn+",'"+code+"','"+album_name+"','"+description+"','"+category_name+"','"+status+"')");
             response.sendRedirect("album_image.jsp?id="+code);                     


            
         }
                else {
                     out.print("Invalid data");
                }
                cn.close();
            }
            catch(Exception er){
                out.println(er.getMessage());
             }
        } 
                   else{
            response.sendRedirect("login.jsp");
       }
%>
