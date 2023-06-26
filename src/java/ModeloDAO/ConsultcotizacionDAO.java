
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloDAO.*;
import ModeloVO.consultcotizacionVO;
import ModeloVO.consultcotizacionVO;
import ModeloVO.cotizacionVO;
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
public class ConsultcotizacionDAO extends ConexionBd{
    
       ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente ,smt1,smt2;
    private ResultSet mensajero;
    private boolean operacion = false; //resultado de la ejecuion
    private String sql; //peticiones
    
    consultcotizacionVO ccotVO = new consultcotizacionVO();
    
     public ConsultcotizacionDAO(consultcotizacionVO ccotVO) {
        super();
        try {
            //conectarse a la base de datos
            conexion = this.obtenerConexion();
        } catch (Exception e) {

            Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ConsultcotizacionDAO() {
    }
    
   public ArrayList<consultcotizacionVO> listarCot() {
    ArrayList<consultcotizacionVO> listaCotizaciones = new ArrayList<>();

    try {
        conexion = this.obtenerConexion();
        sql = "SELECT `tblcotizaciones`.`id_cot` AS `cotizacion`,`tblclientes`.`id_cliente` AS `documento`, `tblclientes`.`clinombre` AS `cliente`, `tblusuarios`.`usunombre`, `tblcotizaciones`.`cotfecha`, `tblcotizaciones`.`Totalcot`, `tblcotizaciones`.`cotestado`\n" +
"FROM `tblcotizaciones` \n" +
"	LEFT JOIN `tblclientes` ON `tblcotizaciones`.`cot_id_cliente` = `tblclientes`.`id_cliente` \n" +
"	LEFT JOIN `tblusuarios` ON `tblcotizaciones`.`cot_id_usuario` = `tblusuarios`.`id_usuario` order by id_cot DESC;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery();

        while (mensajero.next()) {
            int Ncotizacion = mensajero.getInt("cotizacion");
            int Ndocumento = mensajero.getInt("documento");
            double Ctotal = mensajero.getDouble("Totalcot");
            String cliente = mensajero.getString("cliente");
            String usuario = mensajero.getString("usunombre");
            String estado = mensajero.getString("cotestado");
            String fecha = mensajero.getString("cotfecha");

            consultcotizacionVO ccotVO = new consultcotizacionVO(Ncotizacion,Ndocumento, Ctotal, cliente, usuario, estado, fecha);
            listaCotizaciones.add(ccotVO);
        }
    } catch (Exception e) {
        Logger.getLogger(ConsultcotizacionDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(ConsultcotizacionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return listaCotizaciones;
}
   
  public ArrayList<consultcotizacionVO> listarDetCot(int cotizacionid) {
    ArrayList<consultcotizacionVO> listadetCotizaciones = new ArrayList<>();

    try {
        conexion = this.obtenerConexion();
        sql = "SELECT `detalles_cotizacion`.`dc_id_prod` AS `DC_idproducto`, `tblproductos`.`prodnombre` AS `DC_nproducto`, `detalles_cotizacion`.`dc_cantidad` AS `DC_cantidad`, `detalles_cotizacion`.`precio` AS `DC_precio`, (`detalles_cotizacion`.`dc_cantidad` * `detalles_cotizacion`.`precio`) AS `subtotal` FROM `detalles_cotizacion` LEFT JOIN `tblproductos` ON `detalles_cotizacion`.`dc_id_prod` = `tblproductos`.`id_prod` WHERE `detalles_cotizacion`.id_cot = ?";
        puente = conexion.prepareStatement(sql);
        puente.setInt(1, cotizacionid);
        mensajero = puente.executeQuery();

        while (mensajero.next()) {
            int DC_idproducto = mensajero.getInt("DC_idproducto");
            String DC_nproducto = mensajero.getString("DC_nproducto");
            int DC_cantidad = mensajero.getInt("DC_cantidad");
            double DC_precio = mensajero.getDouble("DC_precio");
            double DC_subtotal = mensajero.getDouble("subtotal");

            consultcotizacionVO ccotVO = new consultcotizacionVO( DC_idproducto,  DC_cantidad, DC_precio,  DC_subtotal,  DC_nproducto);

            listadetCotizaciones.add(ccotVO);
        }
    } catch (Exception e) {
        Logger.getLogger(ConsultcotizacionDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(ConsultcotizacionDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return listadetCotizaciones;
}
}

    
