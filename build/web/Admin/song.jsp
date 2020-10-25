<%-- 
    Document   : song.jsp
    Created on : 25 Jul, 2020, 4:50:03 PM
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
               String code=request.getParameter("id");
                  Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                  
                ResultSet rs=st.executeQuery("select * from record where email='"+email+"'");  
                if(rs.next()){
                    
                 
                    
                 ResultSet rs1=st.executeQuery("select * from album where code='"+code+"'");   
                       
 %>
<html>
    <head></head>
    <body>   
 <form method=post action="add_song.jsp?id=<%=code%>">
	  	   <div class="form-grid1">
								<h4>Song Details</h4>
								<div class="bottom-form">
									<div class="col-md-3 grid-form">
										<h5>Title</h5>
									</div>
									<div class="col-md-9 grid-form1">
									<input type="text" placeholder="song name.." name="song_name" required>
									<span>enter song title</span>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="bottom-form">
									<div class="col-md-3 grid-form">
										<h5>Description</h5>
									</div>
									<div class="col-md-9 grid-form1">
                                                                            <input type="text" placeholder="add description" name="description" required >
									<span>enter description of song</span>
									</div>
									<div class="clearfix"></div>
								</div>
                                                                <div class="bottom-form">
                                                                    <div class="col-md-3 grid-form">
										<h5>Select album</h5>
									</div>
                                                                    <select name="album_name">
                                                       <%                while(rs1.next()){     %>
                                                       <option value="<%=rs1.getString(3)%>"><%=rs1.getString(3)%></option>
                                                       <%                  }                     %>
                                                                    </select>
								</div>
								<div class="bottom-form">
									<div class="col-md-3 grid-form">
										<h5>submit</h5>
									</div>
									<div class="col-md-9 grid-form1">
									<button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-angle-right"></i> submit</button>
								
									
                                                                        </div>
									<div class="clearfix"></div>
								</div>
							</div>


     </form> 
    </body>
</html>
<%
        

            
         }
                else {
                     out.print("Invalid profile");
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
