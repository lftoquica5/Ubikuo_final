/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.pedidoProveedorVO;
import ModeloVO.productosVO;
import ModeloVO.usuarioVO;
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
 * @author Alex
 */
public class consultaPedProvDAO extends ConexionBd implements Crud {

    ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private double Total_proped;
    private int ped_id_proveedor, id_usuario;
    private String id_proped, proped_fecha, propedestado;

    public consultaPedProvDAO() {
    }

    public consultaPedProvDAO(pedidoProveedorVO pedProvVO) {
        super(); // Llamar al constructor de la superclase DAO pasando la conexión como argumento
        try {
            conexion = this.obtenerConexion();
            // Traer los datos del VO al DAO 
            id_usuario = pedProvVO.getId_usuario();
            id_proped = pedProvVO.getId_proped();
            ped_id_proveedor = pedProvVO.getPed_id_proveedor();
            proped_fecha = pedProvVO.getProped_fecha();
            Total_proped = pedProvVO.getTotal_proped();
            propedestado = pedProvVO.getPropedestado();
        } catch (Exception e) {
            Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); // Implementa la lógica para agregar un registro
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            conexion = this.obtenerConexion();
            sql = "UPDATE tblpedidos_proveedor SET propedestado = ? WHERE id_proped = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, propedestado);
            puente.setString(2, id_proped);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(pedidoProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public ArrayList<pedidoProveedorVO> listarProductosPorPedido(String idPedido) {
    ArrayList<pedidoProveedorVO> listaProductos = new ArrayList<>();

    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * FROM  detallespedidoproveedor where id_proped = ? ";
        puente = conexion.prepareStatement(sql);
        puente.setString(1, idPedido);
        mensajero = puente.executeQuery();
        while (mensajero.next()) {
            pedidoProveedorVO pedProvVO = new pedidoProveedorVO(mensajero.getString(1), mensajero.getInt(2), mensajero.getString(3), mensajero.getString(4),
                    mensajero.getInt(5), mensajero.getDouble(6), mensajero.getDouble(7));
            listaProductos.add(pedProvVO);
        }
    } catch (Exception e) {
        Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return listaProductos;
}

    public int getTotalPedidosPendientes() {
    int totalPedidosPendientes = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT COUNT(*) AS total_pedidos_pendientes FROM tblpedidos_proveedor WHERE propedestado = 'pendiente'";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery();
        if (mensajero.next()) {
            totalPedidosPendientes = mensajero.getInt("total_pedidos_pendientes");
        }
    } catch (Exception e) {
        Logger.getLogger(consultaPedProvDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(consultaPedProvDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return totalPedidosPendientes;
}

public int getTotalPedidosEnProceso() {
    int totalPedidosEnProceso = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT COUNT(*) AS total_pedidos_en_proceso FROM tblpedidos_proveedor WHERE propedestado = 'en_proceso'";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery();
        if (mensajero.next()) {
            totalPedidosEnProceso = mensajero.getInt("total_pedidos_en_proceso");
        }
    } catch (Exception e) {
        Logger.getLogger(consultaPedProvDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(consultaPedProvDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return totalPedidosEnProceso;
}

public int getTotalPedidosEntregados() {
    int totalPedidosEntregados = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT COUNT(*) AS total_pedidos_entregados FROM tblpedidos_proveedor WHERE propedestado = 'entregado'";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery();
        if (mensajero.next()) {
            totalPedidosEntregados = mensajero.getInt("total_pedidos_entregados");
        }
    } catch (Exception e) {
        Logger.getLogger(consultaPedProvDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(consultaPedProvDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return totalPedidosEntregados;
}

    @Override
    public boolean eliminarRegisro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
