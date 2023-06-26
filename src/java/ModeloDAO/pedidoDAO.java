/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;



import ModeloVO.cotizacionVO;
import ModeloVO.pedidoVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;

/**
 *
 * @author WIN
 */
public class pedidoDAO extends ConexionBd {
    
    ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente ,smt1,smt2;
    private ResultSet mensajero;
    private boolean operacion = false; //Lo que me retorna la ejecición
    private String sql; //Peticiones
    private int r;

    pedidoVO pedVO = new pedidoVO();

    public pedidoDAO(pedidoVO pedVO) {
        super();
        try {
            //Conexion BD
            conexion = this.obtenerConexion();
        } catch (Exception e) {

            Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public pedidoDAO(){}
    
    public int idPedido() {
        int id_ped = 0;
        sql = "select max(id_ped)from tblpedido";
        try {
            conexion = this.obtenerConexion();
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                id_ped = mensajero.getInt(1);
            }
        } catch (Exception e) {
        }
        return id_ped;
    }
    public int guardarPedido(pedidoVO pedVO) {

        sql = "insert into tblpedido (ped_id_cliente,ped_id_usuario,Totalvalor,pedestado) values (?,?,?,?)";
        try {
            conexion = this.obtenerConexion();
            smt1 = conexion.prepareStatement(sql);
            smt1.setInt(1, pedVO.getPed_id_cliente());
            smt1.setInt(2, pedVO.getPed_id_usuario());
            smt1.setDouble(3, pedVO.getTotal());
            smt1.setString(4, pedVO.getPedestado());

            smt1.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(cotizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(cotizacionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return r;
    }
    public int guardarDetallePedido(pedidoVO pedVO) {

        sql = "insert into detalles_pedido (id_pedido,dp_id_producto,dp_cantidad,dp_precio) values (?,?,?,?)";
        try {
            conexion = this.obtenerConexion();
            smt2 = conexion.prepareStatement(sql);
            smt2.setInt(1, pedVO.getId_ped());
            smt2.setInt(2, pedVO.getDp_id_producto());
            smt2.setInt(3, pedVO.getDp_cantidad());
            smt2.setDouble(4, pedVO.getPrecio());
            smt2.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(cotizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(cotizacionDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return r;

    }
    public ArrayList<pedidoVO> consultarDatos() {
    ArrayList<pedidoVO> resultado = new ArrayList<>();

    try {
        conexion = this.obtenerConexion();
        smt2 = conexion.prepareStatement(sql);

        // Ejecutar la consulta utilizando la vista
       sql = "SELECT cotizacion, cliente, usunombre, cotfecha, Totalcot, cotestado FROM consultarcotizaciones";
       mensajero = puente.executeQuery();

        // Recorrer los resultados y crear objetos personalizados
        while (mensajero.next()) {
            int columna1 = mensajero.getInt("cotizacion");
        String columna2 = mensajero.getString("cliente");
        String columna3 = mensajero.getString("usunombre");
        Timestamp columna4 = mensajero.getTimestamp("cotfecha");
        double columna5 = mensajero.getDouble("Totalcot");
        String columna6 = mensajero.getString("cotestado");

   
            

            // Crear un objeto personalizado y agregarlo al ArrayList
            pedidoVO pdVO = new pedidoVO(columna1, columna2, columna3, columna4, columna5, columna6);
            resultado.add(pdVO);
        }

      
    } catch (Exception e) {
        e.printStackTrace();
    }

    return resultado;
}
    public boolean actualizarRegistro(pedidoVO pedVO) {
    try {
        conexion = this.obtenerConexion();
        sql = "UPDATE tblpedido SET pedestado = ? WHERE id_ped = ?";
        puente = conexion.prepareStatement(sql);
        puente.setString(1, pedVO.getPedestado());
        puente.setInt(2, pedVO.getId_ped());
        puente.executeUpdate();
        operacion = true;
        
        
    } catch (Exception e) {
        Logger.getLogger(pedidoDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
          
        } catch (Exception e) {
            Logger.getLogger(pedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return operacion;

}
    
}
