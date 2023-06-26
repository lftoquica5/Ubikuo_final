/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author APRENDIZ
 */
public class stockVO {
    
    private int id_prod,prod_id_categoria,prodstock_disp,prod_id_prov;
    private double prodprecio;
    private String prodnombre,prodestado,prod_descripcion;

    public stockVO(int id_prod, int prod_id_categoria, int prodstock_disp, int prod_id_prov, double prodprecio, String prodnombre, String prodestado, String prod_descripcion) {
        this.id_prod = id_prod;
        this.prod_id_categoria = prod_id_categoria;
        this.prodstock_disp = prodstock_disp;
        this.prod_id_prov = prod_id_prov;
        this.prodprecio = prodprecio;
        this.prodnombre = prodnombre;
        this.prodestado = prodestado;
        this.prod_descripcion = prod_descripcion;
    }
    
    public stockVO(){}

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public int getProd_id_categoria() {
        return prod_id_categoria;
    }

    public void setProd_id_categoria(int prod_id_categoria) {
        this.prod_id_categoria = prod_id_categoria;
    }

    public int getProdstock_disp() {
        return prodstock_disp;
    }

    public void setProdstock_disp(int prodstock_disp) {
        this.prodstock_disp = prodstock_disp;
    }

    public int getProd_id_prov() {
        return prod_id_prov;
    }

    public void setProd_id_prov(int prod_id_prov) {
        this.prod_id_prov = prod_id_prov;
    }

    public double getProdprecio() {
        return prodprecio;
    }

    public void setProdprecio(double proprecio) {
        this.prodprecio = proprecio;
    }

    public String getProdnombre() {
        return prodnombre;
    }

    public void setProdnombre(String prodnombre) {
        this.prodnombre = prodnombre;
    }

    public String getProdestado() {
        return prodestado;
    }

    public void setProdestado(String prodestado) {
        this.prodestado = prodestado;
    }

    public String getProd_descripcion() {
        return prod_descripcion;
    }

    public void setProd_descripcion(String prod_descripcion) {
        this.prod_descripcion = prod_descripcion;
    }
    
    
    
}
