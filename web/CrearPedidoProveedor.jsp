<%-- 
    Document   : Proveedor
    Created on : 26/04/2023, 07:56:00 AM
    Author     : APRENDIZ
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="ModeloVO.productosVO"%>
<%@page import="ModeloDAO.productosDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ModeloDAO.rolesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido Proveedor</title>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!--------------------- Select ------------------------------->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

        <!--------------------- Estilos ------------------------------->
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/pedido.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>
    <body>
        <section class="main">
            <form method="post" action="DetallesPedidoProveedor">
                <div class="dash-content">
                    <div class="overview">
                        <div class="title">
                            <span class="text">Pedido Proveedor</span>
                        </div>
                    </div>
                    <div class="container">
                        <div class="columna1">
                            <div class="caja1">
                                <h4>Datos Generales</h4>
                                <div class="datos-usu">
                                    <%
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        Date currentDate = new Date();
                                        String currentDateStr = dateFormat.format(currentDate);
                                    %>
                                    <div class="box-container">
                                        <label>Fecha</label>
                                        <input type="date" value="<%= currentDateStr%>"readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>NIT</label>
                                        <select name="id_prov" class="select2" id="miSelect">
                                            <option>Seleccione...</option>
                                            <% ProveedorDAO provDAO = new ProveedorDAO();
                                                for (ProveedorVO rolVO : provDAO.listar()) {
                                                    String id_prov = String.valueOf(rolVO.getId_prov());
                                                    String selected = ""; // Variable para almacenar el atributo "selected"
                                                    if (id_prov.equals(request.getParameter("id_prov"))) {
                                                        selected = "selected"; // Si el valor coincide, se marca como seleccionado
                                                    }
                                            %>
                                            <option value="<%= id_prov%>" <%= selected%>><%= rolVO.getPronombre()%> NIT <%= rolVO.getId_prov()%></option>
                                            <% }%>

                                        </select>
                                                  </div>
                                    <div class="box-container">
                                        <button class="buttonProd" type="submit" name="accion" value="buscarProveedor" class="btn btn-secondary">Buscar Proveedor</button>
                                    </div>
                                </div>
                                <h4>Datos Proveedor</h4>
                                <div class="datos-prov">
                                    <input type="hidden" name="usuarioId" value="<%=usuId%>">
                                    <div class="box-container">
                                        <label>Nombre</label>
                                        <input type="text" placeholder="Nombre" name="pronombre"  value="${provVO.pronombre}" readonly>
                                    </div> 
                                    <div class="box-container">
                                        <label>Representante</label>
                                        <input type="text" placeholder="Representante" name="prorepresentante" value="${provVO.prorepresentante}" readonly>
                                    </div> 
                                    <div class="box-container">
                                        <label>Direccion</label>
                                        <input type="text" placeholder="Direccion" name="prodireccion" value="${provVO.prodireccion}" readonly>
                                    </div>
                                    <div class="box-container">
                                        <label>Correo Electronico</label>
                                        <input type="text" placeholder="Correo Electronico" name="procorreo" value="${provVO.procorreo}" readonly>
                                    </div>
                                </div>
                            </div>
                            <h2>Lista de Productos</h2>
                            <table class="tabla1">
                                <thead>
                                    <tr>
                                        <td>Item</td>
                                        <th>Referencia</th>
                                        <th>Nombre</th>
                                        <th>Cantidad</th>
                                        <th>Precio Unitario</th>
                                        <th>Sub Total</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="detalle" items="${listaProductos}">
                                        <tr>
                                            <td>${detalle.item}</td>
                                            <td>${detalle.dpro_id_producto}</td>
                                            <td>${detalle.descripcionProducto}</td>
                                            <td>${detalle.dpro_cantidad}</td>
                                            <td>${detalle.dpro_preciocompra}</td>
                                            <td>${detalle.dpro_subtotal}</td>
                                            <td><a href="DetallesPedidoProveedor?accion=Eliminar&indice=${detalle.item}" class="eliminar" style="margin-left: 10px"><i class='bx bxs-trash-alt'></i></a></td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="6"><b>Total:</b></td>
                                        <td><span id="total"><b>${Total}</b></span></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="button-container">
                                <button type="submit" name="accion" value="Cancelar Pedido" class="eliminar">Cancelar Pedido</button>

                                <button type="submit" name="accion" value="generarPedido" class="generar-pedido">Generar Pedido</button>
                                <input type="hidden" name="opcion" value="2">
                            </div>         
                        </div>
                        <div class="columna2"> 
                            <h3 class="titulo-prod">Productos</h3>
                            <div class="caja2">
                                <div class="productos">
                                    <div class="datosproductos">
                                        <label>Producto</label>
                                        <select name="id_prod" id="selectProducto" class="select2" id="miSelect">
                                            <option value="">Seleccione...</option>
                                            <% productosDAO prodDAO = new productosDAO();
                                                List<productosVO> listaProductos = prodDAO.listar();
                                                for (productosVO prodVO : listaProductos) {%>
                                            <option class="producto-option" value="<%= prodVO.getId_prod()%>" data-descripcion="<%= prodVO.getProd_descripcion()%>" data-precio="<%= prodVO.getProdprecio()%>" data-stock="<%= prodVO.getProdstock_disp()%>"><%= prodVO.getProdnombre()%> - REF: <%= prodVO.getId_prod()%></option>
                                            <% }%>
                                        </select>
                                        <button class="agregarProd" type="submit" name="accion" value="buscarproducto" class="btn btn-secondary">Buscar Producto</button>
                                        <label style="margin-top: 0.5rem">Referencia</label>
                                        <input type="number" placeholder="Referencia" name="id_prod" value="${pr.getId_prod()}" readonly>
                                        <label>Nombre</label>
                                        <input type="text" placeholder="Precio" name="prodnombre" value="${pr.getProdnombre()}" readonly>
                                        <label>Descripción</label>
                                        <input type="text" placeholder="Descripcion" name="prod_descripcion" value="${pr.getProdnombre()}" readonly>
                                        <label>Precio</label>
                                        <input type="number" placeholder="Precio" name="prodprecio" value="${pr.getProdprecio()}" readonly>
                                        <label>Stock</label>
                                        <input type="number" placeholder="Stock" name="prodstock_disp" value="${pr.getProdstock_disp()}" readonly>
                                        <label>Cantidad</label>
                                        <input type="number" placeholder="Cantidad" name="dpro_cantidad">
                                        <button class="btn agregar" id="agregar-btn">Agregar al pedido</button>
                                        <input  type="hidden" name="accion" value="agregarproducto">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <% if (request.getAttribute("mensajeError") != null) {%>
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '<%= request.getAttribute("mensajeError")%>',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
            });
        </script>
        <% } else if (request.getAttribute("mensajeExito") != null) {%>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: '<%= request.getAttribute("mensajeExito")%>',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
            });
        </script>
        <% }%>
        <% if (request.getAttribute("pedidoRegistrado") != null) { %>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: 'El pedido se registró correctamente.',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
            });
        </script>
        <% }%>
        <script src="JS/pedidoproveedor.js" type="text/javascript"></script>
    </body>
</html>