<%-- 
    Document   : Usuarios
    Created on : 12/04/2023, 10:18:32 PM
    Author     : Alexander
--%>

<%@page import="ModeloDAO.rolesDAO"%>
<%@page import="ModeloVO.rolesVO"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="java.util.ArrayList"%>
<%@include file="sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Roles</title>
        <link href="CSS/stylepopup.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
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
                title: '<%= errorMessage%>',
                text: '<%= errorMessage%>'
            });
        </script>
        <% } %>
        <section class="main">
            <div class="dash-content">
                <div class="overview">
                    <div class="title">
                        <span class="text">Roles</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Nuevo Rol</span>
                            <div class="popup" id="popup1">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Registrar Rol</h2>
                                    <form method= "post" action="roles">
                                        <div class="module-details">
                                            <div class="input-box">
                                                <span class="details">Nombre <span style="color: red;">*</span></span>
                                                <input type="text" name ="rolnombre" placeholder="Nombre" title="El nombre debe tener al menos 3 letras para poder continuar" onkeypress="return SoloLetras(event)" onKeyUP="this.value = this.value.toLowerCase();" pattern=".{3,50}" maxlength="50" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Estado<span style="color: red;">*</span></span>
                                                <select name="estado" id="usuestado">
                                                    <option value="activo">Activo</option>
                                                    <option value="inactivo">Inactivo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <a href="#" class="cancelarbtn">Cancelar</a>
                                            <button class="registrarbtn">Registrar Rol</button>
                                            <input  type="hidden" name="opcion" value="1">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="box box3">
                            <i class='bx bxs-user total'></i>
                            <%
                                rolesDAO rolesDAO = new rolesDAO();
                                int totalRoles = rolesDAO.getTotalRoles();
                                out.println("<span class=\"number\">" + totalRoles + "</span>");
                            %>
                            <span class="text">Total</span>
                        </div>
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Consultar Rol</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_usuario"class="buscar__input" placeholder="Buscar">
                            </div>
                            <i class='bx bx-search'></i>
                            <i class='bx bx-filter'></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Identificación</th>
                                    <th>Nombre</th>
                                </tr>
                            </thead>
                            <%
                                rolesVO rolVO = new rolesVO();
                                rolesDAO rolDAO = new rolesDAO();
                                ArrayList<rolesVO> listaRoles = rolDAO.listar();
                                int contador = 0;
                                for (int i = 0; i < listaRoles.size(); i++) {
                                    rolVO = listaRoles.get(i);
                                    contador = contador + 1;
                            %>
                            <tbody>
                                <tr class="daticos">
                                    <td class="id_usuario"><%=rolVO.getId_Rol()%></td>
                                    <td><%=rolVO.getRolnombre()%></td>
                                    <td class="estado-usuario"><span class="status <%=rolVO.getRolestado().equals("activo") ? "completed" : "inactive"%>"><%=rolVO.getRolestado()%></span></td>
                                    <td><button class="open-popup actualizar-usuario updatebutton" data-popup="popup2" data-rol-id="<%=rolVO.getId_Rol()%>" data-rol-nombre="<%=rolVO.getRolnombre()%>">
                                            <i class='bx bx-edit actualizar'></i></button>
                                            <%}%>
                                        <div class="popup actualizar-popup" id="popup2">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Rol</h2>
                                                <form method="post" action="roles">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">Identificación <span style="color: red;">*</span></span>
                                                            <input type="number" name ="id_Rol" placeholder="Identificación" id="id_Rol" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Nombre <span style="color: red;">*</span></span>
                                                            <input type="text" name ="rolnombre" placeholder="Nombre" id="rolnombre">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Estado<span style="color: red;">*</span></span>
                                                            <select name="estado" id="usuestado">
                                                                <option value="activo">Activo</option>
                                                                <option value="inactivo">Inactivo</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                                        <button class="registrarbtn">Actualizar Rol</button>
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
        <script src="JS/validaciones.js" type="text/javascript"></script>
        <script src="JS/buscador2.js" type="text/javascript"></script>
        <script src="JS/popuprol.js" type="text/javascript"></script>
    </body>
</html>
