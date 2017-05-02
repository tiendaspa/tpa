/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.Producto;
import com.entity.Tienda;

import com.services.ProductoServices;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.mail.MessagingException;
import javax.servlet.http.Part;

import javax.swing.JOptionPane;
import net.bootsfaces.utils.FacesMessages;
import org.primefaces.model.UploadedFile;


/**
 *
 * @author DAC-PC
 */

@ManagedBean
@SessionScoped
public class ProductoBean {
    
    private Producto pro = new Producto();
    private Producto productomodificar = new Producto();
    ProductoServices ps  = new ProductoServices();
    private ArrayList<Producto> listaproducto = new  ArrayList<>();
    private String pruebaimg;
    private String resource;
    private UploadedFile img;
    private boolean mostrardetalles = false;
    private boolean catalogo = true;
    
    public ProductoBean() {
        listar();
    }
    
            public void TransferFile (String fileName , InputStream in){
                Rutaimg ruta = new Rutaimg();
        try{
            Tienda p = Obtenertienda();
            String[] a = fileName.split("\\.");
            String extension = a[1].toLowerCase();
                    String nombre = a[0]+"."+extension;
                    
                    getPro().setImg(p.getIdTienda()+"/"+a[0]+"."+extension);
                  
                    getPro().setTienda(Obtenertienda());
                    
                    //ps.crear(getPro());
                    //setPro(new Producto());
                    
            OutputStream out = new FileOutputStream ( new File(ruta.getRutaproductos()+p.getIdTienda()+"\\"+nombre));
            
            int reader = 0;
            byte[] bytes = new byte [(int)getImg().getSize()];
            while ((reader = in.read(bytes)) != -1){
                out.write(bytes,0,reader);
            }  
            in.close();
            out.flush();
            out.close();
        } catch(IOException e){
            System.out.println(e.getMessage());   
        }
    }
        
            
            
            public void probar(){
              JOptionPane.showMessageDialog(null, "ente");
            }
            
        public void modificardatos(){
      
            String extValidate;
        if (getImg()!= null){
            String ext = getImg().getFileName();
            if (ext != null){
                extValidate = ext.substring(ext.indexOf(".")+1);
            } else{
                extValidate = "null";
            }
            
            if (extValidate.equals("jpg")){
                try{
                    
                    
                    TransferFile(getImg().getFileName(),getImg().getInputstream());
                    
                    ps.crear(getPro());
                    setPro(new Producto());
                    listar();
                }catch(IOException e){
                    
                }
            }
            
            
              try{
                    Thread.sleep(2000);
                }catch(InterruptedException e){}
            
        }
    }
    
    
    
    
     public Tienda Obtenertienda(){
        Tienda p= (Tienda) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("tienda");
        return p;
    }
    public void listar(){
        setListaproducto((ArrayList<Producto>) ps.listarproducto(Obtenertienda()));
      
        
    }
    public void verproducto(Long id){
      
        setProductomodificar(ps.verproducto(id));
        setMostrardetalles(true);
        setCatalogo(false);
        
    }
    public void mostrarcatalogo(){
    
        setMostrardetalles(false);
        setCatalogo(true);
    }
    public void modificar(){
        try {
           ps.modificar(getProductomodificar());
            setMostrardetalles(false);
            setCatalogo(true);  
            FacesMessages.info("Actualización exitosa!");
            listar();
        } catch (Exception e) {
            FacesMessages.error("No se ha podido modificar este producto, intentelo de nuevo");
        }
       
        
    }

    public ArrayList<Producto> getListaproducto() {
        return listaproducto;
    }

    public void setListaproducto(ArrayList<Producto> listaproducto) {
        this.listaproducto = listaproducto;
    }

    public String getPruebaimg() {
        return pruebaimg;
    }

    public void setPruebaimg(String pruebaimg) {
        this.pruebaimg = pruebaimg;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }
/*   public static void  main(String[] args){
        ProductoServices ps = new ProductoServices();
        long p = ps.ObtenerUltimo();
        System.out.println(p);
        
        
    }*/

    public UploadedFile getImg() {
        return img;
    }

    public void setImg(UploadedFile img) {
        this.img = img;
    }

    public Producto getPro() {
        return pro;
    }

    public void setPro(Producto pro) {
        this.pro = pro;
    }

    public Producto getProductomodificar() {
        return productomodificar;
    }

    public void setProductomodificar(Producto productomodificar) {
        this.productomodificar = productomodificar;
    }

    public boolean isMostrardetalles() {
        return mostrardetalles;
    }

    public void setMostrardetalles(boolean mostrardetalles) {
        this.mostrardetalles = mostrardetalles;
    }

    public boolean isCatalogo() {
        return catalogo;
    }

    public void setCatalogo(boolean catalogo) {
        this.catalogo = catalogo;
    }


}
