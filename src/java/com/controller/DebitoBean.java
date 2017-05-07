/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.Cliente;
import com.entity.Debito;
import com.entity.Detalleventa;
import com.entity.Mora;
import com.entity.Tienda;
import com.entity.Venta;
import com.services.DebitoServices;
import com.services.DetalleventaServices;
import com.services.MoraServices;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.swing.JOptionPane;
import net.bootsfaces.utils.FacesMessages;

/**
 *
 * @author DAC-PC
 */
@ManagedBean
@SessionScoped
public class DebitoBean {
    DebitoServices ds = new DebitoServices();
    private ArrayList<Debito> listadebitos = new ArrayList<>();
    DetalleventaServices detalleventaserv = new DetalleventaServices();
    MoraServices moraserv = new MoraServices();
    private ArrayList<Detalleventa> listadetalleventa = new ArrayList<>();
    private boolean mostrarcreditos = true;
    private boolean mostrardetalles = false;
    private boolean panelmora = false;
    private Venta ventadatos = new Venta();
    private Date fechalimite = new Date();
    private double valorabono = 0;
    private double totaldeuda = 0;
    private Debito debito = new Debito();
    private Cliente clientereportar = new Cliente();
    private Mora moracliente= new Mora();
    private Date fecha = new Date();
  
    public DebitoBean() {
    listarcredito();
    }
    
    public void listarcredito(){
        setListadebitos((ArrayList<Debito>) ds.vercreditos(Obtenertienda()));
    }

  
    public void ver(Venta c, long id, Date d, double valor, Debito iddeb){
        setVentadatos(detalleventaserv.consultar(Venta.class, id));
        setFechalimite(d);
        setListadetalleventa((ArrayList<Detalleventa>) detalleventaserv.verdetalleventa(c));
        setTotaldeuda(valor);
        
        setMostrarcreditos(false);
        setMostrardetalles(true);
         setDebito(iddeb);
    }
     
    
    public void ocultardetalles(){
        setMostrarcreditos(true);
        setMostrardetalles(false);
        setFechalimite(new Date());
        getListadetalleventa().clear();
        setVentadatos(new Venta());
        
    
    }
    public void abonar() throws IOException{
        if(getValorabono() > getDebito().getTotal() || getValorabono() <= 0){
            FacesMessages.warning("Por favor, inserte una cantidad correcta");
        }else{
          getDebito().setTotal(getDebito().getTotal() - getValorabono());
          if(getDebito().getTotal() == 0){
            getDebito().setEstado("Pagado");
            listarcredito();
              setMostrarcreditos(true);
              setMostrardetalles(false);
              getListadetalleventa().clear();
      
          }
          ds.modificar(getDebito());
          setTotaldeuda(getDebito().getTotal());
        }
    
    }
   
    
    public void reportar(Cliente c, Debito de){
        setPanelmora(true);
        setMostrarcreditos(false);
        setClientereportar(c);
        setDebito(de);
        
    }
    public void reportarcliente(){
       getMoracliente().setCliente(getClientereportar());
       getMoracliente().setTienda(Obtenertienda());
       getMoracliente().setTotal(getDebito().getTotal());
       moraserv.crear(getMoracliente());
       getDebito().setEstado("Reportado");
       ds.modificar(getDebito());
       FacesMessages.info(getMoracliente().getCliente().getNombre() + " A sido reportado por moroso!");
       setPanelmora(false);
       setMostrarcreditos(true);
    }
     public Tienda Obtenertienda(){
        Tienda p= (Tienda) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("tienda");
        return p;
    }

    public ArrayList<Debito> getListadebitos() {
        return listadebitos;
    }

    public void setListadebitos(ArrayList<Debito> listadebitos) {
        this.listadebitos = listadebitos;
    }

    public ArrayList<Detalleventa> getListadetalleventa() {
        return listadetalleventa;
    }

    public void setListadetalleventa(ArrayList<Detalleventa> listadetalleventa) {
        this.listadetalleventa = listadetalleventa;
    }

    public boolean isMostrarcreditos() {
        return mostrarcreditos;
    }

    public void setMostrarcreditos(boolean mostrarcreditos) {
        this.mostrarcreditos = mostrarcreditos;
    }

    public boolean isMostrardetalles() {
        return mostrardetalles;
    }

    public void setMostrardetalles(boolean mostrardetalles) {
        this.mostrardetalles = mostrardetalles;
    }

    public Venta getVentadatos() {
        return ventadatos;
    }

    public void setVentadatos(Venta ventadatos) {
        this.ventadatos = ventadatos;
    }

    public Date getFechalimite() {
        return fechalimite;
    }

    public void setFechalimite(Date fechalimite) {
        this.fechalimite = fechalimite;
    }

    public double getValorabono() {
        return valorabono;
    }

    public void setValorabono(double valorabono) {
        this.valorabono = valorabono;
    }

    public double getTotaldeuda() {
        return totaldeuda;
    }

    public void setTotaldeuda(double totaldeuda) {
        this.totaldeuda = totaldeuda;
    }

    public Debito getDebito() {
        return debito;
    }

    public void setDebito(Debito debito) {
        this.debito = debito;
    }

    public Cliente getClientereportar() {
        return clientereportar;
    }

    public void setClientereportar(Cliente clientereportar) {
        this.clientereportar = clientereportar;
    }

    public boolean isPanelmora() {
        return panelmora;
    }

    public void setPanelmora(boolean panelmora) {
        this.panelmora = panelmora;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Mora getMoracliente() {
        return moracliente;
    }

    public void setMoracliente(Mora moracliente) {
        this.moracliente = moracliente;
    }

}
