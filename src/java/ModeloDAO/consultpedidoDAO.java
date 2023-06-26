/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.consultcotizacionVO;
import ModeloVO.consultpedidoVO;
import ModeloVO.pedidoVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;

/**
 *
 * @author diego
 */
public class consultpedidoDAO extends ConexionBd {
    
       ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente ,smt1,smt2;
    private ResultSet mensajero;
    private boolean operacion = false; //resultado de la ejecuion
    private String sql; //peticiones
    
    consultpedidoVO cpedVO = new consultpedidoVO();
    
     public consultpedidoDAO(consultcotizacionVO ccotVO) {
        super();
        try {
            //conectarse a la base de datos
            conexion = this.obtenerConexion();
        } catch (Exception e) {

            Logger.getLogger(consultpedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public consultpedidoDAO() {
    }
    
   public ArrayList<consultpedidoVO> listarPed() {
    ArrayList<consultpedidoVO> listaPedidos = new ArrayList<>();

    try {
        conexion = this.obtenerConexion();
        sql = "SELECT\n"
                + "  `tblpedido`.`id_ped` AS `n°pedido`,\n"
                + "  `tblclientes`.`id_cliente` AS `documento`,\n"
                + "  `tblclientes`.`clinombre` AS `nombre`,\n"
                + "  `tblusuarios`.`usunombre`,\n"
                + "  `tblpedido`.`pedfecha` AS `fecha`,\n"
                + "  `tblpedido`.`Totalvalor`,\n"
                + "  `tblpedido`.`pedestado`\n"
                + "FROM\n"
                + "  `tblpedido`\n"
                + "  LEFT JOIN `tblclientes` ON `tblpedido`.`ped_id_cliente` = `tblclientes`.`id_cliente`\n"
                + "  LEFT JOIN `tblusuarios` ON `tblpedido`.`ped_id_usuario` = `tblusuarios`.`id_usuario`\n"
                + "ORDER BY `id_ped` DESC;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery();

        while (mensajero.next()) {
            int Ncotizacion = mensajero.getInt("n°pedido");
            int Ndocumento = mensajero.getInt("documento");
            double Ctotal = mensajero.getDouble("Totalvalor");
            String cliente = mensajero.getString("nombre");
            String usuario = mensajero.getString("usunombre");
            String estado = mensajero.getString("pedestado");
            String fecha = mensajero.getString("fecha");

            consultpedidoVO cpedVO = new consultpedidoVO(Ncotizacion,Ndocumento, Ctotal, cliente, usuario, estado, fecha);
            listaPedidos.add(cpedVO);
        }
    } catch (Exception e) {
        Logger.getLogger(consultpedidoDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(consultpedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return listaPedidos;
}
public ArrayList<pedidoVO> listarProductos(int pedidoId) {
    ArrayList<pedidoVO> listaProductos = new ArrayList<>();

    try {
        conexion = this.obtenerConexion();
        sql = "SELECT `detalles_pedido`.`dp_id_producto` AS `DP_idproducto`, `tblproductos`.`prodnombre` AS `DP_nproducto`, `detalles_pedido`.`dp_cantidad` AS `DP_cantidad`, `detalles_pedido`.`precio`, (`detalles_pedido`.`dp_cantidad` * `detalles_pedido`.`precio`) AS `subtotal` FROM `detalles_pedido` LEFT JOIN `tblproductos` ON `detalles_pedido`.`dp_id_producto` = `tblproductos`.`id_prod` WHERE `detalles_pedido`.id_ped = ?;";
        puente = conexion.prepareStatement(sql);
        puente.setInt(1,pedidoId);
        mensajero = puente.executeQuery();
        while (mensajero.next()) {
             int DP_idproducto = mensajero.getInt("DP_idproducto");
            String DP_nproducto = mensajero.getString("DP_nproducto");
            int DP_cantidad = mensajero.getInt("DP_cantidad");
            double DP_precio = mensajero.getDouble("precio");
            double DP_subtotal = mensajero.getDouble("subtotal");
            pedidoVO pedVO = new pedidoVO(DP_cantidad,DP_idproducto,DP_nproducto,DP_precio,DP_subtotal);
            
            listaProductos.add(pedVO);
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

    
    
}
