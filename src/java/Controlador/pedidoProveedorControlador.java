/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.consultaPedProvDAO;
import ModeloDAO.pedidoProveedorDAO;
import ModeloVO.pedidoProveedorVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "pedidoProveedorControlador", urlPatterns = {"/pedidoProveedor"})
public class pedidoProveedorControlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");

            String id_proped = request.getParameter("id_proped");
            int ped_id_proveedor = Integer.parseInt(request.getParameter("ped_id_proveedor"));
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            String proped_fecha = request.getParameter("proped_fecha");
            double Total_proped = Double.parseDouble(request.getParameter("Total_proped"));
            String propedestado = request.getParameter("propedestado");
            int opcion = Integer.parseInt(request.getParameter("opcion"));
            pedidoProveedorVO pedProvVO = new pedidoProveedorVO(id_proped, ped_id_proveedor, id_usuario, proped_fecha, Total_proped, propedestado);
            consultaPedProvDAO PedProvDAO = new consultaPedProvDAO(pedProvVO);

            switch (opcion) {
                case 1:
                    if (PedProvDAO.actualizarRegistro()) { //agregar registro
                        request.setAttribute("mensajeExito", "El estado se actualizo correctamente");
                    } else {
                        request.setAttribute("mensajeError", "El estado no se actualizo correctamente");
                    }
                    request.getRequestDispatcher("ConsultarPedidoProveedor.jsp").forward(request, response);
                    break;
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
