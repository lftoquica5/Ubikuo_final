<%-- 
    Document   : GeneradorReporte
    Created on : 3/05/2023, 09:06:24 AM
    Author     : APRENDIZ
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConexionBd"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String reportName = request.getParameter("reportName"); // Obtener el nombre del reporte de la URL
        
        // Verificar si el nombre del reporte es válido
        if (reportName != null && !reportName.isEmpty()) {
            String jasperFilePath = application.getRealPath("Reportes/" + reportName + ".jasper"); // Ruta del archivo .jasper
            
            File reporte = new File(jasperFilePath);
            Map<String, Object> parametros = new HashMap<String, Object>();
            
            ConexionBd conexion = new ConexionBd();
            Connection conexionbd = conexion.obtenerConexion();
            byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametros, conexionbd);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            response.setHeader("Content-Disposition", "attachment; filename=\"reporte.pdf\";");
            ServletOutputStream salida = response.getOutputStream();
            salida.write(bytes, 0, bytes.length);
            salida.flush();
            salida.close();
        } else {
            // Manejar el caso en que no se proporciona un nombre de reporte válido
            out.println("Nombre de reporte inválido.");
        }
    %>
</body>

</html>

