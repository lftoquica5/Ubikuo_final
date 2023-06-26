<%-- 
    Document   : Usuarios
    Created on : 12/04/2023, 10:18:32 PM
    Author     : Alexander
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.usuarioDAO"%>
<%@page import="ModeloVO.usuarioVO"%>
<%@page import="ModeloVO.rolesVO"%>
<%@page import="ModeloDAO.rolesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <span class="text">Usuarios</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Registrar Usuario</span>
                            <div class="popup" id="popup1">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Registrar Usuario</h2>
                                    <form method="post" action="usuario" onsubmit="return validarFormulario()">
                                        <div class="module-details">
                                            <div class="input-box">
                                                <span class="details">Nombre(s)<span style="color: red;">*</span></span>
                                                <input type="text" name="usunombre" id="usunombre" placeholder="Nombre(s)" >
                                                <div id="error_usunombre" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Apellidos<span style="color: red;">*</span></span>
                                                <input type="text" name="usuapellido" id="usuapellido" placeholder="Apellidos" >
                                                <div id="error_usuapellido" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Documento<span style="color: red;">*</span></span>
                                                <input type="text" name="id_usuario" id="id_usuario" inputmode="numeric" pattern="[0-9]{1,10}" maxlength="10" placeholder="Documento" >
                                                <div id="error_id_usuario" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Dirección<span style="color: red;">*</span></span>
                                                <input type="text" name="usudireccion" id="usudireccion" placeholder="Dirección" >
                                                <div id="error_usudireccion" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Teléfono<span style="color: red;">*</span></span>
                                                <input type="text" name="usutelefono" id="usutelefono" maxlength="10" placeholder="Teléfono" >
                                                <div id="error_usutelefono" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Correo Electrónico<span style="color: red;">*</span></span>
                                                <input type="email" name="usuemail" id="usuemail" placeholder="Correo Electrónico" >
                                                <div id="error_usuemail" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Contraseña<span style="color: red;">*</span></span>
                                                <input type="password" name="usupassword" id="usupassword" maxlength="10" placeholder="Contraseña" >
                                                <div id="error_usupassword" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Rol<span style="color: red;">*</span></span>
                                                <select name="usu_id_rol" id="usu_id_rol" required>
                                                    <option value="">Seleccione...</option>
                                                    <% rolesDAO rolDAO = new rolesDAO();
                                                        for (rolesVO rolVO : rolDAO.listar()) {%>
                                                    <option value="<%=rolVO.getId_Rol()%>"><%=rolVO.getRolnombre()%></option>
                                                    <% } %>
                                                </select>
                                                <div id="error_usu_id_rol" class="error"></div>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Estado<span style="color: red;">*</span></span>
                                                <select name="usuestado" id="usuestado" required>
                                                    <option value="">Seleccione...</option>
                                                    <option value="activo">Activo</option>
                                                    <option value="inactivo">Inactivo</option>
                                                </select>
                                                <div id="error_usuestado" class="error"></div>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <a href="#" class="cancelarbtn">Cancelar</a>
                                            <button class="registrarbtn">Registrar Usuario</button>
                                            <input type="hidden" name="opcion" value="1">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="box box2">
                            <i class="bx bxs-user-check activos"></i>

                            <span class="text">Activos</span>
                        </div>
                        <div class="box box3">
                            <i class="bx bxs-user total"></i>

                            <span class="text">Total</span>
                        </div>
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Consultar Usuario</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_usuario"class="buscar__input" placeholder="Buscar">
                            </div>
                            <select class="selectico" id="estado">
                                <option value="">Todos</option>
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                            </select>
                            <i class='bx bx-search'></i>
                            <i class='bx bx-filter'></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Cedula</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Direccion</th>
                                    <th>Telefono</th>
                                    <th>Email</th>

                                    <th>Estado</th>
                                    <th>Rol</th>
                                    <th>Actualizar</th>
                                </tr>
                            </thead>
                            <%
                                usuarioVO usuVO = new usuarioVO();
                                usuarioDAO usuDAO = new usuarioDAO();
                                ArrayList<usuarioVO> listaUsuarios = usuDAO.listar();
                                int contador = 0;
                                for (int i = 0; i < listaUsuarios.size(); i++) {
                                    usuVO = listaUsuarios.get(i);
                                    contador = contador + 1;
                            %>
                            <tbody>
                                <tr class="daticos">
                                    <td class="id_usuario table-data"><%=usuVO.getId_usuario()%></td>
                                    <td class="table-data"><%=usuVO.getUsunombre()%></td>
                                    <td class="table-data"><%=usuVO.getUsuapellido()%></td>
                                    <td class="table-data"><%=usuVO.getUsudireccion()%></td>
                                    <td class="table-data"><%=usuVO.getUsutelefono()%></td>
                                    <td class="table-data"><%=usuVO.getUsuemail()%></td>

                                    <td class="table-data"><%=usuVO.getUsu_id_rol()%></td>
                                    <td class="estado-usuario table-data"><span class="status <%=usuVO.getUsuestado().equals("activo") ? "completed" : "inactive"%>"><%=usuVO.getUsuestado()%></span></td>
                                    <td class="table-data"><button class="open-popup actualizar-usuario updatebutton" data-popup="popup2" data-usu-id="<%=usuVO.getId_usuario()%>" data-usu-nombre="<%=usuVO.getUsunombre()%>" data-usu-apellido="<%=usuVO.getUsuapellido()%>"data-usu-direccion="<%=usuVO.getUsudireccion()%>" data-usu-telefono="<%=usuVO.getUsutelefono()%>" data-usu-email="<%=usuVO.getUsuemail()%>" data-usu-password="<%=usuVO.getUsupassword()%>" data-usu-rol="<%=usuVO.getUsu_id_rol()%>"data-usu-estado="<%=usuVO.getUsuestado()%>">
                                            <i class='bx bx-edit actualizar'></i></button>
                                            <%}%>
                                        <div class="popup actualizar-popup" id="popup2">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Usuario</h2>
                                                <form method = "post" action="usuario">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">Nombre(s)<span style="color: red;">*</span></span>
                                                            <input type="text" name ="usunombre" placeholder="Nombre(s)" id="usunombre" required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Apellidos<span style="color: red;">*</span> </span>
                                                            <input type="text" name ="usuapellido" placeholder="Apellidos" id="usuapellido" required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Documento<span style="color: red;">*</span> </span>
                                                            <input type="number" name="id_usuario" placeholder="Documento" maxlength="10" id="id_usuario" readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Dirección<span style="color: red;">*</span> </span>
                                                            <input type="text" name ="usudireccion" placeholder="Dirección" id="usudireccion" >
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Telefono<span style="color: red;">*</span> </span>
                                                            <input type="number" name ="usutelefono" placeholder="Celular" maxlength="10" id="usutelefono">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Correo Electronico<span style="color: red;">*</span> </span>
                                                            <input type="email" name ="usuemail" placeholder="Correo Electronico" id="usuemail">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Contraseña<span style="color: red;">*</span> </span>
                                                            <input type="text"  name="usupassword" placeholder="Contraseña" maxlength="10" id="usupassword">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Rol<span style="color: red;">*</span></span>
                                                            <select name="usu_id_rol" id="usu_id_rol">  
                                                                <%
                                                                    rolesDAO rolDAO_act = new rolesDAO();
                                                                    for (rolesVO rolVO : rolDAO_act.listar()) {
                                                                %>
                                                                <option value="<%=rolVO.getId_Rol()%>"><%=rolVO.getRolnombre()%></option>
                                                                <%}%>
                                                            </select>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Estado<span style="color: red;">*</span></span>
                                                            <select name="usuestado" id="usuestado">
                                                                <option value="activo">Activo</option>
                                                                <option value="inactivo">Inactivo</option>
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
        <script src="JS/popup.js" type="text/javascript"></script>
        <script>
                                        function validarFormulario() {
                                            var nombre = document.getElementById('usunombre').value;
                                            var apellido = document.getElementById('usuapellido').value;
                                            var documento = document.getElementById('id_usuario').value;
                                            var direccion = document.getElementById('usudireccion').value;
                                            var telefono = document.getElementById('usutelefono').value;
                                            var email = document.getElementById('usuemail').value;
                                            var password = document.getElementById('usupassword').value;
                                            var rol = document.getElementById('usu_id_rol').value;
                                            var estado = document.getElementById('usuestado').value;

                                            var valid = true;

                                            if (nombre === "") {
                                                mostrarError('usunombre', 'Debe ingresar un nombre.');
                                                valid = false;
                                            } else if (!/^[a-zA-Z]+$/.test(nombre)) {
                                                mostrarError('usunombre', 'El nombre solo puede contener letras.');
                                                valid = false;
                                            } else {
                                                ocultarError('usunombre');
                                            }

                                            if (apellido === "") {
                                                mostrarError('usuapellido', 'Debe ingresar apellidos.');
                                                valid = false;
                                            } else if (!/^[a-zA-Z]+$/.test(apellido)) {
                                                mostrarError('usuapellido', 'Los apellidos solo pueden contener letras.');
                                                valid = false;
                                            } else {
                                                ocultarError('usuapellido');
                                            }


                                            if (documento === "") {
                                                mostrarError('id_usuario', 'Debe ingresar un documento.');
                                                valid = false;
                                            } else if (!/^[0-9]{10}$/.test(documento)) {
                                                mostrarError('id_usuario', 'El documento debe tener 10 dígitos.');
                                                valid = false;
                                            } else {
                                                ocultarError('id_usuario');
                                            }

                                            if (direccion === "") {
                                                mostrarError('usudireccion', 'Debe ingresar una dirección.');
                                                valid = false;
                                            } else {
                                                ocultarError('usudireccion');
                                            }

                                            if (telefono === "") {
                                                mostrarError('usutelefono', 'Debe ingresar un número de teléfono.');
                                                valid = false;
                                            } else {
                                                ocultarError('usutelefono');
                                            }

                                            if (email === "") {
                                                mostrarError('usuemail', 'Debe ingresar un correo electrónico.');
                                                valid = false;
                                            } else {
                                                ocultarError('usuemail');
                                            }

                                            if (password === "") {
                                                mostrarError('usupassword', 'Debe ingresar una contraseña.');
                                                valid = false;
                                            } else if (!/^(?=.*[A-Z])(?=.*\d)(?=.*\W)[a-zA-Z0-9\S]{10,}$/.test(password)) {
                                                mostrarError('usupassword', 'La contraseña debe tener al menos 10 caracteres, una mayúscula, un número y un carácter especial.');
                                                valid = false;
                                            } else {
                                                ocultarError('usupassword');
                                            }

                                            if (rol === "") {
                                                mostrarError('usu_id_rol', 'Debe seleccionar un rol.');
                                                valid = false;
                                            } else {
                                                ocultarError('usu_id_rol');
                                            }

                                            if (estado === "") {
                                                mostrarError('usuestado', 'Debe seleccionar un estado.');
                                                valid = false;
                                            } else {
                                                ocultarError('usuestado');
                                            }

                                            return valid;
                                        }

                                        function mostrarError(id, mensaje) {
                                            var errorDiv = document.getElementById('error_' + id);
                                            errorDiv.innerHTML = mensaje;
                                            errorDiv.style.display = 'block';

                                            var input = document.getElementById(id);
                                            input.style.borderColor = 'red';
                                        }

                                        function ocultarError(id) {
                                            var errorDiv = document.getElementById('error_' + id);
                                            errorDiv.innerHTML = '';
                                            errorDiv.style.display = 'none';

                                            var input = document.getElementById(id);
                                            input.style.borderColor = '';
                                        }
        </script>
    </body>
</html>