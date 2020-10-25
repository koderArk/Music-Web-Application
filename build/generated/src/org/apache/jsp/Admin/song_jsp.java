package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class song_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

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
                       
 
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head></head>\n");
      out.write("    <body>   \n");
      out.write(" <form method=post action=\"add_song.jsp\">\n");
      out.write("\t  \t   <div class=\"form-grid1\">\n");
      out.write("\t\t\t\t\t\t\t\t<h4>Song Details</h4>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"bottom-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-md-3 grid-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<h5>Title</h5>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-md-9 grid-form1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" placeholder=\"song name..\" name=\"album_name\" required>\n");
      out.write("\t\t\t\t\t\t\t\t\t<span>enter song title</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"clearfix\"></div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"bottom-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-md-3 grid-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<h5>Description</h5>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-md-9 grid-form1\">\n");
      out.write("                                                                            <input type=\"text\" placeholder=\"add description\" name=\"description\" required >\n");
      out.write("\t\t\t\t\t\t\t\t\t<span>enter description of song</span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"clearfix\"></div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("                                                                <div class=\"bottom-form\">\n");
      out.write("                                                                    <div class=\"col-md-3 grid-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<h5>Select album</h5>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("                                                                    <select name=\"album_name\">\n");
      out.write("                                                       ");
                while(rs1.next()){     
      out.write("\n");
      out.write("                                                       <option value=\"");
      out.print(rs1.getString(3));
      out.write('"');
      out.write('>');
      out.print(rs1.getString(3));
      out.write("</option>\n");
      out.write("                                                       ");
                  }                     
      out.write("\n");
      out.write("                                                                    </select>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"bottom-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-md-3 grid-form\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<h5>submit</h5>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"col-md-9 grid-form1\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-sm btn-primary\"><i class=\"fa fa-angle-right\"></i> submit</button>\n");
      out.write("\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t\n");
      out.write("                                                                        </div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"clearfix\"></div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("     </form> \n");
      out.write("    </body>\n");
      out.write("</html>\n");

        

            
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

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
