<%-- 
    Document   : Productos
    Created on : 6/06/2023, 09:42:43 PM
    Author     : Alexander
--%>
<%@page import="ModeloDAO.consultaPedProvDAO"%>
<%@page import="ModeloDAO.pedidoProveedorDAO"%>
<%@page import="ModeloVO.pedidoProveedorVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloDAO.productosDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@page import="ModeloVO.productosVO"%>
<%@include file="sesiones.jsp" %>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link href="CSS/stylepopup.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!--------------------- Alertas ------------------------------->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>
    <body>
        <%-- Mostrar SweetAlert si se registra el cliente normal exitosamente --%>
        <% String successMessage = (String) request.getAttribute("mensajeExito"); %>
        <% if (successMessage != null) {%>
        <script>
            Swal.fire({
            icon: 'success',
                    title: '<%= successMessage%>',
            });
        </script>
        <% } %>

        <%-- Mostrar SweetAlert en caso de error al registrar el cliente normal --%>
        <% String errorMessage = (String) request.getAttribute("mensajeError"); %>
        <% if (errorMessage != null) {%>
        <script>
            Swal.fire({
            icon: 'error',
                    title: '<%= errorMessage%>',
            });
        </script>
        <% } %>
        <section class="main">
            <div class="dash-content">
                <div class="overview">
                    <div class="title">
                        <span class="text">Pedido Proveedor</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Nuevo Proveedor</span>
                            <div class="popup" id="popup1">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Registrar Proveedor</h2>
                                    <form method = "post" action="Proveedor">
                                        <div class="module-details">
                                            <div class="input-box">
                                                <span class="details">NIT<span style="color: red;">*</span></span>
                                                <input type="text" id="id_prov" name="id_prov" placeholder="NIT" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Nombre<span style="color: red;">*</span> </span>
                                                <input type="text" name="pronombre"  placeholder="Nombre"required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Dirección<span style="color: red;">*</span></span>
                                                <input type="text" name="prodireccion" placeholder="Direccion" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Telefono<span style="color: red;">*</span></span>
                                                <input type="number" name="protelefono" placeholder="Telefono" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Correo Electronico<span style="color: red;">*</span> </span>
                                                <input type="text" name="procorreo" placeholder="Correo Electronico"required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Descripción<span style="color: red;">*</span></span>
                                                <input type="text" name="prodescripcion" placeholder="Descripcion"required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Representante<span style="color: red;">*</span></span>
                                                <input type="text" name="prorepresentante" placeholder="Representante"required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Estado<span style="color: red;">*</span></span>
                                                <select type="text" name="proestado">
                                                    <option value="activo">activo</option>
                                                    <option value="inactivo">inactivo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <a href="#" class="cancelarbtn">Cancelar</a>
                                            <button class="registrarbtn">Registrar Poveedor</button>
                                            <input  type="hidden" name="opcion" value="5">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="box box3">
                            <button class="open-popup" data-popup="popup3"> <i class='bx bxs-report activos'></i></button>
                            <div class="popup" id="popup3">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Reportes</h2>
                                    <form method="POST" action="generadorReportes.jsp" target="_blank">
                                        <div class="module-detailsReportes">
                                            <div class="input-box">
                                                <span class="details">Ultimo Pedido</span>
                                                <button class="button" type="submit" name="reportName" value="pedidoProveedor">Descargar</button>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Pedidos Proveedor</span>
                                                <button class="button" type="submit" name="reportName" value="pedProvCompletos">Descargar</button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="controls">
                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                    </div>   
                                </div>
                            </div>
                            <span class="text">Generar Reporte</span>
                        </div>
                        <a href="CrearPedidoProveedor.jsp" style="text-decoration:none">
                            <div class="box box3">
                                <i class='bx bx-package pedido'></i>
                                <span class="text">Nuevo Pedido</span>
                            </div>
                        </a>
                        <div class="box box1">
                            <i class="bx bxs-inbox pendientes activos"></i>
                            <%
                                consultaPedProvDAO pedidosProveedorDAO = new consultaPedProvDAO();
                                int totalPedidosPendientes = pedidosProveedorDAO.getTotalPedidosPendientes();
                                out.println("<span class=\"number\">" + totalPedidosPendientes + "</span>");
                            %>
                            <span class="text">Pendiente</span>
                        </div>
                        <div class="box box2">
                            <i class='bx bxs-send activos'></i>
                            <%
                                consultaPedProvDAO enprocesoDAO = new consultaPedProvDAO();
                                int totalPedidosEnProceso = enprocesoDAO.getTotalPedidosEnProceso();
                                out.println("<span class=\"number\">" + totalPedidosEnProceso + "</span>");
                            %>
                            <span class="text">En Proceso</span>
                        </div>
                        <div class="box box3">
                            <i class="bx bxs-check-circle entregados activos"></i>
                            <%
                                consultaPedProvDAO entregadoDAO = new consultaPedProvDAO();
                                int totalPedidosEntregados = entregadoDAO.getTotalPedidosEntregados();
                                out.println("<span class=\"number\">" + totalPedidosEntregados + "</span>");
                            %>
                            <span class="text">Entregados</span>
                        </div>
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Consultar Pedido</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_usuario" class="buscar__input" placeholder="Buscar">
                            </div>
                            <i class='bx bx-search'></i>
                            <input type="date" id="fechaFiltro" class="fecha-input">
                            <button id="btnFiltrar" class="btnFiltrar">Filtrar <i class='bx bx-filter'></i></button>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>N°Pedido</th>
                                    <th>N°Proveedor</th>
                                    <th>Usuario</th>
                                    <th>Fecha y hora</th>
                                    <th>Total</th>
                                    <th>Estado</th>
                                    <th>Actualizar</th>
                                    <th>Ver Detalles</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    pedidoProveedorVO pedProvVO = new pedidoProveedorVO();
                                    pedidoProveedorDAO pedProvDAO = new pedidoProveedorDAO();
                                    ArrayList<pedidoProveedorVO> listaPedido = pedProvDAO.listar();
                                    int contador = 0;
                                    for (int i = 0; i < listaPedido.size(); i++) {
                                        pedProvVO = listaPedido.get(i);
                                        contador = contador + 1;
                                %>
                                <tr class="daticos">
                                    <td class="id_usuario"><%= pedProvVO.getId_proped()%></td>
                                    <td><%= pedProvVO.getPed_id_proveedor()%></td>
                                    <td><%= pedProvVO.getId_usuario()%></td>
                                    <td class="fecha"><%= pedProvVO.getProped_fecha()%></td>
                                    <td><%= pedProvVO.getTotal_proped()%></td>
                                    <td class="estado-usuario">
                                        <span class="status <%= pedProvVO.getPropedestado().equals("en_proceso") ? "proceso" : (pedProvVO.getPropedestado().equals("entregado") ? "entregado" : "pendiente")%>">
                                            <%= pedProvVO.getPropedestado()%>
                                        </span>
                                    </td>
                                    <td>
                                        <button class="open-popup actualizar-usuario updatebutton"
                                                data-ped-id="<%= pedProvVO.getId_proped()%>"
                                                data-ped-usu="<%= pedProvVO.getId_usuario()%>"
                                                data-ped-prov="<%= pedProvVO.getPed_id_proveedor()%>"
                                                data-ped-fecha="<%= pedProvVO.getProped_fecha()%>"
                                                data-ped-estado="<%= pedProvVO.getPropedestado()%>"
                                                data-ped-total="<%= pedProvVO.getTotal_proped()%>">
                                            <i class='bx bx-edit actualizar'></i>
                                        </button>
                                        <div class="popup actualizar-popup" id="popup2">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Estado</h2>
                                                <form method = "post" action="pedidoProveedor">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">N°Pedido<span style="color: red;">*</span></span>
                                                            <input type="text" name ="id_proped" id="id_proped" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">N°Proveedor<span style="color: red;">*</span></span>
                                                            <input type="text" name ="ped_id_proveedor" id="ped_id_proveedor"readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Usuario<span style="color: red;">*</span></span>
                                                            <input type="text" name ="id_usuario" id="id_usuario"readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Fecha y hora<span style="color: red;">*</span> </span>
                                                            <input type="text" name ="proped_fecha" id="proped_fecha" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Total<span style="color: red;">*</span></span>
                                                            <input type="number" name="Total_proped" id="Total_proped" readonly>
                                                        </div>                   
                                                        <div class="input-box">
                                                            <span class="details">Estado<span style="color: red;">*</span></span>
                                                            <select name="propedestado" id="propedestado">
                                                                <option value="pendiente">Pendiente</option>
                                                                <option value="entregado">Entregado</option>
                                                                <option value="en_proceso">En proceso</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                                        <button class="registrarbtn">Actualizar Estado</button>
                                                        <input  type="hidden" name="opcion" value="1">
                                                    </div>   
                                                </form>
                                            </div>
                                    </td>
                                    <td>
                                        <button class="open-popup detailbutton" data-popup="popup4_<%= pedProvVO.getId_proped()%>"
                                                data-ped-id="<%= pedProvVO.getId_proped()%>"
                                                data-ped-usu="<%= pedProvVO.getId_usuario()%>"
                                                data-ped-prov="<%= pedProvVO.getPed_id_proveedor()%>"
                                                data-ped-fecha="<%= pedProvVO.getProped_fecha()%>"
                                                data-ped-estado="<%= pedProvVO.getPropedestado()%>"
                                                data-ped-total="<%= pedProvVO.getTotal_proped()%>">
                                            <i class='bx bxs-detail actualizar'></i>
                                        </button>
                                        <div class="popup" id="popup4_<%= pedProvVO.getId_proped()%>">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Detalles de pedido</h2>
                                                <div class="module-details">
                                                    <h4>N°Pedido: <%= pedProvVO.getId_proped()%></h4>
                                                    <br>
                                                    <table class="tabla1">
                                                        <thead>
                                                            <tr>
                                                                <th>Id Producto</th>
                                                                <th>Nombre</th>
                                                                <th>Cantidad</th>
                                                                <th>Precio Unitario</th>
                                                                <th>Sub Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                consultaPedProvDAO pedDetDAO = new consultaPedProvDAO();
                                                                String pedidoId = pedProvVO.getId_proped();
                                                                ArrayList<pedidoProveedorVO> listaProductos = pedDetDAO.listarProductosPorPedido(pedidoId);
                                                                for (pedidoProveedorVO detalle : listaProductos) {
                                                            %>
                                                            <tr>
                                                                <td><%= detalle.getDpro_id_producto()%></td>
                                                                <td><%= detalle.getDescripcionProducto()%></td>
                                                                <td><%= detalle.getDpro_cantidad()%></td>
                                                                <td><%= detalle.getDpro_preciocompra()%></td>
                                                                <td><%= detalle.getDpro_subtotal()%></td>
                                                            </tr>
                                                            <% } %>
                                                        </tbody>
                                                    </table>
                                                        <h4>Total: <%= pedProvVO.getTotal_proped()%></h4>
                                                </div>
                                                <div class="controls">
                                                    <a href="#" class="cancelarbtn">Cerrar</a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <script>
            // Obtener referencia a los elementos del DOM
            const fechaFiltroInput = document.getElementById('fechaFiltro');
            const btnFiltrar = document.getElementById('btnFiltrar');
            // Agregar evento click al botón de filtrar
            btnFiltrar.addEventListener('click', filtrarPorFecha);
            // Función para filtrar por fecha
            function filtrarPorFecha() {
            const fechaSeleccionada = fechaFiltroInput.value;
            const filas = document.querySelectorAll('.daticos');
            filas.forEach(function(fila) {
            const fecha = fila.querySelector('.fecha').textContent;
            const fechaFila = fecha.substring(0, 10); // Extraer solo la fecha sin la hora

            if (fechaFila !== fechaSeleccionada) {
            fila.style.display = 'none';
            } else {
            fila.style.display = 'table-row';
            }
            });
            }
        </script>
        <script src="JS/buscador2.js" type="text/javascript"></script>
        <script src="JS/popupedidoproveedor.js" type="text/javascript"></script>
    </body>
</html>
