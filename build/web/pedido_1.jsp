<%-- 
    Document   : pedido.jsp
    Created on : 17/06/2023, 05:11:39 PM
    Author     : diego
--%>

<%@page import="ModeloVO.pedidoVO"%>
<%@page import="ModeloVO.consultpedidoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.consultpedidoDAO"%>
<%@page import="ModeloDAO.pedidoDAO"%>
<%@include file="sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
        <link href="CSS/stylepopup.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>
    <style>
        .error-message {
            color: red;
            font-size: 12px;
        }
    </style>
    <body>
        <%-- Mostrar SweetAlert si se registra el cliente normal exitosamente --%>
        <% String successMessage = (String) request.getAttribute("MensajeExito"); %>
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
            <div class="dash-content pedido">
                <div class="overview">
                    <div class="title">
                        <span class="text">Pedidos</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Registrar Cliente</span>
                            <div class="popup" id="popup1">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Nuevo Cliente</h2>
                                    <form method="post" action="Cliente" onsubmit="return validarFormulario();">
                                        <div class="module-details">
                                            <div class="input-box">
                                                <span class="details">Documento</span>
                                                <input type="text" id="id_prov" name="id_cliente"  placeholder="Documento" maxlength="10" required>
                                                <div class="error-message"></div>
                                            </div>

                                            <div class="input-box">
                                                <span class="details">Nombres</span>
                                                <input type="text" name="clinombre" placeholder="Nombre" required>
                                                <div class="error-message"></div>
                                            </div>

                                            <div class="input-box">
                                                <span class="details">Apellidos</span>
                                                <input type="text" name="cliapellido" placeholder="Apellido" required>
                                                <div class="error-message"></div>
                                            </div>

                                            <div class="input-box">
                                                <span class="details">Dirección</span>
                                                <input type="text" name="clidireccion" placeholder="Dirección" required>
                                                <div class="error-message"></div>
                                            </div>

                                            <div class="input-box">
                                                <span class="details">Teléfono</span>
                                                <input type="number" name="clitelefono" placeholder="Teléfono" maxlength="10" required>
                                                <div class="error-message"></div>
                                            </div>

                                            <div class="input-box">
                                                <span class="details">Correo Electrónico</span>
                                                <input type="text" name="clicorreo" placeholder="Correo Electrónico" required>
                                                <div class="error-message"></div>
                                            </div>

                                            <div class="input-box">
                                                <span class="details">Descripción</span>
                                                <select type="text" name="clidescripcion">
                                                    <option value="activo">Natural</option>
                                                    <option value="inactivo">Crédito</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="controls">
                                            <a href="#" class="cancelarbtn">Cancelar</a>
                                            <button class="registrarbtn">Registrar Cliente</button>
                                            <input type="hidden" name="opcion" value="5">
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                        <a style="text-decoration:none" href="CrearPedido.jsp">

                            <div class="box box2">
                                <i class='bx bx-package pedido'></i>
                                <span class="text">Pedido</span>
                            </div>
                        </a>
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
                                                <button class="button" type="submit" name="reportName" value="ultimoPedido">Descargar</button>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Pedidos</span>
                                                <button class="button" type="submit" name="reportName" value="pedidosCompletos">Descargar</button>
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
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Últimos pedidos</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_cotizacion" class="buscar__input" placeholder="Buscar">
                            </div>
                            <select class="selectico" id="estado">
                                <option value="">Todos</option>
                                <option value="pendiente">Pendiente</option>
                                <option value="entregado">entregado</option>

                            </select>
                            <i class='bx bx-search'></i>
                            <i class='bx bx-filter'></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>N°Pedido</th>
                                    <th>N°documento</th>
                                    <th>Cliente</th>
                                    <th>Usuario</th>
                                    <th>Fecha</th>
                                    <th>Total</th>
                                    <th>Estado</th>
                                    <th>Actualizar</th>
                                    <th>Detalles</th>
                                </tr>
                            </thead>
                            <tbody id="tablaCotizaciones">
                                <%  pedidoVO pdVO = new pedidoVO();
                                    consultpedidoDAO ccotDAO = new consultpedidoDAO();
                                    ArrayList<consultpedidoVO> listaCotizaciones = ccotDAO.listarPed();
                                    for (consultpedidoVO cotizacion : listaCotizaciones) {%>
                                <tr class="datos">
                                    <td><%= cotizacion.getNpedido()%></td>
                                    <td class="id_cliente"><%= cotizacion.getDcumentocli()%></td>
                                    <td><%= cotizacion.getCliente()%></td>
                                    <td><%= cotizacion.getUsuario()%></td>
                                    <td><%= cotizacion.getFecha()%></td>
                                    <td><%= cotizacion.getCtotal()%></td>
                                    <td class="estado-pedido"><span class="status <%=cotizacion.getEstado().equals("pendiente") ? "completed" : "inactive"%>"><%=cotizacion.getEstado()%></span></td>
                                    <td><button class="open-popup actualizar-pedido updatebutton" data-ped-id="<%=cotizacion.getNpedido()%>" data-ped-usu="<%=cotizacion.getUsuario()%>" data-ped-cli="<%=cotizacion.getCliente()%>" data-ped-fecha="<%=cotizacion.getFecha()%>" data-ped-estado="<%=cotizacion.getEstado()%>" data-ped-total="<%=cotizacion.getCtotal()%>">
                                            <i class='bx bx-edit actualizar'></i></button>
                                        <div class="popup actualizar-popup" id="popup6">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Estado</h2>
                                                <form method = "post" action="Pedido">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">N°cotizacion<span style="color: red;">*</span></span>
                                                            <input type="text" name ="id_ped" id="id_ped" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Cliente<span style="color: red;">*</span></span>
                                                            <input type="text" name ="cot_id_ped" id="ped_id_cliente"readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Usuario<span style="color: red;">*</span></span>
                                                            <input type="text" name ="ped_id_usuario" id="ped_id_usuario"readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Fecha y hora<span style="color: red;">*</span> </span>
                                                            <input type="text" name ="pedfecha" id="pedfecha" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Total<span style="color: red;">*</span></span>
                                                            <input type="number" name="Totalped" id="Totalped" readonly>
                                                        </div>                   
                                                        <div class="input-box">
                                                            <span class="details">Estado<span style="color: red;">*</span></span>
                                                            <select name="pedestado" id="pedestado">
                                                                <option value="pendiente">Pendiente</option>
                                                                <option value="entregado">entregado</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                                        <button class="registrarbtn">Actualizar Producto</button>
                                                        <input  type="hidden" name="accion" value="actualizar">
                                                    </div>   
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <button class="open-popup detailbutton" data-popup="popup4_<%=cotizacion.getNpedido()%>" 
                                                data-ped-id="<%=cotizacion.getNpedido()%>"
                                                data-ped-usu="<%=cotizacion.getUsuario()%>" data-ped-cli="<%=cotizacion.getCliente()%>"
                                                data-ped-fecha="<%=cotizacion.getFecha()%>" data-ped-estado="<%=cotizacion.getEstado()%>"
                                                data-ped-total="<%=cotizacion.getCtotal()%>">
                                            <i class='bx bxs-detail actualizar'></i>
                                        </button>
                                        <div class="popup" id="popup4_<%=cotizacion.getNpedido()%>">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Detalles de pedido</h2>
                                                <div class="module-details">
                                                    <h4>N°Pedido: <%=cotizacion.getNpedido()%></h4>
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
                                                                consultpedidoDAO pedDetDAO = new consultpedidoDAO();
                                                                int pedidoId = cotizacion.getNpedido();
                                                                ArrayList<pedidoVO> listaProductos = pedDetDAO.listarProductos(pedidoId);
                                                                for (pedidoVO detalle : listaProductos) {
                                                            %>
                                                            <tr>
                                                                <td><%= detalle.getDC_idproducto()%></td>
                                                                <td><%= detalle.getDP_nproducto()%></td>
                                                                <td><%= detalle.getDP_cantidad()%></td>
                                                                <td><%= detalle.getDP_precio()%></td>
                                                                <td><%= detalle.getDP_subtotal()%></td>
                                                            </tr>
                                                            <% }%>
                                                        </tbody>
                                                    </table>

                                                    <div class="footer-details">
                                                        <h4>Total:<%= cotizacion.getCtotal()%></h4>
                                                    </div>
                                                </div>
                                                <div class="controls">
                                                    <a href="#" class="cancelarbtn">Cerrar</a>
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
        <script src="JS/buscador4.js" type="text/javascript"></script>
        <script src="JS/popuppedido.js" type="text/javascript"></script>
        <script>
                                        function validarFormulario() {
                                            var documento = document.getElementById('id_prov');
                                            var nombres = document.getElementsByName('clinombre')[0];
                                            var apellidos = document.getElementsByName('cliapellido')[0];
                                            var direccion = document.getElementsByName('clidireccion')[0];
                                            var telefono = document.getElementsByName('clitelefono')[0];
                                            var correo = document.getElementsByName('clicorreo')[0];

                                            var regexSoloNumeros = /^\d+$/;
                                            var regexSoloLetras = /^[A-Za-z]+$/;

                                            if (documento.value.length !== 10 || !regexSoloNumeros.test(documento.value)) {
                                                mostrarError(documento, 'Documento inválido. Debe tener 10 dígitos numéricos.');
                                                return false;
                                            } else {
                                                ocultarError(documento);
                                            }

                                            if (!regexSoloLetras.test(nombres.value)) {
                                                mostrarError(nombres, 'Nombres inválidos. Debe contener solo letras.');
                                                return false;
                                            } else {
                                                ocultarError(nombres);
                                                nombres.value = capitalizarPrimeraLetra(nombres.value);
                                            }

                                            if (!regexSoloLetras.test(apellidos.value)) {
                                                mostrarError(apellidos, 'Apellidos inválidos. Debe contener solo letras.');
                                                return false;
                                            } else {
                                                ocultarError(apellidos);
                                                apellidos.value = capitalizarPrimeraLetra(apellidos.value);
                                            }

                                            if (direccion.value.length === 0) {
                                                mostrarError(direccion, 'La dirección es obligatoria.');
                                                return false;
                                            } else {
                                                ocultarError(direccion);
                                            }

                                            if (telefono.value.length !== 10 || !regexSoloNumeros.test(telefono.value)) {
                                                mostrarError(telefono, 'Teléfono inválido. Debe tener 10 dígitos numéricos.');
                                                return false;
                                            } else {
                                                ocultarError(telefono);
                                            }

                                            if (correo.value.length === 0 || correo.value.indexOf('@') === -1) {
                                                mostrarError(correo, 'El correo electrónico es obligatorio y debe contener el símbolo "@"');
                                                return false;
                                            } else {
                                                ocultarError(correo);
                                            }


                                            // Si todas las validaciones pasan, el formulario es válido
                                            return true;
                                        }

                                        function mostrarError(elemento, mensaje) {
                                            var mensajeError = elemento.parentNode.querySelector('.error-message');
                                            if (!mensajeError) {
                                                mensajeError = document.createElement('div');
                                                mensajeError.classList.add('error-message');
                                                elemento.parentNode.appendChild(mensajeError);
                                            }
                                            mensajeError.textContent = mensaje;
                                        }

                                        function ocultarError(elemento) {
                                            var mensajeError = elemento.parentNode.querySelector('.error-message');
                                            if (mensajeError) {
                                                mensajeError.textContent = '';
                                            }
                                        }

                                        function capitalizarPrimeraLetra(cadena) {
                                            return cadena.charAt(0).toUpperCase() + cadena.slice(1).toLowerCase();
                                        }
        </script>

    </body>
</html>
