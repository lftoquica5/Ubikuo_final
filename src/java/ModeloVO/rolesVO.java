/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Luisa
 */
public class rolesVO {
    
    private String id_Rol, rolnombre, rolestado;

    public rolesVO() {
    }

    public rolesVO(String id_Rol, String rolnombre, String rolestado) {
        this.id_Rol = id_Rol;
        this.rolnombre = rolnombre;
        this.rolestado = rolestado;
    }
    public String getId_Rol() {
        return id_Rol;
    }

    public void setId_Rol(String id_Rol) {
        this.id_Rol = id_Rol;
    }

    public String getRolnombre() {
        return rolnombre;
    }

    public void setRolnombre(String rolnombre) {
        this.rolnombre = rolnombre;
    }

    public String getRolestado() {
        return rolestado;
    }

    public void setRolestado(String rolestado) {
        this.rolestado = rolestado;
    }

    

}
