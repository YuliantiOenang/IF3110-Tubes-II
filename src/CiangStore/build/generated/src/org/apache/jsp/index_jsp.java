package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
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
  
    if(session.getAttribute("Role")==null) {
        session.setAttribute("Role", 1);
    }

      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html lang=\"en-US\">\n");
      out.write("<head>\n");
      out.write("\t<meta charset=\"UTF-8\">\n");
      out.write("\t<title>Masukkan Judul Dokumen</title>\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"res/css/style.css\" media=\"all\"/>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t\n");
      out.write("\t<div id=\"container\">\n");
      out.write("\t\t\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, false);
      out.write("\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- Navbar Section -->\n");
      out.write("\t\t<div id=\"navbar\" class=\"frame\">\n");
      out.write("\t\t\t<ul>\n");
      out.write("\t\t\t\t<li><a href=\"#\">Beras</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\">Daging</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\">Sayuran</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\">Frozen Food</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\">Snack</a></li>\n");
      out.write("\t\t\t</ul>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- End of Navbar -->\n");
      out.write("\t\t\n");
      out.write("\t\t<br/>\n");
      out.write("\t\t<a id=\"best-buy-btn\" href=\"#best-buy\" class=\"btn\">See Best Buy!!</a>\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- Slideshow Section -->\n");
      out.write("\t\t<div id=\"slideshow\" class=\"frame\">\n");
      out.write("\t\t\t<div class=\"item\">\n");
      out.write("\t\t\t\t<img class=\"img-konten\" src=\"res/img/slideshow/sayuran_world.jpg\" alt=\"\"/>\n");
      out.write("\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t<p class=\"text\">\n");
      out.write("\t\t\t\t\t\tCheck out our snack section! We have a lot of snack \n");
      out.write("\t\t\t\t\t\tfrom Gulali World!!\n");
      out.write("\t\t\t\t\t</p>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<a href=\"#\" class=\"btn-left\">&lsaquo;</a>\n");
      out.write("\t\t\t<a href=\"#\" class=\"btn-right\">&rsaquo;</a>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<img src=\"res/img/baloon.png\" alt=\"\"/>\n");
      out.write("\t\t<!-- End of Section -->\n");
      out.write("\t\t\n");
      out.write("\t\t<div id=\"best-buy\" class=\"frame\">\n");
      out.write("\t\t\t<div id=\"bbuy-text\" class=\"kolom-4\">\n");
      out.write("\t\t\t\t<p id=\"bbuy-a\">Best Buy</p>\n");
      out.write("\t\t\t\t<p id=\"bbuy-b\">Products</p>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"kolom-8\">\n");
      out.write("\t\t\t\t<div class=\"frame\">\n");
      out.write("\t\t\t\t\t<div class=\"kolom-4 product\">\n");
      out.write("\t\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t\t<img class=\"gambar\" src=\"res/img/product/prdct-daging-sapi.jpg\" alt=\"\"/>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"nama-produk\">Daging Sapi</p>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"asal-produk\">from Daging</p>\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"kolom-4 product\">\n");
      out.write("\t\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t\t<img class=\"gambar\" src=\"res/img/product/prdct-bayam-itali.jpg\" alt=\"\"/>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"nama-produk\">Bayam Itali</p>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"asal-produk\">from Sayuran</p>\t\n");
      out.write("\t\t\t\t\t\t</a>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"kolom-4 product\">\n");
      out.write("\t\t\t\t\t\t<a href=\"#\">\n");
      out.write("\t\t\t\t\t\t\t<img class=\"gambar\" src=\"res/img/product/prdct-beras-carrefour.jpg\" alt=\"\"/>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"nama-produk\">Beras Carrefour</p>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"asal-produk\">from Beras</p>\n");
      out.write("\t\t\t\t\t\t</a>\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"kolom-4 product\">\n");
      out.write("\t\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t\t<img class=\"gambar\" src=\"res/img/product/prdct-nugget-fiesta.jpg\" alt=\"\"/>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"nama-produk\">Chicken Nugget</p>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"asal-produk\">from Frozen Food</p>\t\t\n");
      out.write("\t\t\t\t\t\t</a>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"kolom-4 product\">\n");
      out.write("\t\t\t\t\t\t<a href=\"\">\n");
      out.write("\t\t\t\t\t\t\t<img class=\"gambar\" src=\"res/img/product/prdct-icecream-magnum.png\" alt=\"\"/>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"nama-produk\">Ice Cream</p>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"asal-produk\">from Snack</p>\n");
      out.write("\t\t\t\t\t\t</a>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\t\t\t\t\t\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t<!-- Javascript -->\n");
      out.write("\t<script src=\"res/js/common.js\" type=\"text/javascript\"></script>\n");
      out.write("\t\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
