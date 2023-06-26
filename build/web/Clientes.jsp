<%-- 
    Document   : Usuarios
    Created on : 12/04/2023, 10:18:32 PM
    Author     : Alexander
--%>

<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
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
                icon: 'errors',
                title: '<%= errorMessage%>',
            });
        </script>
        <% } %>
        <section class="main">
            <div class="dash-content">
                <div class="overview">
                    <div class="title">
                        <span class="text">Clientes</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Registrar Cliente</span>
                            <div class="popup" id="popup1">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Registrar Cliente</h2>
                                    <form method= "post" action="Cliente">
                                        <div class="module-details">
                                            <div class="input-box">
                                                <span class="details">Cédula <span style="color: red;">*</span></span>
                                                <input type="text" name ="id_cliente" placeholder="Cedula" required>
                                            </div> 
                                            <div class="input-box">
                                                <span class="details">Nombre(s) <span style="color: red;">*</span></span>
                                                <input type="text" name ="clinombre" placeholder="Nombre(s)" required>
                                            </div>  
                                            <div class="input-box">
                                                <span class="details">Apellido(s)<span style="color: red;">*</span> </span>
                                                <input type="text" name ="cliapellido" placeholder="Apellido(s)" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Correo <span style="color: red;">*</span> </span>
                                                <input type="email" name ="clicorreo" placeholder="Correo Electronico" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Dirección <span style="color: red;">*</span> </span>
                                                <input type="text" name ="clidireccion" placeholder="Dirección" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Telefono <span style="color: red;">*</span> </span>
                                                <input type="number" name ="clitelefono" placeholder="Telefono" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Descripción<span style="color: red;">*</span></span>
                                                <select name="clidescripcion" id="catestado">
                                                    <option value="">Seleccione...</option>
                                                    <option value="credito">Credito</option>
                                                    <option value="natural">Natural</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <a href="#" class="cancelarbtn">Cancelar</a>
                                            <button class="registrarbtn">Registrar Cliente</button>
                                            <input  type="hidden" name="opcion" value="1">
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
                                    <form action="generadorReportes.jsp" method="post">
                                        <div class="module-detailsReportes">
                                            <div class="input-box">
                                                <span class="details">Clientes</span>
                                                <button class="button" type="submit" name="reportName" value="clientesTotales">Descargar</button>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Cliente Natural</span>
                                                <button class="button" type="submit" name="reportName" value="clientesNaturales">Descargar</button>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Cliente Crédito</span>
                                                <button class="button" type="submit" name="reportName" value="clientesCredito">Descargar</button>
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
                        <div class="box box1">
                            <i class='bx bxs-user-check activos'></i>
                            <%
                                ClienteDAO clientesDAO = new ClienteDAO();
                                int totalClientes = clientesDAO.getTotalClientes();
                                out.println("<span class=\"number\">" + totalClientes + "</span>");
                            %>
                            <span class="text">Total</span>
                        </div>
                        <div class="box box2">
                            <i class='bx bxs-user-detail activos'></i>
                            <%
                                ClienteDAO naturalesDAO = new ClienteDAO();
                                int totalClientesNaturales = naturalesDAO.getTotalClientesNaturales();
                                out.println("<span class=\"number\">" + totalClientesNaturales + "</span>");
                            %>
                            <span class="text">Naturales</span>
                        </div>
                        <div class="box box3">
                            <i class='bx bxs-credit-card-alt activos' ></i>
                            <%
                                ClienteDAO creditoDAO = new ClienteDAO();
                                int totalClientesCredito = creditoDAO.getTotalClientesCredito();
                                out.println("<span class=\"number\">" + totalClientesCredito + "</span>");
                            %>
                            <span class="text">Crédito</span>
                        </div>

                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Consultar Cliente</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_usuario"class="buscar__input" placeholder="Buscar">
                            </div>
                            <select class="selectico" id="estado">
                                <option value="">Todos</option>
                                <option value="credito">Credito</option>
                                <option value="natural">Natural</option>
                            </select>
                            <i class='bx bx-search'></i>
                            <i class='bx bx-filter'></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Identificación</th>
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Dirección</th>
                                    <th>Télefono</th>
                                    <th>Descripción</th>
                                    <th>Actualizar</th>
                                </tr>
                            </thead>
                            <%
                                ClienteDAO clienteDAO = new ClienteDAO();
                                ArrayList<ClienteVO> listaClientes = clienteDAO.listarClientes();
                                for (int i = 0; i < listaClientes.size(); i++) {
                                    ClienteVO cliVO = listaClientes.get(i);
                            %>
                            <tbody>
                                <tr class="daticos">
                                    <td class="id_usuario"><%= cliVO.getId_cliente()%></td>
                                    <td><%= cliVO.getClinombre()%> <%= cliVO.getCliapellido()%></td>
                                    <td><%= cliVO.getClicorreo()%></td>
                                    <td><%= cliVO.getClidireccion()%></td>
                                    <td><%= cliVO.getClitelefono()%></td>
                                    <td class="estado-usuario"><span class="status <%=cliVO.getClidescripcion().equals("credito") ? "completed" : "inactive"%>"><%=cliVO.getClidescripcion()%></span></td>
                                    <td><button class="open-popup actualizar-usuario updatebutton" data-popup="popup2" data-cli-id="<%=cliVO.getId_cliente()%>" data-cli-nombre="<%=cliVO.getClinombre()%>" data-cli-apellido="<%=cliVO.getCliapellido()%>" data-cli-correo="<%=cliVO.getClicorreo()%>"
                                                data-cli-telefono="<%=cliVO.getClitelefono()%>" data-cli-descripcion="<%=cliVO.getClidescripcion()%>" data-cli-direccion="<%=cliVO.getClidireccion()%>">
                                            <i class='bx bx-edit actualizar'></i></button>
                                            <%}%>
                                        <div class="popup actualizar-popup" id="popup2">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Clientes</h2>
                                                <form method="post" action="Cliente">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">Identificación <span style="color: red;">*</span></span>
                                                            <input type="number" name ="id_cliente" placeholder="Identificación" id="id_cliente" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Nombre(s)<span style="color: red;">*</span></span>
                                                            <input type="text" name ="clinombre" placeholder="Nombre" id="clinombre">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Apellido(s)<span style="color: red;">*</span> </span>
                                                            <input type="text" name ="cliapellido" placeholder="Apellido(s)" id="cliapellido">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Correo <span style="color: red;">*</span> </span>
                                                            <input type="text" name ="clicorreo" placeholder="Correo Electronico" id="clicorreo">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Dirección <span style="color: red;">*</span> </span>
                                                            <input type="text" name ="clidireccion" placeholder="Dirección" id="clidireccion">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Télefono <span style="color: red;">*</span> </span>
                                                            <input type="text" name ="clitelefono" placeholder="Telefono" id="clitelefono">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Descripción<span style="color: red;">*</span></span>
                                                            <select name="clidescripcion" id="clidescripcion">
                                                                <option value="credito">Credito</option>
                                                                <option value="natural">Natural</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                                        <button class="registrarbtn">Actualizar Usuario</button>
                                                        <input  type="hidden" name="opcion" value="2">
                                                    </div>   
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <script src="JS/buscador.js" type="text/javascript"></script>
        <script src="JS/popupcliente.js" type="text/javascript"></script>
    </body>
</html>
