/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.pedidoProveedorVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;
import util.Crud;

/**
 *
 * @author Alexander
 */
public class pedidoProveedorDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    public pedidoProveedorDAO() {
    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public int obtenerUltimoIdPedido() {
        int idPedido = 0;
        sql = "SELECT MAX(id_proped) FROM tblpedidos_proveedor";
        try {
            conexion = this.obtenerConexion();
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();

            if (mensajero.next()) {
                idPedido = mensajero.getInt(1);
            }
        } catch (Exception e) {
        }
        return idPedido;
    }

    public boolean guardarPedido(pedidoProveedorVO pedProvVO) {
        sql = "INSERT INTO tblpedidos_proveedor (ped_id_proveedor, id_usuario, Total_proped) VALUES (?,?,?)";
        try {
            conexion = this.obtenerConexion();
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, pedProvVO.getPed_id_proveedor());
            puente.setInt(2, pedProvVO.getId_usuario());
            puente.setDouble(3, pedProvVO.getTotal_proped());
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public boolean agregarDetallesPedido(pedidoProveedorVO pedProvVO) {
        sql = "INSERT INTO detalles_propedido (dpro_id_pedido, dpro_id_producto, dpro_cantidad, dpro_preciocompra, dpro_subtotal) VALUES (?,?,?,?,?)";
        try {
            conexion = this.obtenerConexion();
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, pedProvVO.getDpro_id_pedido());
            puente.setString(2, pedProvVO.getDpro_id_producto());
            puente.setInt(3, pedProvVO.getDpro_cantidad());
            puente.setDouble(4, pedProvVO.getDpro_preciocompra());
            puente.setDouble(5, pedProvVO.getDpro_subtotal());
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public ArrayList<pedidoProveedorVO> listar() {
        ArrayList<pedidoProveedorVO> listaPedidos = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT * FROM tblpedidos_proveedor;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery(); // Ejecutar la consulta y obtener el ResultSet
            while (mensajero.next()) {
                pedidoProveedorVO pedidoVO = new pedidoProveedorVO(
                        mensajero.getString(1), // id_proped
                        mensajero.getInt(2), // ped_id_proveedor
                        mensajero.getInt(3), // id_usuario
                        mensajero.getString(4), // proped_fecha
                        mensajero.getDouble(5), // Total_proped
                        mensajero.getString(6) // propedestado
                );
                listaPedidos.add(pedidoVO);
            }

        } catch (Exception e) {
            Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaPedidos;
    }

    public ArrayList<pedidoProveedorVO> listarActividad() {
        ArrayList<pedidoProveedorVO> listaActividades = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT tipo, id, id_cliente, id_usuario, fecha, total, estado FROM vista_ultima_actividad";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                pedidoProveedorVO actividad = new pedidoProveedorVO(
                        mensajero.getString("tipo"),
                        mensajero.getString("id"),
                        mensajero.getString("id_cliente"),
                        mensajero.getString("id_usuario"),
                        mensajero.getString("fecha"),
                        mensajero.getString("total"),
                        mensajero.getString("estado")
                );
                listaActividades.add(actividad);
            }
        } catch (Exception e) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaActividades;
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegisro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
