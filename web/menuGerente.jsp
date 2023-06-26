<%-- 
    Document   : menuVendedor
    Created on : 12/04/2023, 07:48:40 PM
    Author     : Alexander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!------------------- Estilos Menu --------------------->
        <link href="CSS/stylemenu.css" rel="stylesheet" type="text/css"/>
        <!------------------- Iconos --------------------->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
        <title>Inicio</title>
    </head>s
    <body>
        <nav>
            <!------------------- Logo --------------------->
        <div class="logo-name">
            <div class="logo-image">
                <img src="ASSETS/logo_web - copia.png" alt=""/>
            </div>
            <span class="logo_name">Electricos <span style="color: black;">Estrada</span></span>
        </div>
            <!------------------- Barra Lateral --------------------->
        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="home.jsp">
                    <i class="material-symbols-outlined">inventory</i>
                    <span class="link-name">Inicio</span>
                </a></li>
                <li><a href="Productos.jsp">
                    <i class="material-symbols-outlined">inventory</i>
                    <span class="link-name">Productos</span>
                </a></li>
                <li><a href="Clientes.jsp">
                    <i class="material-symbols-sharp">face</i>
                    <span class="link-name">Clientes</span>
                </a></li>
                <li><a href="Proveedor.jsp">
                    <i class="material-symbols-sharp">badge</i>
                    <span class="link-name">Proveedores</span>
                </a></li>
                <li><a href="ConsultarPedidoProveedor.jsp">
                    <i class="material-symbols-outlined">local_shipping</i>
                    <span class="link-name">Pedido Proveedor</span>
                </a></li>
            </ul>
            <!------------------- Cerrar Sesion --------------------->
            <ul class="logout-mode">
                <li><a href="#">
                        <form method="post" action="sesiones">
                        <button style="border: none;"><i class="uil uil-signout"></i></button>
                        <span class="link-name">Logout</span>
                        <input type="hidden" value="Cerrar Sesion"> 
                        </form>
                </a></li>   
            </ul>
        </div>
    </nav>
        <!------------------- Barra Superior --------------------->
        <section class="dashboard">
            <div class="top">
                <i class="uil uil-bars sidebar-toggle"></i>
                <div class="text-header">
                    <b>Rol:</b>
                    <small>Gerente</small>
                </div>
            </div>
        </section>
        <!------------------- Codigo Java --------------------->
        <script src="JS/menu.js" type="text/javascript"></script>
    </body>
</html>
