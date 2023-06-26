/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.stockVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;

/**
 *
 * @author APRENDIZ
 */
public class stockDAO extends ConexionBd {

    ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private String sql;
    private double r;

    public stockDAO() {
    }

    public void actualizarstock(int id_prod, int prodstock_disp) {
        sql = "UPDATE tblproductos SET prodstock_disp = ? WHERE id_prod = ?";
        try {
            conexion = this.obtenerConexion();
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, prodstock_disp);
            puente.setInt(2, id_prod);
            puente.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public stockVO listarid(int id) {
        stockVO stVO = new stockVO();
        sql = "SELECT * FROM tblproductos WHERE id_prod = ?";
        try {
            conexion = this.obtenerConexion();
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, id);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                stVO.setId_prod(mensajero.getInt("id_prod"));
                stVO.setProdnombre(mensajero.getString("prodnombre"));
                stVO.setProdprecio(mensajero.getDouble("prodprecio"));
                stVO.setProd_id_categoria(mensajero.getInt("prod_id_categoria"));
                stVO.setProdestado(mensajero.getString("prodestado"));
                stVO.setProdstock_disp(mensajero.getInt("prodstock_disp"));
                stVO.setProd_descripcion(mensajero.getString("prod_descripcion"));
                stVO.setProd_id_prov(mensajero.getInt("prod_id_prov"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stVO;
    }
}
