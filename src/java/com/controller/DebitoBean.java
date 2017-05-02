/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.Debito;
import com.entity.Detalleventa;
import com.entity.Tienda;
import com.entity.Venta;
import com.services.DebitoServices;
import com.services.DetalleventaServices;
import java.util.ArrayList;
import java.util.Date;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.swing.JOptionPane;

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
    private ArrayList<Detalleventa> listadetalleventa = new ArrayList<>();
    private boolean mostrarcreditos = true;
    private boolean mostrardetalles = false;
    private Venta ventadatos = new Venta();
    private Date fechalimite = new Date();
    private double valorabono = 0;
    private double totaldeuda = 0;
    public DebitoBean() {
    listarcredito();
    }
    
    public void listarcredito(){
        setListadebitos((ArrayList<Debito>) ds.vercreditos(Obtenertienda()));
    }
    
    public void verventa(Venta c, long id, Date d, double valor){
        setVentadatos(detalleventaserv.consultar(Venta.class, id));
        setFechalimite(d);
        setListadetalleventa((ArrayList<Detalleventa>) detalleventaserv.verdetalleventa(c));
        setTotaldeuda(valor);
        
        setMostrarcreditos(false);
        setMostrardetalles(true);
        
    }
    public void ocultardetalles(){
        setMostrarcreditos(true);
        setMostrardetalles(false);
        setFechalimite(new Date());
        getListadetalleventa().clear();
        setVentadatos(new Venta());
        
    
    }
    public void abonar(){
        
    
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

}
