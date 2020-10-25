package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    if(email!=null && session.getAttribute(email)!=null){
        response.sendRedirect("dashboard.jsp");
    }
    else{

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <form method=post action=\"check.jsp\">\n");
      out.write("  \t    <div  class=\"form-item form-type-textfield form-item-name\">\n");
      out.write("\t      <label for=\"edit-name\">Username <span class=\"form-required\" title=\"This field is required.\">*</span></label>\n");
      out.write("\t      <input type=\"text\" id=\"edit-name\" name=\"email\" size=\"60\" maxlength=\"60\" class=\"form-text required\">\n");
      out.write("\t    </div>\n");
      out.write("\t    <div class=\"form-item form-type-password form-item-pass\">\n");
      out.write("\t      <label for=\"edit-pass\">Password <span class=\"form-required\" title=\"This field is required.\">*</span></label>\n");
      out.write("\t      <input type=\"password\" id=\"edit-pass\" name=\"pass\" size=\"60\" maxlength=\"128\" class=\"form-text required\">\n");
      out.write("\t    </div>\n");
      out.write("\t    <div class=\"form-actions\">\n");
      out.write("\t    \t<input type=\"submit\" id=\"edit-submit\" name=\"op\" value=\"Log in\" class=\"btn_1 submit\">\n");
      out.write("\t    </div>\n");
      out.write("\t   </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

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
