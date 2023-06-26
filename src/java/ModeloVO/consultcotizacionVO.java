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
public class consultcotizacionVO {
      int Ncotizacion,Dcumentocli,DC_idproducto,DC_cantidad;
  double Ctotal,DC_precio,DC_subtotal;
  
    String Ccliente,Cusuario,Cestado ,Cfecha,DC_nproducto;

    public consultcotizacionVO() {
    }

    public consultcotizacionVO(int Ncotizacion, int Dcumentocli, double Ctotal, String Ccliente, String Cusuario, String Cestado, String Cfecha) {
        this.Ncotizacion = Ncotizacion;
        this.Dcumentocli = Dcumentocli;
        this.Ctotal = Ctotal;
        this.Ccliente = Ccliente;
        this.Cusuario = Cusuario;
        this.Cestado = Cestado;
        this.Cfecha = Cfecha;
    }

   

    public int getNcotizacion() {
        return Ncotizacion;
    }

    public void setNcotizacion(int Ncotizacion) {
        this.Ncotizacion = Ncotizacion;
    }

    public int getDcumentocli() {
        return Dcumentocli;
    }

    public void setDcumentocli(int Dcumentocli) {
        this.Dcumentocli = Dcumentocli;
    }

    public double getCtotal() {
        return Ctotal;
    }

    public void setCtotal(double Ctotal) {
        this.Ctotal = Ctotal;
    }

    public String getCcliente() {
        return Ccliente;
    }

    public void setCcliente(String Ccliente) {
        this.Ccliente = Ccliente;
    }

    public String getCusuario() {
        return Cusuario;
    }

    public void setCusuario(String Cusuario) {
        this.Cusuario = Cusuario;
    }

    public String getCestado() {
        return Cestado;
    }

    public void setCestado(String Cestado) {
        this.Cestado = Cestado;
    }

    public String getCfecha() {
        return Cfecha;
    }

    public void setCfecha(String Cfecha) {
        this.Cfecha = Cfecha;
    }

    public consultcotizacionVO(int DC_idproducto, int DC_cantidad, double DC_precio, double DC_subtotal, String DC_nproducto) {
        this.DC_idproducto = DC_idproducto;
        this.DC_cantidad = DC_cantidad;
        this.DC_precio = DC_precio;
        this.DC_subtotal = DC_subtotal;
        this.DC_nproducto = DC_nproducto;
    }

    public int getDC_idproducto() {
        return DC_idproducto;
    }

    public void setDC_idproducto(int DC_idproducto) {
        this.DC_idproducto = DC_idproducto;
    }

    public int getDC_cantidad() {
        return DC_cantidad;
    }

    public void setDC_cantidad(int DC_cantidad) {
        this.DC_cantidad = DC_cantidad;
    }

    public double getDC_precio() {
        return DC_precio;
    }

    public void setDC_precio(double DC_precio) {
        this.DC_precio = DC_precio;
    }

    public double getDC_subtotal() {
        return DC_subtotal;
    }

    public void setDC_subtotal(double DC_subtotal) {
        this.DC_subtotal = DC_subtotal;
    }

    public String getDC_nproducto() {
        return DC_nproducto;
    }

    public void setDC_nproducto(String DC_nproducto) {
        this.DC_nproducto = DC_nproducto;
    }

    

   

   
    
    
}