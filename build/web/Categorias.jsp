<%-- 
    Document   : Usuarios
    Created on : 12/04/2023, 10:18:32 PM
    Author     : Alexander
--%>

<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
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
                icon: 'errors',
                title: '<%= errorMessage%>',
            });
        </script>
        <% } %>
        <section class="main">
            <div class="dash-content">
                <div class="overview">
                    <div class="title">
                        <span class="text">Categorias</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Nueva Categoria</span>
                            <div class="popup" id="popup1">
                                <div class="overlay"></div>
                                <div class="popup-content">
                                    <h2>Registrar Categoria</h2>
                                    <form method= "post" action="Categoria">
                                        <div class="module-details">
                                            <div class="input-box">
                                                <span class="details">Nombre <span style="color: red;">*</span></span>
                                                <input type="text" name ="catnombre" placeholder="Categoria" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Descripción<span style="color: red;">*</span> </span>
                                                <input type="text" name ="catdescripcion" placeholder="Descripción" required>
                                            </div>
                                            <div class="input-box">
                                                <span class="details">Estado<span style="color: red;">*</span></span>
                                                <select name="catestado">
                                                    <option value="activo">Activo</option>
                                                    <option value="inactivo">Inactivo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <a href="#" class="cancelarbtn">Cancelar</a>
                                            <button class="registrarbtn">Registrar Categoria</button>
                                            <input  type="hidden" name="opcion" value="1">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="box box2">
                            <i class='bx bxs-category-alt activos'></i>
                            <%
                                CategoriaDAO categoriasDAO = new CategoriaDAO();
                                int totalCategoriasActivas = categoriasDAO.getTotalCategoriasActivas();
                                out.println("<span class=\"number\">" + totalCategoriasActivas + "</span>");
                            %>
                            <span class="text">Activas</span>
                        </div>
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Consultar Categoria</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_usuario"class="buscar__input" placeholder="Buscar">
                            </div>
                            <select class="selectico" id="estado">
                                <option value="">Todas</option>
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                            </select>
                            <i class='bx bx-search'></i>
                            <i class='bx bx-filter'></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Identificación</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Estado</th>
                                    <th>Actualizar</th>
                                </tr>
                            </thead>
                            <%
                                CategoriaVO catVO = new CategoriaVO();
                                CategoriaDAO catDAO = new CategoriaDAO();
                                ArrayList<CategoriaVO> listaCategorias = catDAO.listarC();
                                int contador = 0;
                                for (int i = 0; i < listaCategorias.size(); i++) {
                                    catVO = listaCategorias.get(i);
                                    contador = contador + 1;
                            %>
                            <tbody>
                                <tr class="daticos">
                                    <td class="id_usuario"><%=catVO.getId_cat()%></td>
                                    <td><%=catVO.getCatnombre()%></td>
                                    <td><%=catVO.getCatdescripcion()%></td>
                                    <td class="estado-usuario"><span class="status <%=catVO.getCatestado().equals("activo") ? "completed" : "inactive"%>"><%=catVO.getCatestado()%></span></td>
                                    <td><button class="open-popup actualizar-usuario updatebutton" data-popup="popup2" data-cat-id="<%=catVO.getId_cat()%>" data-cat-nombre ="<%=catVO.getCatnombre()%>"  data-cat-descripcion="<%=catVO.getCatdescripcion()%>" data-cat-estado="<%=catVO.getCatestado()%>">
                                            <i class='bx bx-edit actualizar'></i></button>
                                            <%}%>
                                        <div class="popup actualizar-popup" id="popup2">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Categoria</h2>
                                                <form method="post" action="Categoria" id="tuFormulario">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">Identificación <span style="color: red;">*</span></span>
                                                            <input type="number" name ="id_cat" placeholder="Identificación" id="id_cat">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Nombre <span style="color: red;">*</span></span>
                                                            <input type="text" name ="catnombre" placeholder="Nombre" id="catnombre">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Descripción<span style="color: red;">*</span> </span>
                                                            <input type="text" name ="catdescripcion" placeholder="Descripción" id="catdescripcion">
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Estado<span style="color: red;">*</span></span>
                                                            <select name="catestado" id="catestado">
                                                                <option value="activo">Activo</option>
                                                                <option value="inactivo">Inactivo</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                                        <button class="registrarbtn">Actualizar Categoria</button>
                                                        <input type="hidden" name="opcion" value="2">
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
        <script src="JS/poupcategoria.js" type="text/javascript"></script>
    </body>
</html>
