/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Alexander
 */
public class pedidoProveedorVO {

    private String id_proped, proped_fecha, propedestado, id_dpro, dpro_id_producto, descripcionProducto;
    private int dpro_id_pedido, dpro_cantidad, ped_id_proveedor, id_usuario, item;
    private double Total_proped, dpro_subtotal, dpro_preciocompra;
    private String tipo, id, cliente_prov, id_usu, fecha, total, estado;

    public pedidoProveedorVO() {
    }

    public pedidoProveedorVO(String id_proped, String proped_fecha, String propedestado, String id_dpro, String dpro_id_producto, String descripcionProducto, int dpro_id_pedido, int dpro_cantidad, int ped_id_proveedor, int id_usuario, int item, double Total_proped, double dpro_subtotal, double dpro_preciocompra) {
        this.id_proped = id_proped;
        this.proped_fecha = proped_fecha;
        this.propedestado = propedestado;
        this.id_dpro = id_dpro;
        this.dpro_id_producto = dpro_id_producto;
        this.descripcionProducto = descripcionProducto;
        this.dpro_id_pedido = dpro_id_pedido;
        this.dpro_cantidad = dpro_cantidad;
        this.ped_id_proveedor = ped_id_proveedor;
        this.id_usuario = id_usuario;
        this.item = item;
        this.Total_proped = Total_proped;
        this.dpro_subtotal = dpro_subtotal;
        this.dpro_preciocompra = dpro_preciocompra;
    }

    public pedidoProveedorVO(String id_proped, int ped_id_proveedor, int id_usuario, String proped_fecha, double Total_proped, String propedestado) {
        this.id_proped = id_proped;
        this.ped_id_proveedor = ped_id_proveedor;
        this.id_usuario = id_usuario;
        this.proped_fecha = proped_fecha;
        this.Total_proped = Total_proped;
        this.propedestado = propedestado;
    }

    public pedidoProveedorVO(String id_proped, int ped_id_proveedor, String dpro_id_producto, String descripcionProducto, int dpro_cantidad, double dpro_preciocompra, double dpro_subtotal) {
        this.id_proped = id_proped;
        this.ped_id_proveedor = ped_id_proveedor;
        this.dpro_id_producto = dpro_id_producto;
        this.descripcionProducto = descripcionProducto;
        this.dpro_cantidad = dpro_cantidad;
        this.dpro_preciocompra = dpro_preciocompra;
        this.dpro_subtotal = dpro_subtotal;
    }

    public pedidoProveedorVO(String tipo, String id, String cliente_prov, String id_usu, String fecha, String total, String estado) {
        this.tipo = tipo;
        this.id = id;
        this.cliente_prov = cliente_prov;
        this.id_usu = id_usu;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCliente_prov() {
        return cliente_prov;
    }

    public void setCliente_prov(String cliente_prov) {
        this.cliente_prov = cliente_prov;
    }

    public String getId_usu() {
        return id_usu;
    }

    public void setId_usu(String id_usu) {
        this.id_usu = id_usu;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getId_proped() {
        return id_proped;
    }

    public void setId_proped(String id_proped) {
        this.id_proped = id_proped;
    }

    public String getProped_fecha() {
        return proped_fecha;
    }

    public void setProped_fecha(String proped_fecha) {
        this.proped_fecha = proped_fecha;
    }

    public String getPropedestado() {
        return propedestado;
    }

    public void setPropedestado(String propedestado) {
        this.propedestado = propedestado;
    }

    public String getId_dpro() {
        return id_dpro;
    }

    public void setId_dpro(String id_dpro) {
        this.id_dpro = id_dpro;
    }

    public String getDpro_id_producto() {
        return dpro_id_producto;
    }

    public void setDpro_id_producto(String dpro_id_producto) {
        this.dpro_id_producto = dpro_id_producto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public int getDpro_id_pedido() {
        return dpro_id_pedido;
    }

    public void setDpro_id_pedido(int dpro_id_pedido) {
        this.dpro_id_pedido = dpro_id_pedido;
    }

    public int getDpro_cantidad() {
        return dpro_cantidad;
    }

    public void setDpro_cantidad(int dpro_cantidad) {
        this.dpro_cantidad = dpro_cantidad;
    }

    public int getPed_id_proveedor() {
        return ped_id_proveedor;
    }

    public void setPed_id_proveedor(int ped_id_proveedor) {
        this.ped_id_proveedor = ped_id_proveedor;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public double getTotal_proped() {
        return Total_proped;
    }

    public void setTotal_proped(double Total_proped) {
        this.Total_proped = Total_proped;
    }

    public double getDpro_subtotal() {
        return dpro_subtotal;
    }

    public void setDpro_subtotal(double dpro_subtotal) {
        this.dpro_subtotal = dpro_subtotal;
    }

    public double getDpro_preciocompra() {
        return dpro_preciocompra;
    }

    public void setDpro_preciocompra(double dpro_preciocompra) {
        this.dpro_preciocompra = dpro_preciocompra;
    }

}
