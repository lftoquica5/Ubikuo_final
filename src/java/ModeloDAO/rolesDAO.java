/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.rolesVO;
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
 * @author Luisa
 */
public class rolesDAO extends ConexionBd implements Crud {

    ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_Rol = "", rolnombre = "", rolestado="";

    public rolesDAO() {
    }

    public rolesDAO(rolesVO rolVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            id_Rol = rolVO.getId_Rol();
            rolnombre = rolVO.getRolnombre();
            rolestado = rolVO.getRolestado();
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblroles(rolnombre, estado) values (?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolnombre);
            puente.setString(2, rolestado);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            //independimiente que no haga 
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "UPDATE tblroles SET rolnombre = ?, estado = ? WHERE (id_Rol = ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolnombre);
            puente.setString(2, rolestado);
            puente.setString(3, id_Rol);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            //independimiente que no haga 
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegisro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<rolesVO> listar() {
        ArrayList<rolesVO> ListaRoles = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblroles;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                rolesVO rolVO = new rolesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));
                ListaRoles.add(rolVO);
            }
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ListaRoles;
    }
    public ArrayList<rolesVO> listarSelect() {
        ArrayList<rolesVO> ListaRoles = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
            sql = "select * from tblroles where estado = 'activo';";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                rolesVO rolVO = new rolesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));
                ListaRoles.add(rolVO);
            }
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ListaRoles;
    }
    

    public ArrayList<rolesVO> listarInicio(String IdUsuario) {
        ArrayList<rolesVO> listaRoles = new ArrayList<>();/*se creo el objeto*/

        try {
            conexion = this.obtenerConexion();
            sql = "SELECT usu_id_rol, id_usuario FROM tblusuarios  where id_usuario = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, IdUsuario);
            //remplazar los interrogantes
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                rolesVO rolVO = new rolesVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));
                listaRoles.add(rolVO);
            }
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaRoles;
    }

    public int getTotalRoles() {
        int totalRoles = 0;
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT COUNT(*) AS total_roles FROM tblroles";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery(); // Ejecutar la consulta y obtener el resultado
            if (mensajero.next()) {
                totalRoles = mensajero.getInt("total_roles");
            }
        } catch (Exception e) {
            Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(rolesDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return totalRoles;
    }

}
