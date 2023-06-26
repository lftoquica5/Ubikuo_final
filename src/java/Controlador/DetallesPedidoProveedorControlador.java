/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ProveedorDAO;
import ModeloDAO.pedidoProveedorDAO;
import ModeloDAO.productosDAO;
import ModeloVO.ProveedorVO;
import ModeloVO.pedidoProveedorVO;
import ModeloVO.productosVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexander
 */
@WebServlet(name = "DetallesPedidoProveedorControlador", urlPatterns = {"/DetallesPedidoProveedor"})
public class DetallesPedidoProveedorControlador extends HttpServlet {

    pedidoProveedorVO pedProvVO = new pedidoProveedorVO();
    pedidoProveedorDAO pedProvDAO = new pedidoProveedorDAO();
    ProveedorVO provVO = new ProveedorVO();
    ProveedorDAO provDAO = new ProveedorDAO();
    productosVO prVO = new productosVO();
    productosDAO prDAO = new productosDAO();
    String idProducto;
    String nombreProducto;
    int cantidad, item, cod, ultimoId;
    double precioUnitario, subtotal, totalPagar; //CREAR VARIABLES DE LA TABLA
    List<pedidoProveedorVO> listaProductos = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");
            boolean error = false;
            String errorMessage = "";
            switch (accion) {
                case "buscarProveedor":
                    String nit = request.getParameter("id_prov");
                    provVO.setId_prov(nit);
                    provVO = provDAO.consultarPorId(nit);
                    request.setAttribute("provVO", provVO);
                    break;
                case "buscarproducto":
                    // Verificar si no se ha seleccionado un proveedor
                    if (provVO == null || provVO.getId_prov() == null || provVO.getId_prov().isEmpty()) {
                        request.setAttribute("mensajeError", "Debes seleccionar un proveedor antes de buscar un producto.");
                    } else {
                        String referencia = request.getParameter("id_prod");
                        prVO = prDAO.listarid(referencia);
                        request.setAttribute("provVO", provVO);
                        request.setAttribute("pr", prVO);
                        request.setAttribute("Total", totalPagar);
                        request.setAttribute("listaProductos", listaProductos);
                    }
                    break;
                case "agregarproducto":
                    if (prVO == null) {
                        request.setAttribute("mensajeErrorAgregar", "Debes buscar un producto antes de agregarlo al pedido.");
                    } else {
                        pedidoProveedorVO detallePedido = new pedidoProveedorVO(); // Crear una nueva instancia para el detalle de pedido
                        item = item + 1;
                        detallePedido.setItem(item);
                        detallePedido.setDpro_id_producto(prVO.getId_prod());
                        detallePedido.setDescripcionProducto(request.getParameter("prod_descripcion"));
                        detallePedido.setDpro_preciocompra(Double.parseDouble(request.getParameter("prodprecio")));
                        detallePedido.setDpro_cantidad(Integer.parseInt(request.getParameter("dpro_cantidad")));
                        detallePedido.setDpro_subtotal(detallePedido.getDpro_preciocompra() * detallePedido.getDpro_cantidad());
                        listaProductos.add(detallePedido);

                        totalPagar = 0.0;
                        for (pedidoProveedorVO pedido : listaProductos) {
                            totalPagar += pedido.getDpro_subtotal();
                        }

                        request.setAttribute("provVO", provVO);
                        request.setAttribute("Total", totalPagar);
                        request.setAttribute("listaProductos", listaProductos);
                    }
                    break;
                case "generarPedido":
                    if (listaProductos.isEmpty()) {
                        request.setAttribute("mensajeError", "Debes agregar al menos un producto al pedido.");
                    } else {
                        pedidoProveedorVO pedidoCompleto = new pedidoProveedorVO(); // Crear una nueva instancia para el pedido completo
                        pedidoCompleto.setPed_id_proveedor(Integer.parseInt(provVO.getId_prov()));
                        pedidoCompleto.setId_usuario(Integer.parseInt(request.getParameter("usuarioId")));
                        pedidoCompleto.setTotal_proped(totalPagar);

                        boolean exito = pedProvDAO.guardarPedido(pedidoCompleto);

                        if (exito) {
                            ultimoId = pedProvDAO.obtenerUltimoIdPedido();
                            for (pedidoProveedorVO detalle : listaProductos) {
                                detalle.setDpro_id_pedido(ultimoId);
                                pedProvDAO.agregarDetallesPedido(detalle);
                            }
                            request.setAttribute("pedidoRegistrado", true); // Atributo para indicar el éxito del registro del pedido
                        } else {
                            request.setAttribute("mensajeError", "No se pudo registrar el pedido correctamente.");
                        }
                    }
                    break;

                case "Eliminar":
                    int indice = Integer.parseInt(request.getParameter("indice"));
                    listaProductos.remove(indice - 1);
                    item = 0;
                    for (pedidoProveedorVO pedProvVO : listaProductos) {
                        pedProvVO.setItem(++item);
                    }
                    totalPagar = 0.0;
                    for (int i = 0; i < listaProductos.size(); i++) {
                        totalPagar += listaProductos.get(i).getDpro_subtotal();
                    }
                    request.setAttribute("provVO", provVO);
                    request.setAttribute("pr", prVO);
                    request.setAttribute("Total", totalPagar);
                    request.setAttribute("listaProductos", listaProductos);
                    break;
                case "Cancelar Pedido":
                    listaProductos.clear(); // Vaciar la lista de productos
                    totalPagar = 0.0; // Reiniciar el total a cero
                    request.setAttribute("listaProductos", listaProductos);
                    request.setAttribute("Total", totalPagar);
                    break;

            }

            request.setAttribute("error", error);
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("CrearPedidoProveedor.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
