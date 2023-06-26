<%-- 
    Document   : Proveedor
    Created on : 26/04/2023, 07:56:00 AM
    Author     : APRENDIZ
--%>

<%@page import="ModeloDAO.pedidoProveedorDAO"%>
<%@page import="ModeloVO.pedidoProveedorVO"%>
<%@page import="ModeloDAO.usuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@include file="sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedor</title>
        <link href="CSS/stylepopup.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/home.css" rel="stylesheet" type="text/css"/>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>
        <section class="main">
            <div class="dash-content pedido">
                <div class="overview">
                    <div class="title">
                        <span class="text">Home</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <h3 class="box-title">Electricos Estrada S.A.S</h3>
                            <p>Expertos en reparación, fabricación y venta de todo tipo de contactos, contactores, breakers, transferencias y arrancadores. 
                                Comercializamos materiales eléctricos y todo lo relacionado con cálculo, diseño,
                                fabricación y montaje de tableros eléctricos para automatización y control de procesos industriales.</p>
                        </div>
                        <div class="box box2">
                            <h3 class="box-title">Clientes Destacados</h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Correo electrónico</th>
                                        <th>Teléfono</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Juan Pérez</td>
                                        <td>juan@example.com</td>
                                        <td>123456789</td>
                                    </tr>
                                    <tr>
                                        <td>María López</td>
                                        <td>maria@example.com</td>
                                        <td>987654321</td>
                                    </tr>
                                    <!-- Agrega más filas de clientes aquí -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Ultimos movimientos</h3>
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
                                    <th>Tipo</th>
                                    <th>N</th>
                                    <th>Cliente o Proveedor</th>
                                    <th>Usuario</th>
                                    <th>Fecha y hora</th>
                                    <th>Total</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    pedidoProveedorVO actividadVO = new pedidoProveedorVO();
                                    pedidoProveedorDAO actividadDAO = new pedidoProveedorDAO();
                                    ArrayList<pedidoProveedorVO> listaActividades = actividadDAO.listarActividad();
                                    int contador = 0;
                                    for (int i = 0; i < listaActividades.size(); i++) {
                                        actividadVO = listaActividades.get(i);
                                        contador = contador + 1;
                                %>
                                <tr class="daticos">
                                    <td class="tipo"><%=actividadVO.getTipo()%></td>
                                    <td class="id"><%=actividadVO.getId()%></td>
                                    <td class="id_usuario"><%=actividadVO.getCliente_prov()%></td>
                                    <td><%=actividadVO.getId_usu()%></td>
                                    <td class="fecha"><%=actividadVO.getFecha()%></td>
                                    <td class="total"><%=actividadVO.getTotal()%></td>
                                    <td class="estado-usuario">
                                        <span class="status <%=actividadVO.getEstado().equals("en_proceso") ? "proceso" : (actividadVO.getEstado().equals("entregado") ? "entregado" : "pendiente")%>">
                                            <%=actividadVO.getEstado()%>
                                        </span>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
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
    
    filas.forEach((fila) => {
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
    </body>
</html>
