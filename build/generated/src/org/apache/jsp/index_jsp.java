package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Inicio de Sesion</title>\r\n");
      out.write("        <link href=\"CSS/stylelogin.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Poppins:600&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("        <script src=\"https://kit.fontawesome.com/a81368914c.js\"></script>\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <img class=\"wave\" src=\"ASSETS/wave.png\" alt=\"\"/>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"carousel-container\">\r\n");
      out.write("                <img class=\"carousel-image active\" src=\"ASSETS/fotoelectricos1.jpg\" alt=\"\">\r\n");
      out.write("                <img class=\"carousel-image\" src=\"ASSETS/fotoelectricos2.jpg\" alt=\"\">\r\n");
      out.write("                <img class=\"carousel-image\" src=\"ASSETS/fotoselectricos3.jpg\" alt=\"\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"carousel-navigation\">\r\n");
      out.write("                    <button class=\"carousel-button active\"></button>\r\n");
      out.write("                    <button class=\"carousel-button\"></button>\r\n");
      out.write("                    <button class=\"carousel-button\"></button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"login-content\">\r\n");
      out.write("                <form method = \"post\" action = \"usuario\">\r\n");
      out.write("                    <img src=\"ASSETS/logo_web.png\" alt=\"\"/>\r\n");
      out.write("                    <h2 class=\"title\">Bienvenido</h2>\r\n");
      out.write("                    <div class=\"input-div one\">\r\n");
      out.write("                        <div class=\"i\">\r\n");
      out.write("                            <i class=\"fas fa-user\"></i>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"div\">\r\n");
      out.write("                            <h5>Documento</h5>\r\n");
      out.write("                            <input class=\"input\" type=\"text\" name=\"id_usuario\" required>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"input-div pass\">\r\n");
      out.write("                        <div class=\"i\"> \r\n");
      out.write("                            <i class=\"fas fa-lock\"></i>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"div\">\r\n");
      out.write("                            <h5>Contraseña</h5>\r\n");
      out.write("                            <input class=\"input\"type=\"Password\" name=\"usupassword\"required>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <a href=\"recuperacionContraseña.jsp\">Olvidé mi contraseña</a>\r\n");
      out.write("                    <button class=\"btn\">Iniciar Sesion</button>\r\n");
      out.write("                    <input type =\"hidden\" name=\"opcion\" value =\"3\">\r\n");
      out.write("                    ");

                        if (request.getAttribute("mensajeError") != null) {
      out.write("\r\n");
      out.write("                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mensajeError}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    ");
} else {
      out.write("\r\n");
      out.write("                    ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${mensajeExito}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("                    ");
}
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <script src=\"JS/login.js\" type=\"text/javascript\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
