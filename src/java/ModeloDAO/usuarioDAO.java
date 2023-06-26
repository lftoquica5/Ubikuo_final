/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.usuarioVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionBd;
import util.Crud;

/**
 *
 * @author Luisa
 */
public class usuarioDAO extends ConexionBd implements Crud {

    ConexionBd conec = new ConexionBd();
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String id_usuario = "", usunombre = "", usuapellido = "", usudireccion = "", usutelefono = "", usuemail = "", usupassword = "", usuestado = "", usu_id_rol = "";

    public usuarioDAO() {
    }

    public usuarioDAO(usuarioVO usuVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            // traer los datos del VO al DAO 
            id_usuario = usuVO.getId_usuario();
            usunombre = usuVO.getUsunombre();
            usuapellido = usuVO.getUsuapellido();
            usudireccion = usuVO.getUsudireccion();
            usutelefono = usuVO.getUsutelefono();
            usuemail = usuVO.getUsuemail();
            usupassword = usuVO.getUsupassword();
            usuestado = usuVO.getUsuestado();
            usu_id_rol = usuVO.getUsu_id_rol();

        } catch (Exception e) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into tblusuarios(id_usuario,usunombre, usuapellido, usudireccion, usutelefono, usuemail, usuPassword, usuestado,usu_id_rol) values (?,?,?,?,?,?,SHA2(?,256),?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_usuario);
            puente.setString(2, usunombre);
            puente.setString(3, usuapellido);
            puente.setString(4, usudireccion);
            puente.setString(5, usutelefono);
            puente.setString(6, usuemail);
            puente.setString(7, usupassword);
            puente.setString(8, usuestado);
            puente.setString(9, usu_id_rol);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            //independimiente que no haga 
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);

            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update tblusuarios set usunombre = ?, usuapellido = ?, usudireccion = ?, usutelefono = ?, usuemail = ?, usuPassword =?, usuestado = ?,usu_id_rol = ? where id_usuario = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usunombre);
            puente.setString(2, usuapellido);
            puente.setString(3, usudireccion);
            puente.setString(4, usutelefono);
            puente.setString(5, usuemail);
            puente.setString(6, usupassword);
            puente.setString(7, usuestado);
            puente.setString(8, usu_id_rol);
            puente.setString(9, id_usuario);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            //independimiente que no haga 
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
    
    
    @Override
    public boolean eliminarRegisro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean iniciarSesion(String usuario, String clave) {
        try {
            conexion = this.obtenerConexion(); //metodo que no es propio del dato
            sql = "select * from tblusuarios where id_usuario=? and usupassword =SHA2(?,256) and usuestado = 'activo';";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_usuario);
            puente.setString(2, usupassword);
            mensajero = puente.executeQuery();
            if (mensajero.next()) { //busca busca y encuentra o no
                operacion = true; //si encuentra la operacion sera true
            }
        } catch (Exception e) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            //independimiente que no haga 
            try {
//                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public usuarioVO consultarPorId(String id_usuario) {
        usuarioVO usuVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "Select * from tblusuarios where id_usuario = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_usuario);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                usuVO = new usuarioVO(id_usuario, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4),
                        mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9));
                //private String usuId, usuNombre, usuEmail, usuPassword, usuEstado, usuRol, usuApellido, usuDireccion,usuTelefono;
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
        return usuVO;
    }

    public ArrayList<usuarioVO> listar() {

        ArrayList<usuarioVO> listaUsuarios = new ArrayList<>();
        try {
            conexion = this.obtenerConexion(); //metodo que no es propio del dato
            sql = "select * from tblusuarios;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                usuarioVO usuVO = new usuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4),
                        mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9));
                listaUsuarios.add(usuVO);
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
        return listaUsuarios;
    }

    public boolean actualizarContraseña(String documento, String nuevaContraseña) {
        try {
            conexion = this.obtenerConexion();
            // Verificar si el usuario existe
            String consultaUsuario = "SELECT id_usuario FROM tblusuarios WHERE id_usuario = ?";
            puente = conexion.prepareStatement(consultaUsuario);
            puente.setString(1, documento);
            ResultSet resultado = puente.executeQuery();

            if (resultado.next()) {
                // El usuario existe, realizar la actualización de la contraseña
                String consultaActualizacion = "UPDATE tblusuarios SET usuPassword = SHA2(?,256) WHERE id_usuario = ?";
                puente = conexion.prepareStatement(consultaActualizacion);
                puente.setString(1, nuevaContraseña);
                puente.setString(2, documento);
                puente.executeUpdate();
                operacion = true;
            } else {
                // El usuario no existe
                System.out.println("El usuario no existe en la base de datos.");
                operacion = false;
            }
        } catch (Exception e) {
            Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            operacion = false;
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(usuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public boolean verificarCorreoEnBaseDeDatos(String correo) {
        boolean correoExiste = false;
        try {
            conexion = this.obtenerConexion();
            // Realizar una consulta para verificar si el correo existe en la base de datos
            sql = "SELECT COUNT(*) AS count FROM tblusuarios WHERE usuemail = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, correo);
            ResultSet resultado = puente.executeQuery();
            if (resultado.next()) {
                int count = resultado.getInt("count");
                if (count > 0) {
                    correoExiste = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return correoExiste;
    }

    public int getTotalUsuarios() {
        int totalUsuarios = 0;
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT COUNT(*) AS total_usuarios FROM tblusuarios";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                totalUsuarios = mensajero.getInt("total_usuarios");
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
        return totalUsuarios;
    }

    public int getTotalUsuariosActivos() {
        int totalUsuariosActivos = 0;
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT COUNT(*) AS total_usuarios_activos FROM tblusuarios WHERE usuestado = 'activo'";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                totalUsuariosActivos = mensajero.getInt("total_usuarios_activos");
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
        return totalUsuariosActivos;
    }

    public int getTotalUsuariosInactivos() {
        int totalUsuariosInactivos = 0;
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT COUNT(*) AS total_usuarios_inactivos FROM tblusuarios WHERE usuestado = 'inactivo'";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                totalUsuariosInactivos = mensajero.getInt("total_usuarios_inactivos");
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
        return totalUsuariosInactivos;
    }
}
