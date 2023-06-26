<%-- 
    Document   : sesiones
    Created on : 24/03/2023, 02:38:16 PM
    Author     : Luisa
--%>

<%@page import="ModeloVO.usuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
    </head>

    <%
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
        response.setDateHeader("Expires", 0);
    %>
    <body>
        <%
            // ...
            String usuNombre = "", usuId = "", usuRol = "";

            HttpSession buscarSesion = (HttpSession) request.getSession();

            if (buscarSesion.getAttribute("datosUsuario") != null) {
                usuarioVO usuVO = (usuarioVO) buscarSesion.getAttribute("datosUsuario");

                usuNombre = usuVO.getUsunombre();
                usuRol = usuVO.getUsu_id_rol();
                usuId = usuVO.getId_usuario();

                // Condiciona la visualización del contenido según el ID del rol
                if (usuRol != null && usuRol.equals("4")) {
                    // Mostrar contenido para el rol 3 (por ejemplo, gerente)
        %>
        <!-- Aquí va el contenido para el rol 3 -->
        <%@include file="menuGerente.jsp" %>
        <%
        } else if (usuRol != null && usuRol.equals("2")) {
            // Mostrar contenido para el rol 2 (por ejemplo, administrador)
        %>
        <!-- Aquí va el contenido para el rol 2 -->
        <%@include file="menuAdministrador.jsp" %>
        <%
        } else if (usuRol != null && usuRol.equals("3")) {
            // Mostrar contenido para el rol 1 (por ejemplo, vendedor)
        %>
        <!-- Aquí va el contenido para el rol 1 -->
        <%@include file="menuVendedor.jsp" %>
        <%
        } else if (usuRol != null && usuRol.equals("5")) {
            // Mostrar contenido para el rol 4 (por ejemplo, administrador de punto)
        %>
        <!-- Aquí va el contenido para el rol 4 -->
        <%@include file="menuAdministradorPunto.jsp" %>
        <%
        } else {
            // Mostrar contenido para otros roles o acceso denegado
        %>
        <!-- Aquí va el contenido para otros roles o mensaje de acceso denegado -->
        <p>Acceso denegado.</p>
        <%
        }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        %>

    </body>
</html>
