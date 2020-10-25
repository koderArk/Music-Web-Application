<%-- 
    Document   : addsong
    Created on : 25 Jul, 2020, 5:38:27 PM
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
         String album_code=request.getParameter("id");              
         String song_name=request.getParameter("song_name");
         String album_name=request.getParameter("album_name");
         String description=request.getParameter("description");
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
                                
            ResultSet rs2=st.executeQuery("select MAX(sn) from song");
           if(rs2.next()){
               sn=rs2.getInt(1);
           }
           sn=sn+1;
           code=code+"_"+sn; 
           st.execute("insert into song values("+sn+",'"+code+"','"+song_name+"','"+description+"','"+album_name+"','"+album_code+"',"+status+")");
             response.sendRedirect("song_file.jsp?id="+code);                     


            
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

