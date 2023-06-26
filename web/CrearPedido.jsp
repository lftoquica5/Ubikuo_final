<%-- 
    Document   : CrearPedido
    Created on : Jun 5, 2023, 3:25:11 AM
    Author     : WIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ModeloVO.productosVO"%>
<%@page import="java.util.List"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloDAO.productosDAO"%>
<%@include file="sesiones.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!--------------------- Select ------------------------------->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

        <!--------------------- Estilos ------------------------------->
        <link href="CSS/stylepopup.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/pedido.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <c:set var="lista" value="${lista}" scope="session" />
    <c:set var="item" value="${item}" scope="session" />
    <c:set var="Total" value="${total}" scope="session" />
    <%-- Mostrar SweetAlert si se registra el cliente normal exitosamente --%>
    <% String successMessage = (String) request.getAttribute("RegistroExitoso"); %>
    <% if (successMessage != null) {%>
    <script>
        Swal.fire({
        icon: 'success',
                title: 'Pedido Creado',
                text: '<%= successMessage%>'
        });
    </script>
    <% } %>

    <%-- Mostrar SweetAlert en caso de error al registrar el cliente normal --%>
    <% String errorMessage = (String) request.getAttribute("mensajeError"); %>
    <% if (errorMessage != null) {%>
    <script>
        Swal.fire({
        icon: 'error',
                title: 'Error',
                text: '<%= errorMessage%>'
        });
    </script>
    <% } %>

    <body >

        <section class="main">
            <form  id="pedido-form" method="post" action="Pedido" autocomplete="off">
                <div class="dash-content">
                    <div class="overview">
                        <div class="title">
                            <span class="text">Pedidos</span>
                        </div>
                    </div>

                    <div class="container">

                        <div class="columna1">

                            <div class="caja1">

                                <h4>Datos</h4>
                                <div class="datos-usu">
                                    <%
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        Date currentDate = new Date();
                                        String currentDateStr = dateFormat.format(currentDate);
                                    %>
                                    <div class="box-container">
                                        <label>Fecha</label>
                                        <input type="date" value="<%= currentDateStr%>"readonly>
                                        <input type="hidden" name="usuarioId" value="<%=usuId%>">
                                    </div>
                                    <div class="box-container">
                                        <label>Documento</label>

                                        <input type="text" name="ped_id_cliente" value="${c.getId_cliente()}"> 

                                    </div>              
                                    <div class="box-container">
                                        <button class="buttonProd" type="submit" name="accion" value="buscarcliente" class="btn btn-secondary" >Buscar</button>
                                    </div>
                                </div>                 
                                <h4>Datos Cliente</h4>
                                <div class="datos-prov">
                                    <div class="box-container">
                                        <label>Nombre</label>
                                        <input type="text" placeholder="Nombre" value="${c.getClinombre()}" readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>Apellido</label>
                                        <input type="text" placeholder="Apellido" value="${c.getCliapellido()}"readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>Descripción</label>
                                        <input type="text" placeholder="Descripción" value="${c.getClidescripcion()}"readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>Correo</label>
                                        <input type="text" placeholder="Correo" value="${c.getClicorreo()}"readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>Dirección</label>
                                        <input type="text" placeholder="Dirección" value="${c.getClidireccion()}"readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>Teléfono</label>
                                        <input type="text" placeholder="Teléfono" value="${c.getClitelefono()}"readonly>
                                    </div>

                                </div>

                            </div>

                            <h2>Lista de Productos</h2>
                            <table class="tabla1" id="tablaProductos">
                                <thead>
                                    <tr id="fila-${list.item}">
                                        <th>Item</th>
                                        <th>Idproducto</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio unitario</th>
                                        <th>Subtotal</th>
                                        <th class="action">Acciones</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="list" items="${lista}" varStatus="status">
                                        <tr>
                                            <td>${list.getItem()}</td>
                                            <td>${list.getDp_id_producto()}</td>
                                            <td>${list.getNombreprod()}</td>
                                            <td>${list.getDp_cantidad()}</td>
                                            <td>${list.getPrecio()}</td>
                                            <td>${list.getSubtotal()}</td>
                                            <td class="d-flex">
                                                <a href="Pedido?accion=Eliminar&indice=${list.item}" class="eliminar" style="margin-left: 10px">Eliminar</a>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="card-footer d-flex parte04">
                                <div class="col-sm-3 ml-auto">

                                    <p>Total: <span id="total">${Total}</span></p>

                                </div>

                                <div class="col-sm-6">
                                    <button type="submit" name="accion" value="generarpedido" class="generar-pedido">Crear Pedido</button>
                                    <input type="button" value="Cancelar" onclick="cancelarRegistro()" class="cancelar-pedido">
                                </div>

                            </div>
                        </div>

                        <div class="columna2">
                            <h3 class="titulo-prod">Productos</h3>
                            <div class="caja2">
                                <div class="productos">
                                    <div class="datosproductos">
                                        <label>Producto</label>
                                        <input type="text" name="dp_id_prod" value="${pr.getId_prod()}">
                                        <button type="submit" name="accion" value="buscarproducto" class="btn agregar">Buscar</button>

                                        <label>Descripción</label>
                                        <input type="text" placeholder="Producto" value="${pr.getProdnombre()}" name="nomproducto" readonly>
                                        <label>Precio</label>
                                        <input type="text" placeholder="Precio" value="${pr.getProdprecio()}" name="precio" readonly>
                                        <label>Stock</label>
                                        <input type="text" placeholder="Stock" value="${pr.getProdstock_disp()}" name="stock" readonly>
                                        <label>Cantidad</label>
                                        <input type="text" placeholder="Cantidad" name="cantidad" id="cantidad-input">
                                        <div class="error-message" id="cantidad-error"></div>
                                        <button class="btn agregar" id="agregar-btn">Agregar</button>
                                        <input type="hidden" name="accion" value="agregarproducto">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <style>
                            .error-message {
                                color: red;
                                font-size: 0.8rem;
                                margin-top: 5px;
                            }
                        </style>
                    </div>
                </div>
            </form>
        </section>

        <script src="JS/agregaProducto.js" type="text/javascript"></script>
        <script src="JS/cotizacion.js" type="text/javascript"></script>
        <script src="JS/buscador.js" type="text/javascript"></script>
        <script src="JS/popup.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       <script>
    function cancelarRegistro() {
        swal({
            title: "¿Estás seguro que deseas cancelar el registro?",
            text: "Todos los datos ingresados se perderán.",
            icon: "warning",
            buttons: ["Cancelar", "Aceptar"],
            dangerMode: true,
        }).then((confirm) => {
            if (confirm) {
                document.getElementById("pedido-form").setAttribute("onsubmit", "return false;");
                var tablaProductos = document.getElementById("tablaProductos");
                if (tablaProductos) {
                    var tbody = tablaProductos.getElementsByTagName("tbody")[0];
                    while (tbody.firstChild) {
                        tbody.removeChild(tbody.firstChild); // Eliminar todas las filas de la tabla
                    }
                }
                // Llamar al controlador para cancelar el registro
                window.location.href = "Pedido?accion=cancelar";
            }
        });
    }
</script>
        <script>
            const stockInput = document.querySelector('input[name="stock"]');
            const cantidadInput = document.getElementById('cantidad-input');
            const agregarBtn = document.getElementById('agregar-btn');
            const cantidadError = document.getElementById('cantidad-error');
            cantidadInput.addEventListener('input', function() {
            const stock = parseInt(stockInput.value);
            const cantidad = parseInt(cantidadInput.value);
            if (cantidad > stock) {
            agregarBtn.disabled = true;
            cantidadError.textContent = 'La cantidad ingresada supera el stock disponible';
            } else {
            agregarBtn.disabled = false;
            cantidadError.textContent = '';
            }
            });
        </script>


    </body>
</html>
