
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ClienteDAO;
import ModeloDAO.pedidoDAO;
import ModeloDAO.productosDAO;
import ModeloDAO.stockDAO;
import ModeloVO.ClienteVO;
import ModeloVO.pedidoVO;
import ModeloVO.productosVO;
import ModeloVO.stockVO;
import ModeloVO.usuarioVO;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author WIN
 */
@WebServlet(name = "PedidoControlador", urlPatterns = {"/Pedido"})
public class PedidoControlador extends HttpServlet {

    stockVO stVO = new stockVO();
    stockDAO stDAO = new stockDAO();
    ClienteDAO cdao = new ClienteDAO();
    ClienteVO cvo = new ClienteVO();
    productosVO prVO = new productosVO();
    productosDAO prDAO = new productosDAO();
    pedidoVO pdVO = new pedidoVO();
    pedidoDAO pdDAO = new pedidoDAO();
    usuarioVO usuVO = new usuarioVO();
    List<pedidoVO> listaProd = new ArrayList<>();
    int idProducto, idpedido;
    String descripcion;
    int cantidad, item, cod;
    double precio, subtotal, total;
    String numeroserie;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        String producto, idproducto;

        switch (accion) {
            case "buscarcliente":
                String documento = request.getParameter("ped_id_cliente");
                cvo.setId_cliente(documento);
                cvo = cdao.buscar(documento);
                request.setAttribute("c", cvo);

                break;

            case "buscarproducto":
                String id = request.getParameter("dp_id_prod");
                prVO = prDAO.listaridD(id);
                request.setAttribute("c", cvo);

                request.setAttribute("pr", prVO);
                break;
            case "agregarproducto":
                item = item + 1;

                cod = Integer.parseInt(prVO.getId_prod());

                descripcion = request.getParameter("nomproducto");
                cantidad = Integer.parseInt(request.getParameter("cantidad"));

                try {

                    precio = Double.parseDouble(request.getParameter("precio"));
                    subtotal = (int) (cantidad * precio);

                    pdVO = new pedidoVO();

                    pdVO.setItem(item);
                    pdVO.setDp_id_producto(cod);
                    pdVO.setNombreprod(descripcion);
                    pdVO.setDp_cantidad(cantidad);
                    pdVO.setPrecio(precio);
                    pdVO.setSubtotal(subtotal);
                    pdVO.setTotal(total);

                    listaProd.add(pdVO);

                    total = 0.0;
                    for (int i = 0; i < listaProd.size(); i++) {
                        total = total + listaProd.get(i).getSubtotal();
                    }
                    request.setAttribute("lista", listaProd);
                    request.setAttribute("Total", total);
                    request.setAttribute("pr", prVO);
                    request.setAttribute("c", cvo);

                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }

                break;

            case "generarpedido":
                if (listaProd.isEmpty()) {
                    String mensajeError = "No se puede generar una cotización sin productos. Agregue al menos un producto antes de generar la cotización.";
                    request.setAttribute("mensajeError", mensajeError);
                } else {
                    //Guardar pedido
                    int usuario = Integer.parseInt(request.getParameter("usuarioId"));

                    pdVO.setPed_id_cliente(Integer.parseInt(cvo.getId_cliente()));
                    pdVO.setPed_id_usuario(usuario);
                    pdVO.setTotal(total);
                    pdVO.setPedestado("pendiente");
                    pdDAO.guardarPedido(pdVO);

                    //Guardar detalles de pedido
                    idpedido = pdDAO.idPedido();
                    if (listaProd.size() > 0) {
                        for (int i = 0; i < listaProd.size(); i++) {
                            pdVO = new pedidoVO();
                            pdVO.setId_ped(idpedido);
                            pdVO.setDp_id_producto(listaProd.get(i).getDp_id_producto());
                            pdVO.setDp_cantidad(listaProd.get(i).getDp_cantidad());
                            pdVO.setPrecio(listaProd.get(i).getPrecio());

                            pdDAO.guardarDetallePedido(pdVO);

                        }
                    }
                    //Actualizar
                    for(int i = 0; i < listaProd.size(); i++){
                        int Cantidad = listaProd.get(i).getDp_cantidad();
                        int prod = listaProd.get(i).getDp_id_producto();
                        stVO = stDAO.listarid(prod);
                        int sac = stVO.getProdstock_disp()-cantidad;
                        stDAO.actualizarstock(prod,sac);
                    }
                    request.getSession().removeAttribute("lista");
                    request.getSession().removeAttribute("item");
                    request.getSession().removeAttribute("Total");
                    request.setAttribute("RegistroExitoso", "Pedido creado con éxito");
                }
                break;
                case "Eliminar":
                    int indice = Integer.parseInt(request.getParameter("indice"));
                    listaProd.remove(indice - 1);
                    item = 0;
                    for (pedidoVO pedProvVO: listaProd) {
                       pedProvVO.setItem(++item);
                    }
                    total = 0.0;
                    for (int i = 0; i < listaProd.size(); i++) {
                        total += listaProd.get(i).getSubtotal();
                    }
                     request.setAttribute("lista", listaProd);
                    request.setAttribute("Total", total);
                    request.setAttribute("pr", prVO);
                     request.setAttribute("c", cvo);
                     
                     break;
                     case "cancelar":
    listaProd.clear(); // Limpiar la lista de productos
    item = 0; // Restablecer el contador de ítems
    total = 0.0; // Restablecer el total
    request.getSession().removeAttribute("lista"); // Eliminar la lista de productos de la sesión
    request.getSession().removeAttribute("item"); // Eliminar el contador de ítems de la sesión
    request.getSession().removeAttribute("Total"); // Eliminar el total de la sesión
   
    break;
                     
                     case "actualizar":
         
        int idString = Integer.parseInt(request.getParameter("id_ped"));
        String pedestado = request.getParameter("pedestado");

           pdVO.setId_ped(idString);
           pdVO.setPedestado(pedestado);
           pdDAO.actualizarRegistro(pdVO);
           request.setAttribute("MensajeExito", "Estado del Pedido ha  actualizado con Exito");
           request.getRequestDispatcher("pedido_1.jsp").forward(request, response);
             
             break;
    
    
   
            default:
                pdVO = new pedidoVO();
                listaProd.clear();
                item = 0;
                total = 0.0;

                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                request.getSession().removeAttribute("lista");
                request.getSession().removeAttribute("item");
                request.getSession().removeAttribute("Total");
                request.getSession().invalidate();
                
                request.getRequestDispatcher("CrearPedido.jsp").forward(request, response);
        }

