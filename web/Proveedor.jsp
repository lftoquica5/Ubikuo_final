<%-- 
    Document   : Proveedor
    Created on : 26/04/2023, 07:56:00 AM
    Author     : APRENDIZ
--%>

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
        <link href="CSS/principal.css" rel="stylesheet" type="text/css"/>
        <!--------------------- Iconos ------------------------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    </head>
    <body>
        <section class="main">
            <div class="dash-content pedido">
                <div class="overview">
                    <div class="title">
                        <span class="text">Proveedores</span>
                    </div>
                    <div class="boxes">
                        <div class="box box1">
                            <button class="open-popup" data-popup="popup1"><i class='bx bxs-plus-circle registrar'></i></button>
                            <span class="text">Registrar</span>
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
                                                <span class="details">Proveedores</span>
                                                <button class="button" type="submit" name="reportName" value="proveedores">Descargar</button>
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
                        <div class="box box2">
                            <i class="bx bxs-user-check activos"></i>
                            <%
                                ProveedorDAO proveedoresDAO = new ProveedorDAO();
                                int totalProveedoresActivos = proveedoresDAO.getTotalProveedoresActivos();
                                out.println("<span class=\"number\">" + totalProveedoresActivos + "</span>");
                            %>
                            <span class="text">Activos</span>
                        </div>
                        <div class="box box3">
                            <i class="bx bxs-user total"></i>
                            <%
                                ProveedorDAO proveedoractivosDAO = new ProveedorDAO();
                                int totalProveedores = proveedoractivosDAO.getTotalProveedores();
                                out.println("<span class=\"number\">" + totalProveedores + "</span>");
                            %>
                            <span class="text">Total</span>
                        </div>
                    </div>
                </div>
                <div id="customers" class="table-data">
                    <div  class="order">
                        <div class="head">
                            <h3>Consultar Proveedor</h3>
                            <div class="buscar">
                                <input type="text" id="buscador" name="id_prov"class="buscar__input" placeholder="Buscar">
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
                                    <th>NIT</th>
                                    <th>Nombre</th>
                                    <th>Direccion</th>
                                    <th>Telefono</th>
                                    <th>Descripcion</th>
                                    <th>Correo</th>
                                    <th>Representante</th>
                                    <th>Estado</th>
                                    <th>Actualizar</th>
                                </tr>
                            </thead>
                            <%
                                ProveedorVO provVO = new ProveedorVO();
                                ProveedorDAO provDAO = new ProveedorDAO(provVO);
                                ArrayList<ProveedorVO> listar = provDAO.listar();

                                for (int i = 0; i < listar.size(); i++) {
                                    provVO = listar.get(i);
                            %>
                            <tbody>
                                <tr class="daticos">
                                    <td class="id_usuario"><%=provVO.getId_prov()%></td>
                                    <td><%=provVO.getPronombre()%></td>
                                    <td><%=provVO.getProdireccion()%></td>
                                    <td><%=provVO.getProtelefono()%></td>
                                    <td><%=provVO.getProdescripcion()%></td>
                                    <td><%=provVO.getProcorreo()%></td>
                                    <td> <%=provVO.getProrepresentante()%></td>
                                    <td class="estado-usuario"><span class="status <%=provVO.getProestado().equals("activo") ? "completed" : "inactive"%>"><%=provVO.getProestado()%></span></td>
                                    <td><button class="open-popup actualizar-usuario updatebutton" data-popup="popup2" data-prov-id="<%=provVO.getId_prov()%>" data-prov-nombre="<%=provVO.getPronombre()%>" data-prov-direccion="<%=provVO.getProdireccion()%>"data-prov-telefono="<%=provVO.getProtelefono()%>" data-prov-descripcion="<%=provVO.getProdescripcion()%>" data-prov-email="<%=provVO.getProcorreo()%>" data-prov-repre="<%=provVO.getProrepresentante()%>" data-prov-estado="<%=provVO.getProestado()%>" >
                                            <i class='bx bx-edit actualizar'></i></button>
                                            <%}%>
                                        <div class="popup actualizar-popup" id="popup2">
                                            <div class="overlay"></div>
                                            <div class="popup-content">
                                                <h2>Actualizar Proveedor</h2>
                                                <form method = "post" action="Proveedor">
                                                    <div class="module-details">
                                                        <div class="input-box">
                                                            <span class="details">NIT<span style="color: red;">*</span></span>
                                                            <input type="text" name="id_prov" placeholder="NIT" id="id_prov" required readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Nombre<span style="color: red;">*</span> </span>
                                                            <input type="text" name="pronombre"  placeholder="Nombre" id="pronombre" required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Dirección<span style="color: red;">*</span></span>
                                                            <input type="text" name="prodireccion" placeholder="Direccion" id="prodireccion" required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Telefono<span style="color: red;">*</span></span>
                                                            <input type="number" name="protelefono" placeholder="Telefono" id="protelefono" required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Correo Electronico<span style="color: red;">*</span> </span>
                                                            <input type="text" name="procorreo" placeholder="Correo Electronico" id="procorreo" required readonly>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Descripción<span style="color: red;">*</span></span>
                                                            <input type="text" name="prodescripcion" placeholder="Descripcion" id="prodescripcion"required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Representante<span style="color: red;">*</span></span>
                                                            <input type="text" name="prorepresentante" placeholder="Representante" id="prorepresentante" required>
                                                        </div>
                                                        <div class="input-box">
                                                            <span class="details">Estado<span style="color: red;">*</span></span>
                                                            <select type="text" name="proestado" id="proestado">
                                                                <option value="activo">activo</option>
                                                                <option value="inactivo">inactivo</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="controls">
                                                        <a href="#" class="cancelarbtn">Cancelar</a>
                                                        <button class="registrarbtn">Actualizar Proveedor</button>
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
        <script src="JS/popuproveedor.js" type="text/javascript"></script>
    </body>
</html>
