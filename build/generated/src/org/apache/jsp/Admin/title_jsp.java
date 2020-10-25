package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class title_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');

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
          try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/db3","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select * from category where code='"+code+"'");
                
                 if(rs.next()){

      out.write("\n");
      out.write("<form>\n");
      out.write("    Title<input type=\"text\" name=\"album\" required><br>\n");
      out.write("    Description<input type=\"text\" name=\"description\" required><br>\n");
      out.write("    <label for=\"cat\">Category</label>\n");
      out.write("    <select id=\"cat\">\n");
      out.write("        ");

        while(rs.next()){
            
      out.write("\n");
      out.write("        <option value=\"");
      out.print(rs.getString(5));
      out.write('"');
      out.write('>');
      out.print(rs.getString(5));
      out.write("</option>\n");
      out.write("       ");
 }
                 
      out.write("\n");
      out.write("    </select>\n");
      out.write("</form>\n");
      out.write(" ");

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