        request.getRequestDispatcher("CrearPedido.jsp").forward(request, response);

    }
    private String generarTablaHTML(List<pedidoVO> listaProductos) {
        StringBuilder sb = new StringBuilder();

        sb.append("<table class=\"tabla1\" id=\"tablaProductos\">");
        sb.append("<thead>");
        sb.append("<tr>");
        sb.append("<th>Item</th>");
        sb.append("<th>Idproducto</th>");
        sb.append("<th>Producto</th>");
        sb.append("<th>Cantidad</th>");
        sb.append("<th>Precio unitario</th>");
        sb.append("<th>Subtotal</th>");
        sb.append("<th class=\"action\">Acciones</th>");
        sb.append("</tr>");
        sb.append("</thead>");
        sb.append("<tbody>");

        for (pedidoVO producto : listaProductos) {
            sb.append("<tr>");
            sb.append("<td>").append(producto.getItem()).append("</td>");
            sb.append("<td>").append(producto.getDp_id_producto()).append("</td>");
            sb.append("<td>").append(producto.getNombreprod()).append("</td>");
            sb.append("<td>").append(producto.getDp_cantidad()).append("</td>");
            sb.append("<td>").append(producto.getPrecio()).append("</td>");
            sb.append("<td>").append(producto.getSubtotal()).append("</td>");
            sb.append("<td class=\"d-flex\">");
            sb.append("<a class=\"btn btn-danger\" style=\"margin-left: 10px\" onclick=\"borrarProducto(").append(producto.getItem()).append(")\">Borrar</a>");
            sb.append("</td>");
            sb.append("</tr>");
        }

        sb.append("</tbody>");
        sb.append("</table>");

        return sb.toString();
    }

    private double calcularTotal(List<pedidoVO> listaProductos) {
        double total = 0.0;

        for (pedidoVO producto : listaProductos) {
            total += producto.getSubtotal();
        }

        return total;
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



